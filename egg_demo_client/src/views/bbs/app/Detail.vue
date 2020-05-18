<template>
<div class="blogArticle">
    <header class="header">
        <v-headerfour></v-headerfour>
    </header>
    <div class="main">
        <div class="col-md-9" id="comment">
            <article-content v-bind:article="article"></article-content>
            <commemt-content v-bind:comment="comment" v-on:change="changCommmer"></commemt-content>
            <comment-textarea v-bind:name="oldComment" v-bind:type="type" v-on:canel="canelCommit" v-on:submit="addComment"></comment-textarea>
        </div>
    </div>
</div>
</template>

<script>
    import headerfour from "../../../components/bbs/app/public/headerfour";
    import article_content from "../../../components/bbs/app/detail/article_content";
    import commemt_content from "../../../components/bbs/app/detail/commemt_content";
    import comment_textarea from "../../../components/bbs/app/detail/comment_textarea";

    let Base64 = require('js-base64').Base64; // 引入base64

    // 统计功能
    let bbsdemoFirebase = new Firebase("https://bbsdemo-db7da.firebaseio.com/");

export default {
    name: "#comment",
    components: {
        "v-headerfour": headerfour,
        "article-content": article_content,
        "commemt-content": commemt_content,
        "comment-textarea": comment_textarea,
    },
    data() {
        return {
            postid: '',
            commenter: "", // 评论人
            type: 0, // 0为评论作者 1为评论别人的评论
            oldComment: null,
            chosedIndex: -1, // 被选中的评论的index
            article: {
                title: '',
                time: '',
                counter: 0,
                content: '',
                taglist: [],
                pin: '',
                zan: '',
                author: '',
                posttype: '',
                avatar: '',
                description: ''
            },
            comment: [],
        }
    },
    methods: {
        // 添加点赞
        addPraise: function () {
            this.article.zan = this.article.zan - 1;
            const data1 = {
                is_removed: 0,
                post_id: this.postid,
                author_id: JSON.parse(window.localStorage.getItem('Login_data')).userdata.id
            };
            fetch('/bbsdev/addPraise', {
                method: 'post',
                headers: {
                    'Content-type': 'application/json',
                },
                body: JSON.stringify(data1)
            }).then(res => res.json()).then(res => {
                console.log(res)
                if (res.status == 200) {
                    if(res.data[0]){
                        return res.data[0];
                    }
                    return null;
                } else {
                    this.$message({
                        showClose: true,
                        message: '添加点赞失败',
                        type: 'error'
                    });
                }
            })
        },
        // 取消点赞
        cancelPraise: function () {
            this.article.zan = this.article.zan + 1;
            const data2 = {
                is_removed: true,
                post_id: this.postid,
                author_id: JSON.parse(window.localStorage.getItem('Login_data')).userdata.id
            };
            fetch('/bbsdev/deletePraise', {
                method: 'post',
                headers: {
                    'Content-type': 'application/json',
                },
                body: JSON.stringify(data2)
            }).then(res => res.json()).then(res => {
                console.log(res)
                if (res.status == 200) {
                    if(res.data[0]){
                        return res.data[0];
                    }
                    return null;
                } else {
                    this.$message({
                        showClose: true,
                        message: '取消点赞失败',
                        type: 'error'
                    });
                }
            })
        },
        // 获取评论与回复
        getComment: function (data) {
            const data = {
                post_id: this.postid
            };
            fetch('/bbsdev/getComment', {
                method: 'post',
                headers: {
                    'Content-type': 'application/json',
                },
                body: JSON.stringify(data)
            }).then(res => res.json()).then(res => {
                console.log(res)
                if (res.status == 200) {
                    // 获取评论信息
                    if (res.data) {
                        res.data.forEach(item1 => {
                            this.comment.push(item1);
                            // 获取回复信息
                            const data = {
                                comment_id: item1.comment_id
                            };
                            fetch('/bbsdev/getReply', {
                                method: 'post',
                                headers: {
                                    'Content-type': 'application/json',
                                },
                                body: JSON.stringify(data)
                            }).then(res => res.json()).then(res => {
                                console.log(res)
                                if (res.status == 200) {
                                    if (res.data) {
                                        res.data.forEach(item2 => {
                                            item1.reply.push(item2);
                                        })
                                    }
                                    return res.data;
                                } else {
                                    this.$message({
                                        showClose: true,
                                        message: '获取回复信息失败',
                                        type: 'error'
                                    });
                                }
                            })
                        })
                    }
                    return res.data;
                } else {
                    this.$message({
                        showClose: true,
                        message: '获取评论信息失败',
                        type: 'error'
                    });
                }
            })
        },
        // 添加评论与回复
        addComment: function (data) {
            if (this.type == 0) {
                this.comment.push({
                    name: JSON.parse(window.localStorage.getItem('Login_data')).userdata.username,
                    time: this.getTime(),
                    content: data,
                    reply: []
                });
                //服务器端变
                const data3 = {
                    content: data,
                    is_removed: 0,
                    post_id: this.postid,
                    author_id: JSON.parse(window.localStorage.getItem('Login_data')).userdata.id,
                    author_name: JSON.parse(window.localStorage.getItem('Login_data')).userdata.name,
                    comment_id: this.postid + JSON.parse(window.localStorage.getItem('Login_data')).userdata.id + this.getTime(),
                    reply: []
                };
                fetch('/bbsdev/addComment', {
                    method: 'post',
                    headers: {
                        'Content-type': 'application/json',
                    },
                    body: JSON.stringify(data3)
                }).then(res => res.json()).then(res => {
                    console.log(res)
                    if (res.status == 200) {
                        // 发表评论
                        if(res.data[0]){
                            return res.data[0];
                        }
                        return null;
                    } else {
                        this.$message({
                            showClose: true,
                            message: '发表评论失败',
                            type: 'error'
                        });
                    }
                })
            } else if (this.type == 1) {
                this.comment[this.chosedIndex].reply.push({
                    responder: JSON.parse(window.localStorage.getItem('Login_data')).userdata.username,
                    reviewers: this.comment[this.chosedIndex].name,
                    time: this.getTime(),
                    content: data
                });
                //服务器端变
                let replylist = this.comment[this.chosedIndex].reply;
                const data4 = {
                    comment_id: this.postid + JSON.parse(window.localStorage.getItem('Login_data')).userdata.id + this.getTime()
                    responder: JSON.parse(window.localStorage.getItem('Login_data')).userdata.username,
                    reviewers: this.comment[this.chosedIndex].name,
                    content: data,
                    is_removed: 0,
                    post_id: this.postid,
                    author_id: JSON.parse(window.localStorage.getItem('Login_data')).userdata.id,
                };
                fetch('/bbsdev/addReply', {
                    method: 'post',
                    headers: {
                        'Content-type': 'application/json',
                    },
                    body: JSON.stringify(data4)
                }).then(res => res.json()).then(res => {
                    console.log(res)
                    if (res.status == 200) {
                        // 发表回复
                        if(res.data[0]){
                            return res.data[0];
                        }
                        return null;
                    } else {
                        this.$message({
                            showClose: true,
                            message: '发表回复失败',
                            type: 'error'
                        });
                    }
                })

                this.type = 0;
            }
        },
        changCommmer: function (name, index) {
            this.oldComment = name;
            this.chosedIndex = index;
            this.type = 1;
        },
        canelCommit: function () {
            this.type = 0;
        },
        // 格式化时间
        getTime: function () {
            var now = new Date();
            var year = now.getFullYear();
            var month = now.getMonth() + 1;
            var day = now.getDate();
            var hour = now.getHours();
            var minutes = now.getMinutes();
            var seconds = now.getSeconds();
            month.length < 2 ? month = "0" + month : month;
            day.length < 2 ? day = "0" + day : day;
            hour.length < 2 ? hour = "0" + hour : hour;
            minutes.length < 2 ? minutes = "0" + minutes : minutes;
            seconds.length < 2 ? seconds = "0" + seconds : seconds;
            return year + "-" + month + "-" + day + " " + hour + ":" + minutes + ":" + seconds;
        },
        init: function () {
            this.postid = this.$route.query.id
            console.log(this.postid)
            // 获取资源详情数据
            const data = {
                id: this.postid
            };
            fetch('/bbsdev/getArticleListDetail', {
                method: 'post',
                headers: {
                    'Content-type': 'application/json',
                },
                body: JSON.stringify(data)
            }).then(res => res.json()).then(res => {
                console.log(res)
                if (res.status == 200) {
                    // 获取资源详情
                    this.articledetail = res.data[0];
                    if (this.articledetail) {
                        this.article.taglist = this.articledetail.taglist.split(','),
                        this.article.read = 10,
                        this.article.pin = this.articledetail.comment_count,
                        this.article.zan = this.articledetail.praise_count,
                        this.article.more = true,
                        this.article.avatar = 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png',
                        this.article.title = this.articledetail.id,
                        this.article.author = this.articledetail.author_name,
                        this.article.posttype = this.articledetail.posttype,
                        this.article.description = this.articledetail.title,
                        this.article.content = Base64.decode(this.articledetail.content),
                        this.article.time = moment(this.articledetail.createTime).format('YYYY-MM-DD HH:mm:ss')
                    }

                    // 总数 +1
                    bbsdemoFirebase.child("sum")
                        .transaction(function (current_counter) {
                            return (current_counter || 0) + 1;
                        });

                    return this.articledetail;
                } else {
                    this.$message({
                        showClose: true,
                        message: '获取资源详情失败',
                        type: 'error'
                    });
                }
            })
        }
    },
    mounted() {
        this.init();
        this.getComment();

        // 获取总数，并将总访问量展示在页面上
        bbsdemoFirebase.child("sum")
            .on("value", function(data) {
                var current_counter = data.val();
                if(current_counter > 1 ){
                    this.article.counter = current_counter
                };
            });
    }
};
</script>

<style scoped>
.blogArticle {
    background: #eee;
}
</style>

<template>
    <div class="blogArticle">
        <header class="header">
            <v-headerfour></v-headerfour>
        </header>
        <div class="main">
            <div class="col-md-9" id="comment">
                <article-content v-bind:article="article" v-if="sonRefresh" v-on:addPraise="addPraise"
                                 v-on:cancelPraise="cancelPraise"></article-content>
                <commemt-content v-bind:comment="comment" v-on:change="changCommmer"></commemt-content>
                <comment-textarea v-bind:name="oldComment" v-bind:type="type" v-on:canel="canelCommit"
                                  v-on:submit="addComment"></comment-textarea>
            </div>
        </div>
    </div>
</template>
<script>
    import headerfour from "../../../components/bbs/app/public/headerfour";
    import article_content from "../../../components/bbs/app/detail/article_content";
    import commemt_content from "../../../components/bbs/app/detail/commemt_content";
    import comment_textarea from "../../../components/bbs/app/detail/comment_textarea";
    import moment from 'moment';

    /*var Firebase = require("firebase");
    let firebaseconfig = {
        apiKey: "AIzaSyAtPlu-CFtSIK8qm8yX-35D5spRTjgeppk",
        authDomain: "bbsdemo-db7da.firebaseapp.com",
        databaseURL: "https://bbsdemo-db7da.firebaseio.com",
        projectId: "bbsdemo-db7da",
        storageBucket: "bbsdemo-db7da.appspot.com",
        messagingSenderId: "509144997691",
        appId: "1:509144997691:web:23d0710e8f6d7f9032211e",
        measurementId: "G-126RVPGY90"
    };
    Firebase.initializeApp(firebaseconfig);
    Firebase.analytics();*/

    let Base64 = require('js-base64').Base64; // 引入base64

    // 统计功能
    // let bbsdemoFirebase = new Firebase("https://bbsdemo-db7da.firebaseio.com/");

    export default {
        name: "comment",
        components: {
            "v-headerfour": headerfour,
            "article-content": article_content,
            "commemt-content": commemt_content,
            "comment-textarea": comment_textarea,
        },
        data() {
            return {
                postid: '',
                commenter: '', // 评论人
                type: 0, // 0为评论作者 1为评论别人的评论
                oldComment: null,
                chosedIndex: -1, // 被选中的评论的index
                article: {
                    id: '',
                    taglist: '',
                    counter: '',
                    pin: '',
                    zan: '',
                    more: '',
                    avatar: '',
                    title: '',
                    author: '',
                    posttype: '',
                    description: '',
                    content: '',
                    time: '',
                },
                articledetail: {
                    author_id: '',
                    author_name: '',
                    avatar: '',
                    comment_count: '',
                    content: '',
                    createTime: '',
                    id: '',
                    is_removed: '',
                    plate: '',
                    post_id: '',
                    posttype: '',
                    praise_count: '',
                    read_count: '',
                    taglist: '',
                    title: '',
                    updateTime: '',
                },
                comment: [],
                userdata: {},
                sonRefresh: true,
                pin: '',
                zan: '',
            }
        },
        methods: {
            // 获取资源
            async init() {
                var self = this;
                self.userdata = {};
                self.article = {
                    id: '',
                    taglist: '',
                    counter: '',
                    pin: '',
                    zan: '',
                    more: '',
                    avatar: '',
                    title: '',
                    author: '',
                    posttype: '',
                    description: '',
                    content: '',
                    time: '',
                };
                self.articledetail = {
                    author_id: '',
                    author_name: '',
                    avatar: '',
                    comment_count: '',
                    content: '',
                    createTime: '',
                    id: '',
                    is_removed: '',
                    plate: '',
                    post_id: '',
                    posttype: '',
                    praise_count: '',
                    read_count: '',
                    taglist: '',
                    title: '',
                    updateTime: '',
                };
                const rLoading = self.openLoading();
                if (JSON.parse(window.localStorage.getItem('Login_data'))) {
                    self.userdata = JSON.parse(window.localStorage.getItem('Login_data')).userdata;
                }
                this.postid = this.$route.query.id;
                console.log(this.postid);
                // 获取资源详情数据
                const data = {
                    post_id: this.postid,
                    is_removed: 0
                };
                await fetch('/bbsdev/getArticleListDetail', {
                    method: 'post',
                    headers: {
                        'Content-type': 'application/json',
                    },
                    body: JSON.stringify(data)
                }).then(res => res.json()).then(res => {
                    if (res.status == 200) {
                        // 获取资源详情
                        self.articledetail = res.data[0];
                        console.log(self.articledetail);
                        if (self.articledetail) {
                            // 查询点赞数
                            fetch('/bbsdev/getPostPraise', {
                                method: 'post',
                                headers: {
                                    'Content-type': 'application/json',
                                },
                                body: JSON.stringify({
                                    post_id: self.articledetail.id
                                })
                            }).then(res2 => res2.json()).then(res2 => {
                                if (res2.status == 200) {
                                    // 获取文章点赞数
                                    if (res2.data.result.length >= 0) {
                                        self.articledetail.praise_count = res2.data.result.length;
                                        self.article.zan = self.articledetail.praise_count;
                                        // 查询评论回复数
                                        fetch('/bbsdev/getPostCommentCount', {
                                            method: 'post',
                                            headers: {
                                                'Content-type': 'application/json',
                                            },
                                            body: JSON.stringify({
                                                post_id: self.articledetail.post_id
                                            })
                                        }).then(res3 => res3.json()).then(res3 => {
                                            console.log(res3)
                                            if (res3.status == 200) {
                                                // 获取文章评论数
                                                if (res3.data.length >= 0) {
                                                    fetch('/bbsdev/getPostReplyCount', {
                                                        method: 'post',
                                                        headers: {
                                                            'Content-type': 'application/json',
                                                        },
                                                        body: JSON.stringify({
                                                            post_id: self.articledetail.post_id
                                                        })
                                                    }).then(res4 => res4.json()).then(res4 => {
                                                        console.log(res4)
                                                        if (res4.status == 200) {
                                                            // 获取文章回复数
                                                            if (res4.data.length >= 0) {
                                                                self.articledetail.comment_count = res3.data.length + res4.data.length;
                                                                self.article.pin = self.articledetail.comment_count;

                                                                self.article.id = self.articledetail.id;
                                                                self.article.taglist = self.articledetail.taglist.split(',');
                                                                self.article.counter = self.articledetail.read_count ? self.articledetail.read_count : 0;
                                                                self.article.more = true;
                                                                self.article.avatar = 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png';
                                                                self.article.title = self.articledetail.id;
                                                                self.article.author = self.articledetail.author_name;
                                                                self.article.posttype = self.articledetail.posttype;
                                                                self.article.description = self.articledetail.title;
                                                                self.article.content = Base64.decode(self.articledetail.content);
                                                                self.article.time = moment(self.articledetail.createTime).format('YYYY-MM-DD HH:mm:ss');

                                                                console.log("**************************");
                                                                console.log(self.article);
                                                                console.log("**************************");
                                                            }
                                                        } else {
                                                            self.$message({
                                                                showClose: true,
                                                                message: '获取文章回复数失败',
                                                                type: 'error'
                                                            });
                                                        }
                                                    })
                                                }
                                            } else {
                                                self.$message({
                                                    showClose: true,
                                                    message: '获取文章评论数失败',
                                                    type: 'error'
                                                });
                                            }
                                        })
                                    }
                                } else {
                                    self.$message({
                                        showClose: true,
                                        message: '获取文章点赞数失败',
                                        type: 'error'
                                    });
                                }
                            });
                        }
                        // 强制刷新子组件
                        this.sonRefresh = false;
                        this.$nextTick(() => {
                            this.sonRefresh = true;
                        });
                        console.log("%%%%%%%%%%%%%%%%%%%%%%%%%%");
                        console.log(self.article);
                        console.log("%%%%%%%%%%%%%%%%%%%%%%%%%%");
                        if(!self.article){
                            this.init();
                        }
                        rLoading.close();
                    } else {
                        self.$message({
                            showClose: true,
                            message: '获取资源详情失败',
                            type: 'error'
                        });
                    }
                })
            },
            // 获取文章阅读量
            getArticle() {
                var self = this;
                self.article = [];
                const rLoading = this.openLoading();
                const data = {
                    post_id: this.postid,
                    is_removed: 0
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
                        if (res.data) {
                            if (!res.data[0].read_count) {
                                res.data[0].read_count = 0;
                            }
                            //阅读量自增
                            self.article.counter = res.data[0].read_count + 1;
                            console.log(self.article.counter);
                            //提交增加后的阅读量数据
                            this.submit();
                            return res.data;
                        }
                        rLoading.close();
                        return null;
                    } else {
                        this.$message({
                            showClose: true,
                            message: '获取文章阅读量失败',
                            type: 'error'
                        });
                    }
                })
            },
            // 增加阅读量
            submit() {
                const rLoading = this.openLoading();
                const data = {
                    post_id: this.postid,
                    read_count: this.article.counter
                };
                fetch('/bbsdev/updateArticle', {
                    method: 'post',
                    headers: {
                        'Content-type': 'application/json',
                    },
                    body: JSON.stringify(data)
                }).then(res => res.json()).then(res => {
                    console.log(res)
                    if (res.status == 200) {
                        if (res.data) {
                            rLoading.close();
                            return res.data;
                        }
                        return null;
                    } else {
                        this.$message({
                            showClose: true,
                            message: '更新文章阅读量失败',
                            type: 'error'
                        });
                    }
                })
            },
            // 添加点赞
            addPraise() {
                var self = this;
                console.log(self.article);
                const rLoading = this.openLoading();
                self.article.zan = Number(self.article.zan) + 1;
                console.log("this.article.zan" + self.article.zan);
                const data1 = {
                    is_removed: 0,
                    post_id: this.postid,
                    author_id: self.userdata ? self.userdata.id : '',
                };
                fetch('/bbsdev/addPraise', {
                    method: 'post',
                    headers: {
                        'Content-type': 'application/json',
                    },
                    body: JSON.stringify(data1)
                }).then(res1 => res1.json()).then(res1 => {
                    console.log(res1)
                    if (res1.status == 200) {
                        if (res1.data) {
                            rLoading.close();
                            return res1.data;
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
            cancelPraise() {
                const rLoading = this.openLoading();
                if (this.article.zan <= 1) {
                    this.article.zan = 0;
                } else {
                    this.article.zan = Number(this.article.zan) - 1;
                }
                console.log("this.article.zan" + this.article.zan);
                const data2 = {
                    is_removed: 1,
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
                        if (res.data[0]) {
                            rLoading.close();
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
            getComment() {
                var self = this;
                self.comment = [];
                const rLoading = this.openLoading();
                const data1 = {
                    post_id: this.postid
                };
                fetch('/bbsdev/getComment', {
                    method: 'post',
                    headers: {
                        'Content-type': 'application/json',
                    },
                    body: JSON.stringify(data1)
                }).then(res1 => res1.json()).then(res1 => {
                    console.log(res1)
                    if (res1.status == 200) {
                        // 获取评论信息
                        if (res1.data) {
                            res1.data.forEach(item1 => {
                                // 获取回复信息
                                const data2 = {
                                    comment_id: item1.comment_id
                                };
                                fetch('/bbsdev/getReply', {
                                    method: 'post',
                                    headers: {
                                        'Content-type': 'application/json',
                                    },
                                    body: JSON.stringify(data2)
                                }).then(res2 => res2.json()).then(res2 => {
                                    console.log(res2)
                                    if (res2.status == 200) {
                                        if (res2.data) {
                                            item1.reply = [];
                                            res2.data.forEach(item2 => {
                                                item2.createTime = moment(item2.createTime).format('YYYY-MM-DD HH:mm:ss');
                                                item1.reply.push(item2);
                                            })
                                            rLoading.close();
                                            return res2.data;
                                        }
                                    } else {
                                        this.$message({
                                            showClose: true,
                                            message: '获取回复信息失败',
                                            type: 'error'
                                        });
                                    }
                                });
                                item1.createTime = moment(item1.createTime).format('YYYY-MM-DD HH:mm:ss');
                                self.comment.push(item1);
                            })
                        }
                        return self.comment;
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
            addComment(data) {
                if (this.type == 0) {
                    const rLoading = this.openLoading();
                    const commentid = this.postid + JSON.parse(window.localStorage.getItem('Login_data')).userdata.id + this.getTime(0);
                    this.comment.push({
                        content: data,
                        is_removed: 0,
                        post_id: parseInt(this.postid),
                        author_id: parseInt(JSON.parse(window.localStorage.getItem('Login_data')).userdata.id),
                        author_name: JSON.parse(window.localStorage.getItem('Login_data')).userdata.username,
                        comment_id: commentid.toString(),
                        createTime: this.getTime(1),
                        reply: ''
                    });
                    // 发表评论
                    const data3 = {
                        content: data,
                        is_removed: 0,
                        post_id: parseInt(this.postid),
                        author_id: parseInt(JSON.parse(window.localStorage.getItem('Login_data')).userdata.id),
                        author_name: JSON.parse(window.localStorage.getItem('Login_data')).userdata.username,
                        comment_id: commentid.toString(),
                        reply: ''
                    };
                    fetch('/bbsdev/addComment', {
                        method: 'post',
                        headers: {
                            'Content-type': 'application/json',
                        },
                        body: JSON.stringify(data3)
                    }).then(res3 => res3.json()).then(res3 => {
                        console.log(res3)
                        if (res3.status == 200) {
                            // 发表评论
                            if (res3.data) {
                                rLoading.close();
                                return res3.data;
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
                    const rLoading = this.openLoading();
                    console.log("========" + this.comment[this.chosedIndex].name + "========");
                    if (!this.comment[this.chosedIndex].reply) {
                        this.comment[this.chosedIndex].reply = [];
                    }
                    this.comment[this.chosedIndex].reply.push({
                        comment_id: this.comment[this.chosedIndex].comment_id,
                        responder: JSON.parse(window.localStorage.getItem('Login_data')).userdata.username,
                        reviewers: this.comment[this.chosedIndex].author_name,
                        content: data,
                        is_removed: 0,
                        post_id: this.postid,
                        author_id: JSON.parse(window.localStorage.getItem('Login_data')).userdata.id,
                        createTime: this.getTime(1)
                    });
                    //服务器端变
                    const data4 = {
                        comment_id: this.comment[this.chosedIndex].comment_id,
                        responder: JSON.parse(window.localStorage.getItem('Login_data')).userdata.username,
                        reviewers: this.comment[this.chosedIndex].author_name,
                        content: data,
                        is_removed: 0,
                        post_id: this.postid,
                        author_id: JSON.parse(window.localStorage.getItem('Login_data')).userdata.id
                    };
                    fetch('/bbsdev/addReply', {
                        method: 'post',
                        headers: {
                            'Content-type': 'application/json',
                        },
                        body: JSON.stringify(data4)
                    }).then(res4 => res4.json()).then(res4 => {
                        console.log(res4)
                        if (res4.status == 200) {
                            // 发表回复
                            if (res4.data4) {
                                rLoading.close();
                                return res4.data4;
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
            changCommmer(name, index) {
                this.oldComment = name;
                this.chosedIndex = index;
                this.type = 1;
            },
            canelCommit() {
                this.type = 0;
            },
            // 格式化时间
            getTime(index) {
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
                if (index == 1) {
                    return year + "-" + month + "-" + day + " " + hour + ":" + minutes + ":" + seconds;
                } else {
                    return year.toString() + month + day + hour + minutes + seconds;
                }
            },
            // 获取文章点赞数
            getPraiseCount() {
                const rLoading = this.openLoading();
                const data = {
                    post_id: this.postid
                };
                fetch('/bbsdev/getPostPraise', {
                    method: 'post',
                    headers: {
                        'Content-type': 'application/json',
                    },
                    body: JSON.stringify(data)
                }).then(res => res.json()).then(res => {
                    console.log(res)
                    if (res.status == 200) {
                        // 获取文章点赞数
                        if (res.data) {
                            this.article.zan = res.data.result.length;
                            rLoading.close();
                            return res.data;
                        }
                    } else {
                        this.$message({
                            showClose: true,
                            message: '获取文章点赞数失败',
                            type: 'error'
                        });
                    }
                })
            },
            // 获取文章评论回复数
            getCommentReplyCount() {
                const rLoading = this.openLoading();
                const data1 = {
                    post_id: this.postid
                };
                fetch('/bbsdev/getPostCommentCount', {
                    method: 'post',
                    headers: {
                        'Content-type': 'application/json',
                    },
                    body: JSON.stringify(data1)
                }).then(res1 => res1.json()).then(res1 => {
                    console.log(res1);
                    if (res1.status == 200) {
                        // 获取文章评论数
                        if (res1.data) {
                            this.article.pin = res1.data.length;
                            const data2 = {
                                post_id: this.postid
                            };
                            fetch('/bbsdev/getPostReplyCount', {
                                method: 'post',
                                headers: {
                                    'Content-type': 'application/json',
                                },
                                body: JSON.stringify(data2)
                            }).then(res2 => res2.json()).then(res2 => {
                                console.log(res2)
                                if (res2.status == 200) {
                                    // 获取文章回复数
                                    if (res2.data) {
                                        this.article.pin = this.article.pin + res2.data.length;
                                        rLoading.close();
                                        return res2.data;
                                    }
                                } else {
                                    this.$message({
                                        showClose: true,
                                        message: '获取文章回复数失败',
                                        type: 'error'
                                    });
                                }
                            })
                        }
                    } else {
                        this.$message({
                            showClose: true,
                            message: '获取文章评论数失败',
                            type: 'error'
                        });
                    }
                })
            }
        },
        mounted() {
            this.init();
            this.getComment();
            this.getPraiseCount();
            this.getCommentReplyCount();
            this.getArticle();

            // 获取总数，并将总访问量展示在页面上
            /*bbsdemoFirebase.child("sum")
                .on("value", function(data) {
                    var current_counter = data.val();
                    if(current_counter > 1 ){
                        this.article.counter = current_counter;
                        // 更新文章浏览量统计
                        const data = {
                            post_id: this.$route.query.id,
                            read_count: this.article.counter,
                        };
                        fetch('/bbsdev/updateArticle', {
                            method: 'post',
                            headers: {
                                'Content-type': 'application/json',
                            },
                            body: JSON.stringify(data)
                        }).then(res => res.json()).then(res => {
                            console.log(res)
                            if (res.status == 200) {
                                if (res.data) {
                                    return res.data;
                                }
                            } else {
                                this.$message({
                                    showClose: true,
                                    message: '更新文章信息失败',
                                    type: 'error'
                                });
                            }
                        })
                    }
                })*/
        }
    };
</script>

<style scoped>
    .blogArticle {
        background: #eee;
    }
</style>

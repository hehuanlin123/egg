<template>
    <div class="blogArticle">
        <header class="header">
            <v-headerone></v-headerone>
        </header>
        <div class="main">
                <div class="col-md-9" id="comment">
                    <article-content v-bind:article="article"></article-content>
                    <commemt-content v-bind:comment="comment" v-on:change="changCommmer"></commemt-content>
                    <comment-textarea v-bind:name="oldComment" v-bind:type="type" v-on:canel="canelCommit"
                                      v-on:submit="addComment"></comment-textarea>
                </div>
        </div>
    </div>
</template>

<script>
    import headerone from "../../../components/bbs/app/public/headerone";
    import article_content from "../../../components/bbs/app/detail/article_content";
    import commemt_content from "../../../components/bbs/app/detail/commemt_content";
    import comment_textarea from "../../../components/bbs/app/detail/comment_textarea";

    import Base64 from "js-base64"; // 引入base64
    console.log(Base64.encode('hssjsjiw9282'));
    console.log(Base64.decode('5r2Y6auY'));

    export default {
        name:"#comment",
        components: {
            "v-headerone": headerone,
            "article-content": article_content,
            "commemt-content": commemt_content,
            "comment-textarea": comment_textarea,
        },
        data() {
            return {
                postid:'',
                articledetail:{},
                commenter: "",   //评论人
                type: 0,                //0为评论作者1为评论别人的评论2为评论别人的别人
                oldComment: null,
                chosedIndex: -1,        //被选中的评论的index
                article: {
                    title: "",
                    time: "2020-04-20",
                    read:50,
                    content: "996 9116 666",
                    taglist: ['#吐槽'],
                    pin: '66',
                    zan: '99',
                    author: '加班汪',
                    posttype: '说',
                    avatar: 'https://zos.alipayobjects.com/rmsportal/ODTLcjxAfvqbxHnVXCYX.png',
                    description: '996'
                },
                comment: [
                    {
                        name: "有毒的黄同学",
                        time: "2020-04-20 12:09:20",
                        content: "好,讲得非常好，good",
                        reply: [
                            {
                                responder: "有毒的黄同学",
                                reviewers: "傲娇的",
                                time: "2020-04-20 12:11:10",
                                content: "你说得对"
                            },
                            {
                                responder: "傲娇的",
                                reviewers: "有毒的黄同学",
                                time: "2020-04-20 12:12:50",
                                content: "很强"
                            }
                        ]
                    },
                    {
                        name: "Freedom小黄",
                        time: "2016-08-17",
                        content: "好,讲得非常好，good",
                        reply: []
                    }
                ]
            }
        },
        methods: {
            addComment: function(data) {
                if(this.type == 0) {
                    this.comment.push({
                        name: JSON.parse(window.localStorage.getItem('Login_data')).userdata.cellphone,
                        time: this.getTime(),
                        content: data,
                        reply: []
                    });
                    //服务器端变
                }else if(this.type == 1){
                    this.comment[this.chosedIndex].reply.push({
                        responder: JSON.parse(window.localStorage.getItem('Login_data')).userdata.cellphone,
                        reviewers:this.comment[this.chosedIndex].name,
                        time: this.getTime(),
                        content: data
                    });
                    this.type = 0;
                }
            },
            changCommmer: function(name,index) {
                this.oldComment = name;
                this.chosedIndex = index;
                this.type = 1;
            },
            canelCommit: function() {
                this.type = 0;
            },
            // 格式化时间
            getTime: function() {
                var now = new Date();
                var year = now.getFullYear();
                var month = now.getMonth()+1;
                var day = now.getDate();
                month.length < 2 ?  "0" + month : month;
                day.length < 2 ?  "0" + day : day;
                return year+"-"+month+"-"+day;
            },
            init: function() {
                this.postid = this.$route.query.postid
                console.log(this.postid)
                // 获取帖子详情数据
                const data = {
                    id: this.postid,
                };
                fetch('/bbsdev/getArticleList', {
                    method: 'post',
                    headers: {
                        'Content-type': 'application/json',
                    },
                    body: JSON.stringify(data)
                }).then(res => res.json()).then(res => {
                    console.log(res)
                    if (res.status == 200) {
                        // 获取帖子详情
                        this.articledetail = res.data;
                        if(this.articledetail){
                            this.article.title = this.articledetail.title;
                            this.article.time = this.articledetail.createtime;
                            this.article.read = this.articledetail.read_count;
                            this.article.content = Base64.decode(this.articledetail.content);
                            this.article.taglist = this.articledetail.taglist;
                            this.article.pin = this.articledetail.pin;
                            this.article.zan = this.articledetail.zan;
                            this.article.author = Base64.decode(this.articledetail.author);
                            this.article.posttype = this.articledetail.posttype;
                            this.article.avatar = this.articledetail.avatar;
                            this.article.description = this.articledetail.description;
                        }
                        return this.articledetail;
                    } else {
                        this.$message({
                            showClose: true,
                            message: '获取帖子详情失败',
                            type: 'error'
                        });
                    }
                })
            }
        },
        mounted() {
            this.init();
        }
    };

</script>

<style scoped>
.blogArticle {
    background: #eee;
}

</style>

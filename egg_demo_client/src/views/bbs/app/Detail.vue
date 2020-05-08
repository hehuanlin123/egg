<template>
<div class="blogArticle">
    <header class="header">
        <v-headertwo></v-headertwo>
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
import headertwo from "../../../components/bbs/app/public/headertwo";
import article_content from "../../../components/bbs/app/detail/article_content";
import commemt_content from "../../../components/bbs/app/detail/commemt_content";
import comment_textarea from "../../../components/bbs/app/detail/comment_textarea";

import moment from 'moment';

let Base64 = require('js-base64').Base64; // 引入base64
console.log(Base64.encode('hssjsjiw9282'));
console.log(Base64.decode('5r2Y6auY'));

export default {
    name: "#comment",
    components: {
        "v-headertwo": headertwo,
        "article-content": article_content,
        "commemt-content": commemt_content,
        "comment-textarea": comment_textarea,
    },
    data() {
        return {
            postid: '',
            commenter: "", //评论人
            type: 0, //0为评论作者1为评论别人的评论2为评论别人的别人
            oldComment: null,
            chosedIndex: -1, //被选中的评论的index
            article: {
                title: '',
                time: '',
                read: '',
                content: '',
                taglist: [],
                pin: '',
                zan: '',
                author: '',
                posttype: '',
                avatar: '',
                description: ''
            },
            comment: []
        }
    },
    methods: {
        getComment: function (data) {

        },
        addComment: function (data) {
            if (this.type == 0) {
                this.comment.push({
                    name: JSON.parse(window.localStorage.getItem('Login_data')).userdata.username,
                    time: this.getTime(),
                    content: data,
                    reply: []
                });
                //服务器端变
            } else if (this.type == 1) {
                this.comment[this.chosedIndex].reply.push({
                    responder: JSON.parse(window.localStorage.getItem('Login_data')).userdata.username,
                    reviewers: this.comment[this.chosedIndex].name,
                    time: this.getTime(),
                    content: data
                });
                //服务器端变
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
            // 获取帖子详情数据
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
                    // 获取帖子详情
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

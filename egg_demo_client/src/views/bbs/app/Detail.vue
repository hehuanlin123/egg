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
                commenter: "session",   //评论人
                type: 0,                //0为评论作者1为评论别人的评论2为评论别人的别人
                oldComment: null,
                chosedIndex: -1,        //被选中的评论的index
                article: {
                    title: "PythonPython",
                    time: "2016-07-12",
                    read:50,
                    content: "PythonPythonPythonPythonPythonPythonPython"
                },
                comment: [
                    {
                        name: "有毒的黄同学",
                        time: "2016-08-17",
                        content: "好,讲得非常好，good",
                        reply: [
                            {
                                responder: "有毒的黄同学",
                                reviewers: "傲娇的",
                                time: "2016-09-05",
                                content: "你说得对"
                            },
                            {
                                responder: "傲娇的",
                                reviewers: "有毒的黄同学",
                                time: "2016-09-05",
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
                        name: 'session',
                        time: this.getTime(),
                        content: data,
                        reply: []
                    });
                    //服务器端变
                }else if(this.type == 1){
                    this.comment[this.chosedIndex].reply.push({
                        responder: 'session',
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
            }
        },
    };

</script>

<style scoped>
.blogArticle {
    background: #eee;
}

</style>

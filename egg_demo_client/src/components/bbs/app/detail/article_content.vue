<template>
    <div>
        <div class="titleBox" style="border-bottom:none;">
            <p class="title">{{article.description}}</p>
        </div>
        <div class="introBox">
            <a-row>
                <a-col :span="2">
                    <el-avatar style="margin-left:20px;" :src="article.avatar"></el-avatar>
                </a-col>
                <a-col :span="4">
                    <p>{{article.author}}</p>
                    <p>
                        发表于&nbsp;&nbsp;
                        {{article.time}}
                    </p>
                </a-col>
                <a-col :span="12">
                </a-col>
                <a-col :span="6">
                    <p>
                    <span v-bind:key="index" v-for="(tag,index) in article.taglist">
                        <el-tag style="margin:2px 5px;" id="el-tag-post" size="mini" type="info">{{tag}}</el-tag>
                    </span>
                    </p>
                    <p>
                        <span class="icon_static" @click="addAndCancelPraise(article.id)">
                            赞&nbsp;&nbsp;{{article.zan ? article.zan : 0}}&nbsp;|&nbsp;
                        </span>
                        <span class="icon_static">评论&nbsp;&nbsp;{{article.pin ? article.pin : 0}}&nbsp;|&nbsp;</span>
                        <span class="icon_static">浏览&nbsp;&nbsp;{{article.counter ? article.counter : 0}}</span>
                    </p>
                </a-col>
            </a-row>
        </div>
        <div style="margin: 20px;" class="articleText" v-html="article.content"></div>
        <div></div>
    </div>
</template>

<script>

    export default {
        name: "article_content",
        props: ['article'],
        data() {
            return {
                admire: false,
            };
        },
        methods: {
            init() {
                // 查询是否已点赞
                const data1 = {
                    post_id: this.postid,
                    author_id: JSON.parse(window.localStorage.getItem('Login_data')).userdata.id
                };
                fetch('/bbsdev/getPraise', {
                    method: 'post',
                    headers: {
                        'Content-type': 'application/json',
                    },
                    body: JSON.stringify(data1)
                }).then(res => res.json()).then(res => {
                    console.log(res)
                    if (res.status == 200) {
                        // 获取点赞信息
                        if (res.data[0].is_removed === 0) {
                            this.admire = true;
                            localStorage.setItem('admire', this.admire);
                        } else {
                            this.admire = false;
                            localStorage.setItem('admire', this.admire);
                        }
                        return res.data[0];
                    } else {
                        this.$message({
                            showClose: true,
                            message: '获取点赞信息失败',
                            type: 'error'
                        });
                    }
                })

                // 查询文章点赞数
                // const data2 = {
                //     post_id: this.postid,
                // };
                // fetch('/bbsdev/getPostPraise', {
                //     method: 'post',
                //     headers: {
                //         'Content-type': 'application/json',
                //     },
                //     body: JSON.stringify(data2)
                // }).then(res => res.json()).then(res => {
                //     console.log(res)
                //     if (res.status == 200) {
                //         if(res.data){
                //             // 点赞数
                //         }
                //     } else {
                //         this.$message({
                //             showClose: true,
                //             message: '获取点赞信息失败',
                //             type: 'error'
                //         });
                //     }
                // })
            },
            addAndCancelPraise(id) { //点赞与取消点赞
                console.log(id);
                this.admire == false ? this.admire = true : this.admire = false;
                localStorage.setItem('admire', this.admire);
                this.admire == true ? this.$emit('addPraise') : this.$emit('cancelPraise');
            },
        },
        mounted() {
            this.init();
        }
    }
</script>

<style scoped>
    * {
        padding: 0%;
        margin: 0%;
    }

    .title {
        position: relative;
        left: 20px;
        text-align: left;
        font-weight: bolder;
        padding-top: 10px;
    }

    .introBox {
        border-bottom: 1px solid #ccc;
        text-align: left;
        font-size: 12px;
    }

    .icon_static {
        margin: auto 5px;
    }
</style>

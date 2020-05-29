<template>
    <div class="myinfo">
        <ul>
            <!-- <li><i class="el-icon-star-off"></i><span style="margin-left:20px;">我的收藏</span></li> -->
            <!-- <el-divider></el-divider> -->
            <li><i class="el-icon-edit-outline"></i><span @click="gotoMypost" style="margin-left:20px;">我的资源</span></li>
            <!-- <el-divider></el-divider> -->
            <li><i class="el-icon-chat-line-round"></i><span @click="gotoMyfriends"
                                                             style="margin-left:20px;">我关注的用户</span></li>
            <!-- <el-divider></el-divider> -->
            <!-- <li><i class="el-icon-collection-tag"></i><span @click="gotoMytopic" style="margin-left:20px;">我关注的话题</span></li> -->
            <!-- <el-divider></el-divider> -->
        </ul>
    </div>
</template>

<script>
    let Base64 = require('js-base64').Base64;
    import moment from "moment";

    export default {
        name: 'myinfo',
        data() {
            return {
                listData: [],
            }
        },
        methods: {
            gotoMypost() {
                // 我发表的资源
                this.listData = [];
                const data = {
                    author_id: JSON.parse(window.localStorage.getItem('Login_data')).userdata.id,
                    ordertype: 'createTime'
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
                        // 获取资源数据
                        if (res.data) {
                            console.log(res.data);
                            res.data.forEach(element => {
                                let more = false;
                                let showcontent = '';
                                if (Base64.decode(element.content).length > 100) {
                                    more = true; // 显示更多
                                    showcontent = Base64.decode(element.content).substr(0, 100) + '...';
                                } else {
                                    more = false;
                                    showcontent = Base64.decode(element.content);
                                }
                                if (element.author_name === JSON.parse(window.localStorage.getItem('Login_data')).userdata.username) {
                                    element.author_name = "我";
                                }
                                this.listData.push({
                                    id: element.id,
                                    taglist: element.taglist.split(','),
                                    pin: element.comment_count,
                                    zan: element.praise_count,
                                    more: more,
                                    title: element.id,
                                    author_id: element.author_id,
                                    author_name: element.author_name,
                                    posttype: element.posttype,
                                    description: element.title,
                                    content: showcontent,
                                    time: moment(element.createTime).format('YYYY-MM-DD HH:mm:ss')
                                });
                            });
                            this.$store.commit("article/getarticlelist", this.listData);
                        }
                    } else {
                        this.$message({
                            showClose: true,
                            message: '搜索资源列表失败',
                            type: 'error'
                        });
                    }
                })
            },
            gotoMyfriends() {
                this.$router.push({
                    path: '/bbs/alluser',
                    query: {
                        fans_id: JSON.parse(window.localStorage.getItem('Login_data')).userdata.id
                    }
                });
            }
        }
    }
</script>

<style scoped>
    * {
        padding: 0;
        margin: 0;
    }

    .myinfo {
        background-color: #ffffff;
        text-align: left;
    }

    li {
        margin: 10px auto;
    }
</style>

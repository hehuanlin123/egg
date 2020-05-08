<template>
<div class="demo-type">
    <div>
        <el-avatar src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png"></el-avatar>
        <p><span>{{ username? username : cellphone }}</span><span>，您好！</span></p>
        <a @click.prevent="gotoMy">TA的个人主页></a>
        <!-- 5 x 2 -->
        <div class="statics">
            <a-row>
                <a-col :span="6">原创</a-col>
                <a-col :span="6">粉丝</a-col>
                <a-col :span="6">获赞</a-col>
                <a-col :span="6">评论</a-col>
            </a-row>
            <a-row>
                <!-- <a-col :span="6">{{statics.post}}</a-col> -->
                <a-col :span="6">{{statics.post}}</a-col>
                <a-col :span="6">{{statics.fans}}</a-col>
                <a-col :span="6">{{statics.priase}}</a-col>
                <a-col :span="6">{{statics.comment}}</a-col>
            </a-row>
        </div>
    </div>
</div>
</template>

<script>
export default {
    name: 'head',
    data() {
        return {
            statics: {
                post: 0,
                fans: 0,
                priase: 0,
                comment: 0
            },
            cellphone: '',
            userid: '',
        }
    },
    methods: {
        gotoMy() {
            this.$router.push({
                path: '/bbs/post'
            });
        },
        getCellphone() {
            const userInfo = JSON.parse(window.localStorage.getItem('Login_data'));
            this.username = userInfo.userdata.username;
            this.cellphone = (userInfo.userdata.cellphone + '').substr(0, 3) + "****" + (userInfo.userdata.cellphone + '').substr(7);
        },
        getUserInfo() {
            const userInfo = JSON.parse(window.localStorage.getItem('Login_data'));
            this.cellphone = userInfo.userdata.cellphone;
            const data = {
                cellphone: this.cellphone,
            };
            fetch('/bbsdev/getUserInfo', {
                method: 'post',
                headers: {
                    'Content-type': 'application/json',
                },
                body: JSON.stringify(data)
            }).then(res => res.json()).then(res => {
                console.log(res)
                if (res.status == 200) {
                    if (res.data) {
                        // 获取userid
                        this.userid = res.data.id;
                        // 获取统计信息
                        // this.statics.post = res.data.articlecount;
                        this.statics.fans = res.data.fanscount;
                        this.statics.priase = res.data.praisecount;
                        this.statics.comment = res.data.commentcount;
                    } else {
                        console.log('用户信息为空');
                    }
                } else {
                    this.$message({
                        showClose: true,
                        message: '获取用户信息失败',
                        type: 'error'
                    });
                }
            })
        },
        getStatics() {
            // 查询帖子数
            const data1 = {
                author_id: JSON.parse(window.localStorage.getItem('Login_data')).userdata.id,
            };
            fetch('/bbsdev/getArticleInfoDetail', {
                method: 'post',
                headers: {
                    'Content-type': 'application/json',
                },
                body: JSON.stringify(data1)
            }).then(res => res.json()).then(res => {
                console.log(res)
                if (res.status == 200) {
                    console.log(res.data);
                    // 获取帖子数
                    this.statics.post = res.data.length;
                } else {
                    this.$message({
                        showClose: true,
                        message: '获取帖子列表（详细）失败',
                        type: 'error'
                    });
                }
            })
            // 查询粉丝数
            // const data2 = {
            //     author_id: this.userid,
            // };
            // fetch('/bbsdev/getFriends', {
            //     method: 'post',
            //     headers: {
            //         'Content-type': 'application/json',
            //     },
            //     body: JSON.stringify(data2)
            // }).then(res => res.json()).then(res => {
            //     console.log(res)
            //     if (res.status == 200) {
            //         // 获取粉丝数
            //         this.statics.fans = res.data.length;
            //     } else {
            //         this.$message({
            //             showClose: true,
            //             message: '获取粉丝列表失败',
            //             type: 'error'
            //         });
            //     }
            // })
            // 查询评论数
            // const data3 = {
            //     author_id: this.userid,
            // };
            // fetch('/bbsdev/getComment', {
            //     method: 'post',
            //     headers: {
            //         'Content-type': 'application/json',
            //     },
            //     body: JSON.stringify(data3)
            // }).then(res => res.json()).then(res => {
            //     console.log(res)
            //     if (res.status == 200) {
            //         // 获取评论数
            //         this.statics.comment = res.data.length;
            //     } else {
            //         this.$message({
            //             showClose: true,
            //             message: '获取评论列表失败',
            //             type: 'error'
            //         });
            //     }
            // })
            // 查询点赞数
            // const data4 = {
            //     author_id: this.userid,
            // };
            // fetch('/bbsdev/getPraise', {
            //     method: 'post',
            //     headers: {
            //         'Content-type': 'application/json',
            //     },
            //     body: JSON.stringify(data4)
            // }).then(res => res.json()).then(res => {
            //     console.log(res)
            //     if (res.status == 200) {
            //         // 获取点赞数
            //         this.statics.priase = res.data.length;
            //     } else {
            //         this.$message({
            //             showClose: true,
            //             message: '获取点赞列表失败',
            //             type: 'error'
            //         });
            //     }
            // })
        },
    },
    mounted() {
        this.getUserInfo();
        this.getStatics();
        this.getCellphone();
    }
}
</script>

<style scoped>
* {
    padding: 0;
    margin: 0;
}

.statics {
    margin: 5px auto;
    width: 150px;
}
</style>

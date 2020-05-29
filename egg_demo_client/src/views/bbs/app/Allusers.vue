<template>
    <div>
        <v-headersix></v-headersix>
        <div class="container">
            <ul class="infinite-list" v-infinite-scroll="load" style="overflow:auto">
                <li @click="gotoDetail(userlist[i].id)" v-bind:key="userlist[i].id" v-for="i in count"
                    class="infinite-list-item">
                    <a-col :span="4">
                        <el-avatar
                                src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png"></el-avatar>
                    </a-col>
                    <a-col style="text-align: left;" :span="14">
                        <p>{{ userlist[i].username }}</p>
                        <p>
                            个性签名：<span>{{ userlist[i].desc }}</span>
                        </p>
                    </a-col>
                    <a-col :span="6" style="text-align:right;">
                        <el-row>
                            <el-button @click="addFriend(userlist[i].id)" v-if="!self" class="btn" type="primary">关注
                            </el-button>
                        </el-row>
                    </a-col>
                </li>
            </ul>
        </div>
    </div>
</template>

<script>
    import headersix from "../../../components/bbs/app/public/headersix";

    export default {
        name: "Allusers",
        data() {
            return {
                count: 0,
                friendslist: [],
                userlist: [],
            }
        },
        components: {
            "v-headersix": headersix,
        },
        methods: {
            load() {
                this.count += 2;
            },
            init() { //获取所有用户数据
                if(this.$route.query.fans_id) {
                    const data1 = {
                        fans_id: this.$route.query.fans_id
                    };
                    fetch('/bbsdev/getFriends', {//查询关注的用户id
                        method: 'post',
                        headers: {
                            'Content-type': 'application/json',
                        },
                        body: JSON.stringify(data1)
                    }).then(res => res.json()).then(res => {
                        console.log(res)
                        if (res.status == 200) {
                            for (let i = 0; i < 100; i++) {
                                if (res.data) {
                                    res.data.forEach(item1 => {
                                        this.friendslist.push(item1);
                                    });
                                    //根据用户id查询用户详情
                                    this.friendslist.forEach(item2 => {
                                        const data2 = {
                                            id: item2.author_id
                                        };
                                        fetch('/bbsdev/getUserInfo', {
                                            method: 'post',
                                            headers: {
                                                'Content-type': 'application/json',
                                            },
                                            body: JSON.stringify(data2)
                                        }).then(res => res.json()).then(res => {
                                            console.log(res)
                                            if (res.status == 200) {
                                                for (let i = 0; i < 100; i++) {
                                                    if (res.data) {
                                                        res.data.forEach(item => {
                                                            this.userlist.push(item);
                                                        });
                                                    }
                                                }
                                            } else {
                                                this.$message({
                                                    showClose: true,
                                                    message: '获取用户信息列表失败',
                                                    type: 'error'
                                                });
                                            }
                                        })
                                    });
                                }
                            }
                        } else {
                            this.$message({
                                showClose: true,
                                message: '获取用户信息列表失败',
                                type: 'error'
                            });
                        }
                    })
                } else {
                    const data = {};
                    fetch('/bbsdev/getUserInfo', {
                        method: 'post',
                        headers: {
                            'Content-type': 'application/json',
                        },
                        body: JSON.stringify(data)
                    }).then(res => res.json()).then(res => {
                        console.log(res)
                        if (res.status == 200) {
                            for (let i = 0; i < 100; i++) {
                                if (res.data) {
                                    res.data.forEach(item => {
                                        this.userlist.push(item);
                                    });
                                }
                            }
                        } else {
                            this.$message({
                                showClose: true,
                                message: '获取用户信息列表失败',
                                type: 'error'
                            });
                        }
                    })
                }
            },
            addFriend(id) {
                // 添加好友关系
                const data = {
                    fans_id: JSON.parse(window.localStorage.getItem('Login_data')).userdata.id,
                    author_id: id
                };
                fetch('/bbsdev/addFriends', {
                    method: 'post',
                    headers: {
                        'Content-type': 'application/json',
                    },
                    body: JSON.stringify(data)
                }).then(res => res.json()).then(res => {
                    console.log(res)
                    if (res.status == 200) {
                        if (res.data) {
                            this.$message({
                                showClose: true,
                                message: '关注成功',
                                type: 'success'
                            });
                            return res.data;
                        }
                    } else {
                        this.$message({
                            showClose: true,
                            message: '关注好友失败',
                            type: 'error'
                        });
                    }
                })
            },
            gotoDetail(id) {
                this.$router.push({
                    path: '/bbs/mycenter',
                    query: {
                        userid: id
                    }
                });
            }
        },
        mounted() {
            this.init();
        }
    }
</script>

<style scoped>
    .container {
        width: 60%;
        height: auto;
        text-align: left;
        background-color: #ffffff;
        border: 1px solid #e0e0e0;
        margin-top: 10px;
    }


    .btn {
        color: #fff;
        width: 50px;
        background-color: #1890ff;
        border-color: #1890ff;
        text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.12);
        -webkit-box-shadow: 0 2px 0 rgba(0, 0, 0, 0.045);
        box-shadow: 0 2px 0 rgba(0, 0, 0, 0.045);
    }

    .infinite-list-item {
        display: flex;
        background-color: aliceblue;
        margin-bottom: 10px;
        margin-top: 5px;
    }
</style>
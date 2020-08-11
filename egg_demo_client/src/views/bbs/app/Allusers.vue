<template>
    <div>
        <v-headersix></v-headersix>
        <div class="container">
            <ul class="infinite-list" v-infinite-scroll="load" style="overflow:auto">
                <li @click="gotoDetail(userlist[i-1].id)" v-bind:key="userlist[i-1].id" v-for="i in count"
                    class="infinite-list-item">
                    <a-col :span="4">
                        <el-avatar
                                src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png"></el-avatar>
                    </a-col>
                    <a-col style="text-align: left;" :span="14">
                        <p>{{ userlist[i-1].username }}</p>
                        <p>
                            个性签名：<span>{{ userlist[i-1].desc }}</span>
                        </p>
                    </a-col>
                    <a-col :span="6" style="text-align:right;">
                        <el-row>
                            <el-button @click.prevent="addFriend(userlist[i-1].id)" v-if="!userlist[i-1].added" class="btn"
                                       type="primary">关注
                            </el-button>
                            <el-button @click.prevent="gotoDetail(userlist[i-1].id)" v-if="userlist[i-1].added" class="btn"
                                       type="primary">查看
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
                fanslist: [],
                userlist: [],
                added: true,
            }
        },
        components: {
            "v-headersix": headersix,
        },
        methods: {
            load() {
                this.count += 1;
            },
            init() {
                var self = this;
                self.fanslist = [];
                self.userlist = [];
                if (self.$route.query.fans_id) {//获取关注的用户数据
                    const data1 = {
                        fans_id: self.$route.query.fans_id,
                        is_removed: 0
                    };
                    fetch('/bbsdev/getFriends', {//查询关注的用户id
                        method: 'post',
                        headers: {
                            'Content-type': 'application/json',
                        },
                        body: JSON.stringify(data1)
                    }).then(res1 => res1.json()).then(res1 => {
                        console.log(res1)
                        if (res1.status == 200) {
                            if (res1.data.length > 0) {
                                res1.data.forEach(item1 => {
                                    self.fanslist.push(item1);
                                });
                                //关注用户对象列表去重1
                                console.log('==============this.fanslist1================');
                                console.log(self.fanslist);
                                //去重操作
                                var arr = [];
                                var hash = {};
                                for (var i = 0, j = self.fanslist.length; i < j; i++) {
                                    //将对象元素转换成字符串以作比较
                                    var keys = ['is_removed', 'author_id', 'fans_id'];
                                    var n = keys.length, key = [];
                                    while(n--){
                                        key.push(self.fanslist[i][keys[n]]);
                                    }
                                    key.join('|');
                                    var k = key.join('|');
                                    if (!(k in hash)) {
                                        hash[k] = true;
                                        arr.push(self.fanslist[i]);
                                    }
                                }
                                //进行去重
                                self.fanslist = [];
                                self.fanslist = arr;
                                //关注用户对象列表去重2
                                console.log('==============this.fanslist2================');
                                console.log(self.fanslist);
                                //根据用户id查询用户详情
                                self.fanslist.forEach(item2 => {
                                    const data2 = {
                                        author_id: item2.author_id
                                    };
                                    fetch('/bbsdev/getUserInfo', {
                                        method: 'post',
                                        headers: {
                                            'Content-type': 'application/json',
                                        },
                                        body: JSON.stringify(data2)
                                    }).then(res2 => res2.json()).then(res2 => {
                                        console.log(res2)
                                        if (res2.status == 200) {
                                            if (res2.data.length > 0) {
                                                res2.data[0].added = true;
                                                self.userlist.push(res2.data[0]);
                                            }
                                        } else {
                                            self.$message({
                                                showClose: true,
                                                message: '获取用户信息列表失败',
                                                type: 'error'
                                            });
                                        }
                                    })
                                });
                                console.log(">>>>>>>>>>>>>>>>this.userlist>>>>>>>>>>>>>>>>");
                                console.log(self.userlist);
                            }
                        } else {
                            self.$message({
                                showClose: true,
                                message: '获取粉丝信息列表失败',
                                type: 'error'
                            });
                        }
                    })
                } else {//获取所有用户数据
                    const data1 = {};
                    fetch('/bbsdev/getUserInfo', {
                        method: 'post',
                        headers: {
                            'Content-type': 'application/json',
                        },
                        body: JSON.stringify(data1)
                    }).then(res1 => res1.json()).then(res1 => {
                        if (res1.status == 200) {
                            if (res1.data.length > 0) {
                                console.log("===============所有用户数据为==============")
                                console.log(res1.data)
                                res1.data.forEach(item => {
                                    const data2 = {
                                        author_id: parseInt(item.id),
                                        fans_id: JSON.parse(window.localStorage.getItem('Login_data')).userdata.id,
                                        is_removed: 0
                                    };
                                    fetch('/bbsdev/getFriends', {
                                        method: 'post',
                                        headers: {
                                            'Content-type': 'application/json',
                                        },
                                        body: JSON.stringify(data2)
                                    }).then(res2 => res2.json()).then(res2 => {
                                        console.log(res2)
                                        if (res2.status == 200) {
                                            if (res2.data.length > 0) {
                                                console.log(res2.data);
                                                if (res2.data[0].is_removed == 0) {
                                                    item.added = true
                                                } else {
                                                    item.added = false
                                                }
                                            }
                                        } else {
                                            self.$message({
                                                showClose: true,
                                                message: '获取粉丝关系失败',
                                                type: 'error'
                                            });
                                        }
                                    })
                                    self.userlist.push(item);
                                    console.log("=============this.userlist=============");
                                    console.log(self.userlist);
                                });
                            }
                        } else {
                            self.$message({
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
                    author_id: id,
                    is_removed: 0
                };
                // 先判断是否已有关注好友记录
                fetch('/bbsdev/getFriends', {
                    method: 'post',
                    headers: {
                        'Content-type': 'application/json',
                    },
                    body: JSON.stringify(data)
                }).then(res => res.json()).then(res => {
                    console.log(res)
                    if (res.status == 200) {
                        if (res.data.length > 0) {// 已有记录
                            fetch('/bbsdev/updateFriends', {
                                method: 'post',
                                headers: {
                                    'Content-type': 'application/json',
                                },
                                body: JSON.stringify(data)
                            }).then(res => res.json()).then(res => {
                                console.log(res)
                                if (res.status == 200) {
                                    if (res.data.length > 0) {
                                        this.$message({
                                            showClose: true,
                                            message: '更新关注好友成功',
                                            type: 'success'
                                        });
                                        return res.data;
                                    }
                                } else {
                                    this.$message({
                                        showClose: true,
                                        message: '更新关注好友失败',
                                        type: 'error'
                                    });
                                }
                            })
                        } else {// 没有记录
                            fetch('/bbsdev/addFriends', {
                                method: 'post',
                                headers: {
                                    'Content-type': 'application/json',
                                },
                                body: JSON.stringify(data)
                            }).then(res => res.json()).then(res => {
                                console.log(res)
                                if (res.status == 200) {
                                    if (res.data.length > 0) {
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
                        }
                        this.$message({
                            showClose: true,
                            message: '查询关注好友记录成功',
                            type: 'success'
                        });
                    } else {
                        this.$message({
                            showClose: true,
                            message: '查询关注好友记录失败',
                            type: 'error'
                        });
                    }
                });
            },
            gotoDetail(id) {
                this.$router.push({
                    path: '/bbs/mycenter',
                    query: {
                        userid: id,
                        added: true
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
<template>
    <div>
        <v-headerfive></v-headerfive>
        <a-row>
            <a-col :span="5"></a-col>
            <a-col :span="14">
                <div class="profile">
                    <a-col :span="4">
                        <el-avatar
                                src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png"></el-avatar>
                    </a-col>
                    <a-col style="text-align: left;" :span="14">
                        <p>{{ userlist.username }}</p>
                        <p>
                            个性签名：<span>{{ userlist.desc }}</span>
                        </p>
                    </a-col>
                    <a-col :span="6">
                        <el-row style="display: flex;">
                            <el-button v-if="self" class="btn" type="primary" @click="openedit">编辑</el-button>
                            <el-button v-if="self" class="btn" type="primary" @click="onsite">打卡</el-button>
                            <el-button v-if="notself" class="btn" type="primary">
                                <span v-if="notfriend" @click="addFriend">关注</span>
                                <span v-if="isfriend" @click="cancelFriend">取消关注</span>
                            </el-button>
                        </el-row>
                    </a-col>
                </div>
                <div>
                    <a-col :span="7">
                        <v-myinfo class="myinfo"></v-myinfo>
                    </a-col>
                    <a-col :span="1">
                    </a-col>
                    <a-col class="information" :span="16">
                        <p style="text-align:left;margin-left:8px;"><b>基本信息</b></p>
                        <el-divider></el-divider>
                        <v-userinfo v-bind:userlist="userlist" v-if="notedit"></v-userinfo>
                        <v-userinfoedit v-if="edit" v-on:closeEdit="closeEdit"></v-userinfoedit>
                    </a-col>
                </div>
            </a-col>
            <a-col :span="5"></a-col>
        </a-row>
    </div>
</template>

<script>
    import headerfive from "../../../components/bbs/app/public/headerfive";
    import myinfo_login from "../../../components/bbs/app/home/myinfo_login";
    import userinfo from "../../../components/bbs/app/personinfo/userinfo";
    import userinfo_edit from "../../../components/bbs/app/personinfo/userinfo_edit";

    export default {
        data() {
            return {
                form: {
                    name: '',
                    region: '',
                    date1: '',
                    date2: '',
                    delivery: false,
                    type: [],
                    resource: '',
                    desc: ''
                },
                edit: false,
                notedit: true,
                self: true,
                notself: false,
                notfriend: true,
                isfriend: false,
                userlist: {},
            }
        },
        components: {
            "v-headerfive": headerfive,
            "v-myinfo": myinfo_login,
            "v-userinfo": userinfo,
            "v-userinfoedit": userinfo_edit,
        },
        computed: {},
        methods: {
            init() { //获取用户详细数据
                const data = {
                    author_id: this.$route.query.userid,
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
                        if (res.data.length > 0) {
                            this.userlist = res.data[0];
                            this.userlist.username = res.data[0].username;
                            this.userlist.desc = res.data[0].signature;
                            console.log("==============this.userlist=================");
                            console.log(this.userlist);
                        }
                    } else {
                        this.$message({
                            showClose: true,
                            message: '获取用户信息列表失败',
                            type: 'error'
                        });
                    }
                })
            },
            isFriend() {
                if(this.$route.query.added == true){
                    this.isfriend = true;
                    this.notfriend = false;
                } else {
                    const data = {
                        author_id: parseInt(this.$route.query.userid),
                        fans_id: JSON.parse(window.localStorage.getItem('Login_data')).userdata.id,
                        is_removed: 0
                    };
                    fetch('/bbsdev/getFriends', {
                        method: 'post',
                        headers: {
                            'Content-type': 'application/json',
                        },
                        body: JSON.stringify(data)
                    }).then(res => res.json()).then(res => {
                        console.log(res)
                        if (res.status == 200) {
                            if (res.data) {
                                console.log(res.data);
                                if (res.data[0].is_removed == 0) {
                                    this.isfriend = true;
                                    this.notfriend = false;
                                } else {
                                    this.notfriend = true;
                                    this.isfriend = false;
                                }
                            }
                        } else {
                            this.$message({
                                showClose: true,
                                message: '获取粉丝关系失败',
                                type: 'error'
                            });
                        }
                    })
                }
            },
            openedit() {
                this.edit = true;
                this.notedit = false;
            },
            closeEdit() {
                this.edit = false;
                this.notedit = true;
            },
            onsite() {
                this.$alert('你已打开 1 天', '打卡成功！', {
                    confirmButtonText: '确定',
                    callback: action => {
                        console.log(action);
                        // this.$message({
                        //     type: 'info',
                        //     message: `action: ${action}`
                        // });
                    }
                });
            },
            addFriend() {
                // 添加好友关系
                const data = {
                    fans_id: parseInt(JSON.parse(window.localStorage.getItem('Login_data')).userdata.id),
                    author_id: this.$route.query.userid,
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
                                    if (res.data) {
                                        this.$message({
                                            showClose: true,
                                            message: '更新关注好友成功',
                                            type: 'success'
                                        });
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
                                    if (res.data) {
                                        this.$message({
                                            showClose: true,
                                            message: '关注成功',
                                            type: 'success'
                                        });
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
            cancelFriend() {
                // 删除好友关系
                const data = {
                    fans_id: parseInt(JSON.parse(window.localStorage.getItem('Login_data')).userdata.id),
                    author_id: this.$route.query.userid,
                    is_removed: 1,
                };
                fetch('/bbsdev/deleteFriends', {
                    method: 'post',
                    headers: {
                        'Content-type': 'application/json',
                    },
                    body: JSON.stringify(data)
                }).then(res => res.json()).then(res => {
                    console.log(res)
                    if (res.status == 200) {
                        if (res.data) {
                            this.isfriend = false;
                            this.notfriend = true;
                            this.$message({
                                showClose: true,
                                message: '取消关注成功',
                                type: 'success'
                            });
                        }
                    } else {
                        this.$message({
                            showClose: true,
                            message: '取消关注失败',
                            type: 'error'
                        });
                    }
                })
            }
        },
        mounted() {
            if (this.$route.query.userid == JSON.parse(window.localStorage.getItem('Login_data')).userdata.id) {
                this.self = true;
                this.notself = false;
            } else {
                this.self = false;
                this.notself = true;
            }
            this.init();
            this.isFriend();
        }
    }
</script>

<style scoped>
    * {
        margin: 0;
        padding: 0;
    }

    .profile {
        position: relative;
        margin-bottom: 10px;
        height: 100px;
        background: #fff;
        clear: both;
        border: 1px solid #e0e0e0;
        border-radius: 3px;
        display: flex;
        align-items: center;
    }

    .information {
        background: #fff;
        border: 1px solid #e0e0e0;
        padding-right: 8px;
    }

    .btn {
        color: #fff;
        width: 75px;
        background-color: #1890ff;
        border-color: #1890ff;
        text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.12);
        -webkit-box-shadow: 0 2px 0 rgba(0, 0, 0, 0.045);
        box-shadow: 0 2px 0 rgba(0, 0, 0, 0.045);
    }

    .myinfo {
        width: 100%;
        background-color: #ffffff;
        position: relative;
        padding: 5px 30px 5px 30px;
        border: 1px solid #e0e0e0;
    }
</style>

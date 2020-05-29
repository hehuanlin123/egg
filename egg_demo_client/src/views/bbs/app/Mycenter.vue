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
                        <el-row>
                            <el-button class="btn" type="primary" @click="openedit">编辑</el-button>
                            <el-button v-if="self" class="btn" type="primary" @click="onsite">打卡</el-button>
                            <el-button @click="addFriend(userlist.id)" v-if="notself" class="btn" type="primary">关注</el-button>
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
                        <v-userinfo v-if="notedit"></v-userinfo>
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
                userlist: {
                    username: '',
                    desc: ''
                },
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
            init() { //获取所有用户数据
                const data = {
                    id: this.$route.query.userid,
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
                            console.log(res.data);
                            this.userlist.username = res.data.username;
                            this.userlist.desc = res.data.signature;
                            return this.userlist;
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
        width: 50px;
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

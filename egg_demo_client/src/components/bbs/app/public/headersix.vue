<template>
    <!-- 三栏布局 flex布局-->
    <div class="layout">
        <div class="left">
        <span @click="gotoHome" style="vertical-align: middle;display: flex;align-items: center;">
            <span><a-icon type="skype" /></span>
            <span>标签推荐系统</span>
        </span>
        </div>
        <div class="center">
            <ul>
                <li v-for="list in headerList" :key="list.id">
                    <!--              <a href="#">-->
                    <!--                {{ list.title }}-->
                    <!--              </a>-->
                    <el-link type="primary" href="http://localhost:8080/bbs/home_login">{{ list.title }}</el-link>
                </li>
            </ul>
        </div>
        <div class="right">
            <!--<span v-show="searchVisible">
                <el-button @click.stop="goSearch" class="search" icon="el-icon-search" size="mini"
                           type="info">输入关键词搜索资源</el-button>
            </span>
            <span v-show="!searchVisible">
                <el-input class="search" placeholder="输入关键词搜索资源" size="mini" v-model="search" @blur="goblur"></el-input>
                <el-button @click.stop="Search" class="searchbtn" type="primary">搜索</el-button>
            </span>-->
            <el-dropdown size="medium">
            <span class="el-dropdown-link">
                <span>您好，</span>
                <span>{{ username? username : cellphone }}</span>
                <i class="el-icon-arrow-down el-icon--right"></i>
            </span>
                <el-dropdown-menu slot="dropdown">
                    <el-dropdown-item>
                        <el-button style="color:#303133;" type="text" @click="gotoMy">个人中心</el-button>
                    </el-dropdown-item>
                    <el-dropdown-item>
                        <el-button style="color:#303133;" type="text" @click="gotoSetting">修改登录密码</el-button>
                    </el-dropdown-item>
                    <!-- 修改登录密码-->
                    <el-dialog title="修改登录密码" :visible.sync="dialogFormVisible">
                        <el-form>
                            <el-form-item label="原密码" :label-width="formLabelWidth">
                                <el-input v-model="oldpasswd" autocomplete="off"></el-input>
                            </el-form-item>
                            <el-form-item label="新密码" :label-width="formLabelWidth">
                                <el-input v-model="newpasswd1" autocomplete="off"></el-input>
                            </el-form-item>
                            <el-form-item label="确认新密码" :label-width="formLabelWidth">
                                <el-input v-model="newpasswd2" autocomplete="off"></el-input>
                            </el-form-item>
                        </el-form>
                        <div slot="footer" class="dialog-footer">
                            <el-button style="color:rgba(0, 0, 0, 0.65);background-color: #EEEEEE;" id="btn" type="text"
                                       @click.stop="dialogFormVisible = false">取 消
                            </el-button>
                            <el-button id="btn" type="primary" @click.stop="resetPasswd">确 定</el-button>
                        </div>
                    </el-dialog>
                    <el-dropdown-item>
                        <el-button style="color:#303133;" type="text" @click="gotologout">退出登录</el-button>
                    </el-dropdown-item>
                    <!-- 退出登录 -->
                    <el-dialog class="logoutDialog" title="" :visible.sync="dialogVisible" width="30%">
                        <span>确认退出登录？</span>
                        <span slot="footer" class="dialog-footer">
                            <el-button style="color:rgba(0, 0, 0, 0.65);background-color: #EEEEEE;" id="btn" type="text"
                                       @click.stop="cancel">取 消</el-button>
                            <el-button id="btn" type="primary" @click.stop="logout">确 定</el-button>
                        </span>
                    </el-dialog>
                </el-dropdown-menu>
            </el-dropdown>
        </div>
    </div>
    <!-- 三栏布局 flex布局-->
</template>

<script>
    let Base64 = require('js-base64').Base64;
    import moment from "moment";

    export default {
        name: 'headersix',
        data() {
            return {
                headerList: [{
                    id: '1',
                    name: 'Home',
                    title: '用户列表页'
                },],
                isShow: false,
                dialogVisible: false,
                clipse: false,
                cellphone: '',
                username: '',
                dialogFormVisible: false,
                oldpasswd: '',
                newpasswd1: '',
                newpasswd2: '',
                formLabelWidth: '120px',
                searchVisible: true,
                search: "",
                listData: [],
            }
        },
        methods: {
            getUserInfo() {
                const userInfo = JSON.parse(window.localStorage.getItem('Login_data'));
                this.cellphone = (userInfo.userdata.cellphone + '').substr(0, 3) + "****" + (userInfo.userdata.cellphone + '').substr(7);
                this.username = userInfo.userdata.username;
            },
            gotologout() {
                this.dialogVisible = true;
                this.clipse = false;
            },
            logout() {
                this.clipse = false;
                this.dialogVisible = false;
                window.localStorage.removeItem('Login_data');
                this.$router.push({
                    path: '/bbs/home'
                });
            },
            cancel() {
                this.clipse = false;
                this.dialogVisible = false;
            },
            gotoMy() {
                this.clipse = false;
                this.$router.push({
                    path: '/bbs/mycenter',
                    query: {
                        userid: JSON.parse(window.localStorage.getItem('Login_data')).userdata.id
                    }
                });
            },
            gotoSetting() {
                this.clipse = false;
                this.dialogFormVisible = true;
                this.oldpasswd = '';
                this.newpasswd1 = '';
                this.newpasswd2 = '';
            },
            resetPasswd() {
                if (this.newpasswd1 !== this.newpasswd2) {
                    this.$message({
                        showClose: true,
                        message: '两次输入的密码不一致',
                        type: 'error'
                    });
                    return null;
                }
                if (this.newpasswd1 === this.oldpasswd) {
                    this.$message({
                        showClose: true,
                        message: '新旧密码不能一致',
                        type: 'error'
                    });
                    return null;
                }
                const data = {
                    id: JSON.parse(window.localStorage.getItem('Login_data')).userdata.id,
                    password: this.newpasswd1,
                };
                fetch('/bbsdev/resetUserPassword', {
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
                                message: '修改密码成功',
                                type: 'success'
                            });
                            this.dialogFormVisible = false;
                            return res.data;
                        }
                    } else {
                        this.$message({
                            showClose: true,
                            message: '修改密码失败',
                            type: 'error'
                        });
                    }
                });
            },
            goSearch() {
                this.searchVisible = false;
                this.search = "";
            },
            goblur() {
                if (this.search === null || this.search === "") {
                    this.searchVisible = true;
                    window.location.reload();
                }
            },
            Search() {
                this.listData = [];
                if (this.search) {
                    const data1 = {
                        title: this.search,
                        ordertype: 'createTime'
                    };
                    fetch('/bbsdev/searchArticleList', {
                        method: 'post',
                        headers: {
                            'Content-type': 'application/json',
                        },
                        body: JSON.stringify(data1)
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
                } else {
                    const data2 = {
                        ordertype: 'createTime'
                    };
                    fetch('/bbsdev/getArticleList', {
                        method: 'post',
                        headers: {
                            'Content-type': 'application/json',
                        },
                        body: JSON.stringify(data2)
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
                                message: '获取资源列表失败',
                                type: 'error'
                            });
                        }
                    })
                }

            },
            gotoHome() {
                this.$router.push('/bbs/home_login');
            }
        },
        mounted() {
            this.oldpasswd = JSON.parse(window.localStorage.getItem('Login_data')).userdata.password;
            this.getUserInfo();
        }
    }
</script>

<style scoped>
    * {
        margin: 0;
        padding: 0;
        font-size: 15px;
    }

    .layout {
        background: #3d444c;
        text-align: center;
        height: 100%;
        display: flex;
        align-items: center;
    }

    .layout .left {
        width: 200px;
        height: 50px;
        text-align: left;
        padding-left: 1%;
        color: #ffffff;
        display: flex;
        align-items: center;
    }

    .layout .right {
        width: 100%;
        height: 50px;
        text-align: right;
        padding-right: 1%;
        padding-top: 10px;
        color: #ffffff;
    }

    .layout .center {
        width: 200px;
        height: 50px;
        text-align: left;
        padding-left: 1%;
        background-color: #31363d;
        padding-top: 10px;
    }

    .layout .right .search {
        position: relative;
        left: -30%;
        color: #fff;
        background: #31363e;
        padding: 5px;
        width: 25%;
        text-align: left;
    }

    #btn {
        margin-left: 20px;
        width: 80px;
        height: 30px;
        background-color: #1890ff;
    }

    .layout .right .searchbtn {
        position: relative;
        left: -30%;
        color: #fff;
        background: #1890ff;
        border-color: #1890ff;
        padding: 5px;
        width: 10%;
        text-align: center;
    }

    .el-dropdown-link {
        cursor: pointer;
        color: #ffffff;
    }

    .el-icon-arrow-down {
        font-size: 12px;
    }
</style>

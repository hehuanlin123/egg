<template>
<!-- 三栏布局 flex布局-->
<div class="layout">
    <div class="left">
        <span>
            <img style="height:30px;width:auto;" 
            src="https://upload-images.jianshu.io/upload_images/7761489-4fbbe8a5940e2301.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240" alt="">
            标签推荐系统
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
        <el-button class="search" size="mini" type="info" icon="el-icon-search">帖子、文章、用户</el-button>
        <el-dropdown>
            <span class="el-dropdown-link">
                <span>您好，</span>
                <span>{{ username? username : cellphone }}</span>
                <i class="el-icon-arrow-down el-icon--right"></i>
            </span>
            <el-dropdown-menu v-show="clipse" slot="dropdown">
                <el-dropdown-item>个人中心</el-dropdown-item>
                <el-dropdown-item>设置</el-dropdown-item>
                <el-dropdown-item>
                    <el-button type="text" @click="gotologout">退出登录</el-button>
                    <!-- 退出登录 -->
                    <el-dialog title="" :visible.sync="dialogVisible" width="30%" :before-close="handleClose">
                        <span>确认退出登录？</span>
                        <span slot="footer" class="dialog-footer">
                            <el-button type="text" @click.stop="cancel">取 消</el-button>
                            <el-button type="primary" @click.stop="logout">确 定</el-button>
                        </span>
                    </el-dialog>
                </el-dropdown-item>
            </el-dropdown-menu>
        </el-dropdown>
    </div>
</div>
<!-- 三栏布局 flex布局-->
</template>

<script>
export default {
    name: 'headerone',
    data() {
        return {
            headerList: [{
                id: '1',
                name: 'Home',
                title: '首页'
            }, ],
            isShow: false,
            dialogVisible: false,
            clipse: false,
            cellphone: '',
            username: ''
        }
    },
    methods: {
        getUserInfo() {
            const userInfo = JSON.parse(window.localStorage.getItem('Login_data'));
            this.cellphone = (userInfo.userdata.cellphone + '').substr(0, 3) + "****" + (userInfo.userdata.cellphone + '').substr(7);
            this.username = userInfo.userdata.username;
        },
        handleClose(done) {
            this.$confirm('确认关闭？')
                .then(_ => {
                    done();
                    console.log(_);
                })
                .catch(_ => {
                    console.log(_);
                });
        },
        gotologout() {
            this.clipse = false;
            this.dialogVisible = true;
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
        }
    },
    mounted() {
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
    padding-top: 10px;
    color: #ffffff;
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

.el-dropdown-link {
    color: #ffffff;
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
</style>

<template>
<!-- 三栏布局 flex布局-->
<div class="layout">
    <div class="left">
        <span>问答社区系统</span>
    </div>
    <div class="center">
        <ul>
            <li v-for="list in headerList" :key="list.id">
                <!--              <a href="#">-->
                <!--                {{ list.title }}-->
                <!--              </a>-->
                <el-link type="primary" href="#">{{ list.title }}</el-link>
            </li>
        </ul>
    </div>
    <div class="right">
        <el-button class="search" size="mini" type="info" icon="el-icon-search">帖子、文章、用户</el-button>
        <el-button class="login" type="text" @click="dialogLoginVisible = true">登录</el-button>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <el-button class="reg" type="text" @click="dialogRegVisible = true">注册</el-button>
        <el-dialog :visible.sync="dialogLoginVisible">
            <v-login @func1="getMsg1FormSon"></v-login>
        </el-dialog>
        <el-dialog :visible.sync="dialogRegVisible">
            <v-reg @func2="getMsg2FormSon"></v-reg>
        </el-dialog>
    </div>
</div>
<!-- 三栏布局 flex布局-->
</template>

<script>
import login from "../../../../views/bbs/app/Login";
import reg from "../../../../views/bbs/app/Register";

export default {
    name: 'headerone',
    components: {
        "v-login": login,
        "v-reg": reg,
    },
    data() {
        return {
            headerList: [{
                id: '1',
                name: 'Home',
                title: '首页'
            }, ],
            isShow: false,
            dialogLoginVisible: false,
            dialogRegVisible: false,
        }
    },
    methods: {
        getMsg1FormSon(data) {
            this.dialogLoginVisible = data
            console.log(this.dialogLoginVisible)
        },
        getMsg2FormSon(data) {
            this.dialogRegVisible = data
            console.log(this.dialogRegVisible)
        }
    }
}
</script>

<style scoped>
* {
    margin: 0;
    padding: 0;
    font-size: 15px;
    color: #ffffff;
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
}

.layout .right {
    width: 100%;
    height: 50px;
    text-align: right;
    padding-right: 1%;
    padding-top: 10px;
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
</style>

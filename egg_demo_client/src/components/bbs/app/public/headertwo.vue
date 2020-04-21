<template>
<!-- 三栏布局 flex布局-->
<div class="layout">
    <div class="left">Python论坛</div>
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
        <el-dropdown>
            <span class="el-dropdown-link">
                您好，15267272987<i class="el-icon-arrow-down el-icon--right"></i>
            </span>
            <el-dropdown-menu slot="dropdown">
                <el-dropdown-item>个人中心</el-dropdown-item>
                <el-dropdown-item>设置</el-dropdown-item>
                <el-dropdown-item>退出登录</el-dropdown-item>
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
            isShow: false
        }
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
</style>

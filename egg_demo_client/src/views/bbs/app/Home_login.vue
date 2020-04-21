<template>
<div>
    <v-headertwo></v-headertwo>
    <!-- 三栏布局 flex布局-->
    <div class="layout">
        <main>
            <div class="left">
                <v-head class="headimg"></v-head>
                <v-myinfo class="myinfo"></v-myinfo>
            </div>
            <div class="center">
                <v-activity></v-activity>
                <v-navigator style="margin-bottom: 10px;"></v-navigator>
            </div>
            <div class="right">
                <v-tag></v-tag>
            </div>
        </main>
        <v-footer class="footer"></v-footer>
    </div>
    <!-- 三栏布局 flex布局-->
    <el-backtop target=".page-component__scroll .el-scrollbar__wrap" :bottom="100">
        <div style="{
        height: 100%;
        width: 100%;
        background-color: #f2f5f6;
        box-shadow: 0 0 6px rgba(0,0,0, .12);
        text-align: center;
        line-height: 40px;
        color: #1989fa;
      }">
            UP
        </div>
    </el-backtop>
</div>
</template>

<script>
import headertwo from "../../../components/bbs/app/public/headertwo";
import footer from "../../../components/bbs/app/public/footer";
import navigator from "../../../components/bbs/app/home/navigator";
import tag_login from "../../../components/bbs/app/home/tag_login";
import head_login from "../../../components/bbs/app/home/head_login";
import activity from "../../../components/bbs/app/home/activity";
import myinfo from "../../../components/bbs/app/home/myinfo";

export default {
    name: "Home",
    components: {
        "v-headertwo": headertwo,
        "v-navigator": navigator,
        "v-tag": tag_login,
        "v-head": head_login,
        "v-activity": activity,
        'v-footer': footer,
        "v-myinfo": myinfo,
    },
    data() {
        return {};
    },
    methods: {},
    mounted: {}
};
</script>

<style scoped>
* {
    margin: 0;
    padding: 0;
    font-size: 10px;
}

.layout {
    text-align: center;
    height: 100%;
    overflow: hidden;
}

.layout .footer {
    width: 100%;
    height: 50px;
    background: #3d444c;
    color: #000000;
    text-align: center;
}

.layout main {
    width: 100%;
    height: 100%;
    background: #eee;
    display: flex;
    justify-content: space-between;
}

.layout main .left,
.layout main .right {
    width: 300px;
    height: 100%;
    color: #000000;
    padding-right: 10px;
}

.layout main .center {
    width: 100%;
    height: 100%;
}

.headimg {
    margin-top: 5px;
    width: 100%;
    background-color: #f1f9f8;
    position: relative;
    left: 20px;
}

.myinfo {
    margin-top: 5px;
    width: 100%;
    background-color: #ffffff;
    position: relative;
    left: 20px;
    padding: 5px 30px 5px 30px;
}
</style>

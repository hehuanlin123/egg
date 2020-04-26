<template>
<div>
    <v-headertwo></v-headertwo>
    <!-- 三栏布局 flex布局-->
    <div class="layout">
        <main>
            <div class="left">
                <v-head class="headimg"></v-head>
                <v-myinfo class="myinfo"></v-myinfo>
                <v-alluser class="alluser"></v-alluser>
                <v-alltopic class="alltopic"></v-alltopic>
            </div>
            <div class="center">
                <v-activity></v-activity>
                <v-navigator style="margin-bottom: 10px;"></v-navigator>
            </div>
            <div class="right">
                <v-tag></v-tag>
            </div>
        </main>
    </div>
    <!-- <v-footer class="footer"></v-footer> -->
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
// import footer from "../../../components/bbs/app/public/footer";
import navigator from "../../../components/bbs/app/home/navigator_login";
import tag_login from "../../../components/bbs/app/home/tag_login";
import head_login from "../../../components/bbs/app/home/head_login";
import activity_login from "../../../components/bbs/app/home/activity_login";
import myinfo_login from "../../../components/bbs/app/home/myinfo_login";
import alluser from "../../../components/bbs/app/home/alluser";
import alltopic from "../../../components/bbs/app/home/alltopic";

export default {
    name: "Home",
    components: {
        "v-headertwo": headertwo,
        "v-navigator": navigator,
        "v-tag": tag_login,
        "v-head": head_login,
        "v-activity": activity_login,
        // 'v-footer': footer,
        "v-myinfo": myinfo_login,
        "v-alluser": alluser,
        "v-alltopic": alltopic,
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

.footer {
    width: 100%;
    height: 50px;
    background: #3d444c;
    color: #000000;
    text-align: center;
    position: absolute;
    bottom: 0;
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
    background-color: #448cd6;
    color: #ffffff;
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

.alluser {
    margin-top: 5px;
    width: 100%;
    background-color: #ffffff;
    position: relative;
    left: 20px;
}

.alltopic {
    margin-top: 5px;
    width: 100%;
    background-color: #ffffff;
    position: relative;
    left: 20px;
}
</style>

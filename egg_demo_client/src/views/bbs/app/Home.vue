<template>
    <div>
        <v-headerone></v-headerone>
        <!-- 三栏布局 flex布局-->
        <div class="layout">
            <main>
                <div class="left">
                    <v-top class="headimg"></v-top>
                    <v-myinfo class="myinfo"></v-myinfo>
                    <v-alluser class="alluser"></v-alluser>
                    <!-- <v-alltopic class="alltopic"></v-alltopic> -->
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
        <!-- 三栏布局 flex布局-->
        <v-bottom class="foot"></v-bottom>
        <v-theader class="theader" @backtop="backtop"></v-theader>
    </div>
</template>

<script>
    import headerone from "../../../components/bbs/app/public/headerone";
    import bottom from "../../../components/bbs/app/public/bottom";
    import navigator from "../../../components/bbs/app/home/navigator";
    import tag from "../../../components/bbs/app/home/tag";
    import top from "../../../components/bbs/app/home/top";
    import activity from "../../../components/bbs/app/home/activity";
    import alluser from "../../../components/bbs/app/home/alluser";
    import myinfo from "../../../components/bbs/app/home/myinfo";
    import theader from "../../../components/bbs/app/home/THeader";

    export default {
        name: "Home",
        components: {
            "v-headerone": headerone,
            "v-navigator": navigator,
            "v-tag": tag,
            "v-top": top,
            "v-activity": activity,
            "v-bottom": bottom,
            "v-theader": theader,
            "v-myinfo": myinfo,
            "v-alluser": alluser,
        },
        data() {
            return {};
        },
        methods: {
            /**
             * 回到顶部功能实现过程：
             * 1. 获取页面当前距离顶部的滚动距离（虽然IE不常用了，但还是需要考虑一下兼容性的）
             * 2. 计算出每次向上移动的距离，用负的滚动距离除以5，因为滚动的距离是一个正数，想向上移动就是做一个减法
             * 3. 用当前距离加上计算出的距离，然后赋值给当前距离，就可以达到向上移动的效果
             * 4. 最后记得在移动到顶部时，清除定时器
             */
            backtop() {
                var timer = setInterval(function () {
                    let osTop = document.documentElement.scrollTop || document.body.scrollTop;
                    let ispeed = Math.floor(-osTop / 5);
                    document.documentElement.scrollTop = document.body.scrollTop = osTop + ispeed;
                    this.isTop = true;
                    if (osTop === 0) {
                        clearInterval(timer);
                    }
                }, 30)
            }
        },
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

    .foot {
        width: 100%;
        height: 150px;
        background: #3d444c;
        color: #ffffff;
        text-align: center;
        margin-top: 10px;
        position: fixed;
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

    .theader {
        position: fixed;
        height: 20%;
        right: 1%;
        top: 40%;
    }
</style>

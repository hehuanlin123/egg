<template>
    <!-- 三栏布局 flex布局-->
    <div class="layout">
        <main>
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
                <span class="login">登录</span>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <span class="reg">注册</span></div>
        </main>
    </div>
    <!-- 三栏布局 flex布局-->
</template>

<script>
    export default {
        name: 'headerone',
        data() {
            return {
                headerList: [
                    {id: '1', name: 'Home', title: '首页'},
                ],
                isShow: false
            }
        }
    }
</script>

<style scoped>
    * {
        margin: 0;
        padding: 0;
        font-size: 10px;
        color: #000000;
    }

    .layout {
        color: white;
        text-align: center;
        height: 100%;
        overflow: hidden;
    }

    .layout main {
        width: 100%;
        height: 100%;
        background: #faf4fa;
        display: flex;
        justify-content: space-between;
    }

    .layout main .left {
        width: 200px;
        height: 30px;
        background: #faf4fa;
        text-align: left;
        padding-left: 1%;
        padding-top: 15px;
    }

    .layout main .right {
        width: 100%;
        height: 30px;
        background: #f9f9f9;
        text-align: right;
        padding-right: 1%;
        padding-top: 15px;
    }

    .layout main .center {
        width: 200px;
        height: 30px;
        background: #f6faf4;
        text-align: left;
        padding-left: 1%;
        padding-top: 15px;
    }
</style>
<template>
    <div>
        <v-headerone></v-headerone>
        <v-headertwo v-if="false"></v-headertwo>
        <!-- 三栏布局 flex布局-->
        <div class="layout">
            <main>
                <div class="left">左边栏</div>
                <div class="center">
                    <v-navigator></v-navigator>
                </div>
                <div class="right">
                    <v-tag></v-tag>
                </div>
            </main>
            <footer>底部</footer>
        </div>
        <!-- 三栏布局 flex布局-->
    </div>
</template>

<script>
    import headerone from "../../../components/bbs/app/public/headerone";
    import headertwo from "../../../components/bbs/app/public/headertwo";
    import navigator from "../../../components/bbs/app/home/navigator";
    import tag from "../../../components/bbs/app/home/tag";

    export default {
        name: "Home",
        components: {
            "v-headerone": headerone,
            "v-headertwo": headertwo,
            "v-navigator": navigator,
            "v-tag": tag,
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
        color: white;
        text-align: center;
        height: 100%;
        overflow: hidden;
    }

    .layout footer {
        width: 100%;
        height: 50px;
        background: #ca8402;
        text-align: center;
    }

    .layout main {
        width: 100%;
        height: 100%;
        background: #e2faff;
        display: flex;
        justify-content: space-between;
    }

    .layout main .left,
    .layout main .right {
        width: 300px;
        height: 100%;
        background: #a78981;
    }

    .layout main .center {
        width: 100%;
        height: 100%;
        background: #fffaf1;
    }
</style>
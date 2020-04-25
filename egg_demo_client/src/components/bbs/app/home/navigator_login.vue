<template>
<div>
    <el-tabs class="tabs" v-model="activeName" type="card" @tab-click="handleclick">
        <!-- <el-tab-pane @click="handlenew" label="最新帖子">
            <v-postList :showtype='showtype'></v-postList>
        </el-tab-pane>
        <el-tab-pane @click="handlezan" label="点赞最多">
            <v-postList :showtype='showtype'></v-postList>
        </el-tab-pane>
        <el-tab-pane @click="handlepin" label="评论最多">
            <v-postList :showtype='showtype'></v-postList>
        </el-tab-pane> -->
        <el-tab-pane label="最新帖子" name="最新帖子">
            <v-postList ref="postList_login"></v-postList>
        </el-tab-pane>
        <el-tab-pane label="点赞最多" name="点赞最多">
            <v-postList ref="postList_login"></v-postList>
        </el-tab-pane>
        <el-tab-pane label="评论最多" name="评论最多">
            <v-postList ref="postList_login"></v-postList>
        </el-tab-pane>
    </el-tabs>
</div>
</template>

<script>
import postList_login from "./postList_login";

export default {
    name: "navigator",
    comments: {
        
    },
    components: {
        "v-postList": postList_login,
    },
    data() {
        return {
            activeName: '最新帖子',
            count: 0,
            loading: false,
            finished: false,
            list: [],
            isShow: [true, false, false, false]
        };
    },
    methods: {
        handleclick(tab, event) {
            console.log(tab, event);
            if (tab.label === "最新帖子") {
                this.$refs.postList_login.getLatest();
            } else if (tab.label === "点赞最多") {
                this.$refs.postList_login.getMostPraise();
            } else if (tab.label === "评论最多") {
                this.$refs.postList_login.getMostComment();
            } else {
                this.$refs.postList_login.getData();
            }
        },
        onLoad() {
            
        },
        handleClick(id) {
            this.$router.push({
                path: '/bbs/detail',
                query: {
                    id
                }
            })
        },
    },
    mounted() {
        
    }
};
</script>

<style scoped>
* {
    margin: 0;
    padding: 0;
}

body,
p {
    margin: 0;
}

.tabs {
    width: 90%;
    position: relative;
    left: 5%;
    margin-top: 10px;
}
</style>

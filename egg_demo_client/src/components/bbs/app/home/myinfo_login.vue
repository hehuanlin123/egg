<template>
<div class="myinfo">
    <ul>
        <!-- <li><i class="el-icon-star-off"></i><span style="margin-left:20px;">我的收藏</span></li> -->
        <!-- <el-divider></el-divider> -->
        <li><i class="el-icon-edit-outline"></i><span @click="gotoMypost" style="margin-left:20px;">我的帖子</span></li>
        <!-- <el-divider></el-divider> -->
        <li><i class="el-icon-chat-line-round"></i><span @click="gotoMyfriends" style="margin-left:20px;">我关注的用户</span></li>
        <!-- <el-divider></el-divider> -->
        <li><i class="el-icon-collection-tag"></i><span @click="gotoMytopic" style="margin-left:20px;">我关注的话题</span></li>
        <!-- <el-divider></el-divider> -->
    </ul>
</div>
</template>

<script>
export default {
    name: 'myinfo',
    data() {
        return {
            
        }
    },
    methods:{
        gotoMypost(){
            this.$router.push({path:'/bbs/post'});
        },
        gotoMyfriends(){
            this.$router.push({path:'/bbs/post'});
        },
        gotoMytopic(){
            this.$router.push({path:'/bbs/post'});
        }
    }
}
</script>

<style scoped>
* {
    padding: 0;
    margin: 0;
}
.myinfo{
    background-color: #ffffff;
    text-align: left;
}

li {
    margin: 10px auto;
}
</style>

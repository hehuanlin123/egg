<template>
<div class="myinfo">
    <ul @click="gotoMyinfo">
        <!-- <li><i class="el-icon-star-off"></i><span style="margin-left:20px;">我的收藏</span></li> -->
        <li><i class="el-icon-edit-outline"></i><span style="margin-left:20px;">我的帖子</span></li>
        <li><i class="el-icon-chat-line-round"></i><span style="margin-left:20px;">我关注的用户</span></li>
        <li><i class="el-icon-collection-tag"></i><span style="margin-left:20px;">我关注的话题</span></li>
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
    methods: {
        gotoMyinfo() {
            this.$message({
                showClose: true,
                message: '请先登录！',
                type: 'error'
            });
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

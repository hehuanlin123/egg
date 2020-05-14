<template>
<div class="demo-type">
    <div>
        <el-avatar src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png"></el-avatar>
        <p>游客，您好！</p>
        <a @click.prevent="gotoMy">TA的个人主页></a>
        <!-- 5 x 2 -->
        <div class="statics">
            <a-row>
                <a-col :span="6">资源数</a-col>
                <a-col :span="6">粉丝</a-col>
                <a-col :span="6">获赞</a-col>
                <a-col :span="6">评论</a-col>
            </a-row>
            <a-row>
                <a-col :span="6">{{statics.post}}</a-col>
                <a-col :span="6">{{statics.fans}}</a-col>
                <a-col :span="6">{{statics.priase}}</a-col>
                <a-col :span="6">{{statics.comment}}</a-col>
            </a-row>
        </div>

    </div>
</div>
</template>

<script>
export default {
    name: 'head',
    data() {
        return {
            statics: {
                post: 0,
                fans: 0,
                priase: 0,
                comment: 0
            }
        }
    },
    methods: {
        gotoMy(){
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

.statics {
    margin: 5px auto;
    width: 150px;
}
</style>

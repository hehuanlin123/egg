<template>
<div class="demo-type">
    <div>
        <el-avatar src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png"></el-avatar>
        <p>15267272987，您好！</p>
        <a @click.prevent="gotoMy">TA的个人主页></a>
        <!-- 5 x 2 -->
        <div class="statics">
            <a-row>
                <a-col :span="6">原创</a-col>
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
                post: 6,
                fans: 34,
                priase: 7,
                comment: 10
            }
        }
    },
    methods:{
        gotoMy(){
            this.$router.push({path:'/bbs/post'});
        },
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

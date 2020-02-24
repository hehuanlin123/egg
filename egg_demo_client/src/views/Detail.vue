<template>
    <div class="detail">
        <div class="title">{{detail.title}}</div>
        <div class="create-time">{{detail.createTime}}</div>
        <div class="img">
            <img :src="detail.img" alt="">
        </div>
        <div class="summary">{{detail.summary}}</div>
        <div class="content">{{detail.content}}</div>
    </div>
</template>

<script>
    export default {
        name: "Detail",
        data(){
            return{
                detail:{
                    id:4,
                    title:'标题',
                    img:'http://localhost:63342/egg_demo_client/src/assets/demo.jpg',
                    summary:'这是简介',
                    content:'文章内容，文章内容，文章内容，文章内容，文章内容，文章内容，文章内容',
                    createTime:'2020-02-24 10:09:26'
                }
            }
        },
    }
</script>

<style scoped>
    .detail{
        padding: 20px;
        text-align: left;
    }
    .detail .title{
        font-size: 25px;
        padding-bottom: 20px;
    }
    .detail .create-time{
        color: darkgrey;
    }
    .detail .summary{
        padding: 20px;
        background: #fff8f9;
    }
    .detail .img{
        padding: 20px;
        text-align: center;
    }
    .detail .content{
        text-indent: 2em;
        line-height: 200%;
        padding-top: 20px;
    }

</style>
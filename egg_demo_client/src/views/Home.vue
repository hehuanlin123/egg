<template>
    <div>
        <van-list
                v-model="loading"
                :finished="finished"
                finished-text="没有更多了"
                @load="onLoad"
        >
            <van-cell
                    v-for="item in list"
                    :key="item.id"
                    @click="handleClick(item.id)"
            >
                <div class="listItem">
                    <div class="left">
                        <img :src="item.img" alt="">
                    </div>
                    <div class="right">
                        <div class="title">{{item.title}}</div>
                        <div class="create-time">{{item.createTime}}</div>
                    </div>
                </div>
            </van-cell>
        </van-list>
    </div>
</template>

<script>
    import {List,Cell} from 'vant';

    export default {
        name: "Home",
        comments:{
            [List.name]:List,
            [Cell.name]:Cell,
        },
        data(){
            return {
                loading:false,
                finished:false,
                list:[],
            }
        },
        methods:{
            onLoad(){
                setTimeout(()=>{
                    this.loading = false;
                    this.finished = false;
                    this.list = [
                        {
                            id:1,
                            title:'标题',
                            img:'http://localhost:63342/egg_demo_client/src/assets/demo.jpg',
                            summary:'这是简介',
                            content:'文章内容，文章内容，文章内容，文章内容，文章内容，文章内容，文章内容',
                            createTime:'2020-02-24 10:09:26'
                        },
                        {
                            id:2,
                            title:'标题',
                            img:'http://localhost:63342/egg_demo_client/src/assets/demo.jpg',
                            summary:'这是简介',
                            content:'文章内容，文章内容，文章内容，文章内容，文章内容，文章内容，文章内容',
                            createTime:'2020-02-24 10:09:26'
                        },
                        {
                            id:3,
                            title:'标题',
                            img:'http://localhost:63342/egg_demo_client/src/assets/demo.jpg',
                            summary:'这是简介',
                            content:'文章内容，文章内容，文章内容，文章内容，文章内容，文章内容，文章内容',
                            createTime:'2020-02-24 10:09:26'
                        },
                        {
                            id:4,
                            title:'标题',
                            img:'http://localhost:63342/egg_demo_client/src/assets/demo.jpg',
                            summary:'这是简介',
                            content:'文章内容，文章内容，文章内容，文章内容，文章内容，文章内容，文章内容',
                            createTime:'2020-02-24 10:09:26'
                        },
                        {
                            id:5,
                            title:'标题',
                            img:'http://localhost:63342/egg_demo_client/src/assets/demo.jpg',
                            summary:'这是简介',
                            content:'文章内容，文章内容，文章内容，文章内容，文章内容，文章内容，文章内容',
                            createTime:'2020-02-24 10:09:26'
                        },
                    ]
                },1000)
            },
            handleClick(id){
                this.$router.push({
                    path:'/detail',
                    query:{
                        id
                    }
                })
            },
        },
    }
</script>

<style scoped>
    .listItem{
        display: flex;
        flex-direction: row;
    }
    .listItem .left, img{
        width: 150px;
        height: 100px;
        border-radius: 10px;
    }
    .listItem .right {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        margin-left: 15px;
    }
    .listItem .right .title {
        font-size: 18px;
    }
    .listItem .right .create-time {
        font-size: 15px;
        color: darkgrey;
    }
</style>
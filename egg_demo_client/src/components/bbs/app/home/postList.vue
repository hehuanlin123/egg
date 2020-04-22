<template>
<div>
    <a-list class="list" itemLayout="vertical" size="large" :pagination="pagination" :dataSource="listData">
        <a-list-item @click="gotoDetail(item)" class="item" slot="renderItem" slot-scope="item" key="item.title">
            <template slot="actions" v-for="{ type, text } in actions">
                <span style="margin-left:40px;" :key="type">
                    <a-icon :type="type" style="margin-right: 8px" />
                    {{ text }}
                </span>
            </template>
            <!-- <img class="logo" slot="extra" width="272" alt="logo" src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1587057993978&di=0604ac9d947fab215f8f0eaf82690035&imgtype=0&src=http%3A%2F%2Fku.90sjimg.com%2Felement_origin_min_pic%2F00%2F05%2F45%2F66568f439ec3544.jpg" /> -->
            <span class="title">
                <el-avatar src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png"></el-avatar>
<!--                <a-icon style="margin-left:5px;" type="tag" />{{item.tag}}-->
                <el-button @click.stop="gotoAddfriends" style="margin-left:5px;" size="mini" type="primary" round>+ 关注</el-button>
                <span style="margin-left:5px;"> {{item.posttype}}</span>
            </span>
            <!-- <a-list-item-meta :description="item.description"> -->
            <!-- <a slot="title" :href="item.href"></a> -->
            <!-- <a-avatar slot="avatar" :src="item.avatar" /> -->
            <!-- </a-list-item-meta> -->
            <div>
                <p style="margin-left:40px;">{{ item.description }}</p>
                <p style="margin-left:40px;">{{ item.content }}</p>
            </div>
            <div style="margin-left:40px;">
                <el-tag size="mini" type="info">标签一</el-tag>
                <el-tag style="margin-left:5px;" size="mini" type="info">标签二</el-tag>
                <el-tag style="margin-left:5px;" size="mini" type="info">标签三</el-tag>
                <el-tag style="margin-left:5px;" size="mini" type="info">标签四</el-tag>
                <el-tag style="margin-left:5px;" size="mini" type="info">标签五</el-tag>
            </div>
        </a-list-item>
    </a-list>
</div>
</template>

<script>
export default {
    name: "postList",
    props: {
        'posttype': String,
    },
    data() {
        return {
            listData: [],
            pagination: {
                onChange: page => {
                    console.log(page);
                },
                pageSize: 3,
            },
            // {
            //    type: 'star-o',
            //    text: '156'
            //  },
            actions: [
                {
                    type: 'like-o',
                    text: '156'
                },
                {
                    type: 'message',
                    text: '2'
                },
            ],
        };
    },
    methods: {
        getData() {
            console.log(this.posttype)
            const listData1 = this.listData;
            // posttype -- 发帖了 、 说
            for (let i = 0; i < 2; i++) {
                listData1.push({
                    href: 'https://www.antdv.com/',
                    title: `帖子 ${i}`,
                    tag: '自定义标签',
                    posttype: '发帖了',
                    avatar: 'https://zos.alipayobjects.com/rmsportal/ODTLcjxAfvqbxHnVXCYX.png',
                    description: '学习python学习python学习python学习python学习python学习python',
                    content: 'python flask django sklearn jupyterpython flask django sklearn jupyterpython flask django sklearn jupyterpython flask django sklearn jupyter',
                });
            }
        },
        gotoDetail(item){
            this.$router.push({
                path:'/bbs/detail',
                query:{
                    postid:item.postid
                }
            });
        },
        gotoAddfriends(){
            this.$message({
                showClose: true,
                message: '请先登录！',
                type: 'error'
            });

        }
    },
    mounted() {
        this.getData()
    }
};
</script>

<style>
* {
    padding: 0;
    margin: 0;
}

.logo {
    height: 100px;
    width: auto;
}

.list {
    width: 90%;
    position: relative;
    left: 5%;
}

.item {
    background-color: #ffffff;
    text-align: left;
}

.tag {
    font-size: 10px;
}

.title {
    display: flex;
    align-items: center;
    /*定义body的元素垂直居中*/
}
</style>

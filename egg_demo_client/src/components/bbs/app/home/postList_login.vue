<template>
<div>
    <a-list :dataSource="articlelistData ? articlelistData : listData" class="list" itemLayout="vertical" size="large" :pagination="pagination">
        <a-list-item @click="gotoDetail()" class="item" slot="renderItem" slot-scope="item" key="item.title">
            <!-- <template slot="actions" v-for="{ type, text } in actions">
                <span style="margin-left:40px;" :key="type">
                    <a-icon :type="type" style="margin-right: 8px" />
                    {{ text }}
                </span>
            </template> -->
            <!-- <img class="logo" slot="extra" width="272" alt="logo" src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1587057993978&di=0604ac9d947fab215f8f0eaf82690035&imgtype=0&src=http%3A%2F%2Fku.90sjimg.com%2Felement_origin_min_pic%2F00%2F05%2F45%2F66568f439ec3544.jpg" /> -->
            <span class="title">
                <el-avatar src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png"></el-avatar>
                <!-- <a-icon style="margin-left:5px;" type="tag" />{{item.tag}} -->
                {{item.author}}
                <!-- <el-button @click="gotoAddfriends" style="margin-left:5px;" size="mini" type="primary" round>+ 关注</el-button> -->
                <span style="margin-left:5px;">{{item.posttype}}</span>
                <span class="time">发表于{{item.time}}</span>
            </span>
            <!-- <a-list-item-meta :description="item.description"> -->
            <!-- <a slot="title" :href="item.href"></a> -->
            <!-- <a-avatar slot="avatar" :src="item.avatar" /> -->
            <!-- </a-list-item-meta> -->
            <div>
                <p style="margin-left:40px;"><b>{{ item.description }}</b></p>
                <p style="margin-left:40px;">
                    <span class="postcontent" v-html="item.content">{{ item.content }}</span>
                    <span class="showmore" v-if="item.more">查看更多</span>
                </p>
            </div>
            <div style="margin-left:40px;">
                <span v-bind:key="index" v-for="(tag,index) in item.taglist">
                    <el-tag id="el-tag-post" size="mini" type="info">{{tag}}</el-tag>
                </span>
            </div>
            <div class="footer">
                <a-row>
                    <a-col :span="6" id="post_zan">
                        <a-icon type="like" />
                        <span style="margin-left:5px;"> {{item.zan ? item.zan : 0}} </span>
                    </a-col>
                    <a-col :span="6" id="post_pin">
                        <a-icon type="message" />
                        <span style="margin-left:5px;"> {{item.pin ? item.pin : 0}} </span>
                    </a-col>
                    <a-col :span="6"></a-col>
                    <a-col :span="6"></a-col>
                </a-row>
            </div>
        </a-list-item>
    </a-list>
</div>
</template>

<script>
let Base64 = require('js-base64').Base64;
import moment from 'moment';

export default {
    name: "postList",
    props: {

    },
    data() {
        return {
            listData: [],
            pagination: {
                onChange: page => {
                    console.log(page);
                },
                pageSize: 2,
            },
            // {
            //    type: 'star-o',
            //    text: '156'
            //  },
            actions: [{
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
            this.listData = [];
            // posttype -- 发帖了 、 说
            this.listData.push({
                time: '2020-04-25 12:11:09',
                taglist: ['offer比较', '求职', '面经', '校招'],
                pin: '10',
                zan: '2',
                more: true,
                title: '帖子1',
                author: 'Sakura最好了！',
                posttype: '发帖了',
                avatar: 'https://zos.alipayobjects.com/rmsportal/ODTLcjxAfvqbxHnVXCYX.png',
                description: 'offer比较，路过的大佬给点意见呗 ',
                content: ' 双非渣本，前端开发岗 1、shopee 薪资X，其他福利一点没有 优点：公积金10%，双休，不怎么加班 2、深信服薪资绩效加补贴大概是X+2，公积金5% 优点：技术可能比shopee强吧，吃饭一天只要10块 缺点：听说华为文化，加班超级严重 本来以为shopee能拿到我理想的，这样我就不用犹豫了，可是最后一批校招却是...',
            });
            for (var i = 1; i < 100; i++) {
                this.listData.push({
                    time: '2020-04-25 12:11:09',
                    taglist: ['心情', 'Java求职圈', '职场生活'],
                    title: '帖子2',
                    author: '怪叔⃢-⃢',
                    posttype: '说',
                    avatar: 'https://zos.alipayobjects.com/rmsportal/ODTLcjxAfvqbxHnVXCYX.png',
                    description: '',
                    content: '不要和我谈理想',
                });
            }
            this.$store.commit("article/getarticlelist", this.listData);
        },
        // 查询帖子列表--最新
        getLatest() {
            this.listData = [];
            const data1 = {
                ordertype: 'createTime'
            };
            fetch('/bbsdev/getArticleList', {
                method: 'post',
                headers: {
                    'Content-type': 'application/json',
                },
                body: JSON.stringify(data1)
            }).then(res => res.json()).then(res => {
                console.log(res)
                if (res.status == 200) {
                    // 获取帖子数据
                    if (res.data) {
                        console.log(res.data);
                        res.data.forEach(element => {
                            let more = true;
                            if (Base64.decode(element.content).length > 100) {
                                more = true; // 显示更多
                            } else {
                                more = false;
                            }
                            this.listData.push({
                                id: element.id,
                                taglist: element.taglist.split(','),
                                pin: element.comment_count,
                                zan: element.praise_count,
                                more: more,
                                title: element.id,
                                author: element.author_id,
                                posttype: element.posttype,
                                description: element.title,
                                content: Base64.decode(element.content),
                                time: moment(element.createTime).format('YYYY-MM-DD HH:mm:ss')
                            });
                        });
                        this.$store.commit("article/getarticlelist", this.listData);
                    }
                } else {
                    this.$message({
                        showClose: true,
                        message: '获取帖子列表失败',
                        type: 'error'
                    });
                }
            })
        },
        // 查询帖子列表--最多点赞
        getMostPraise() {
            this.listData = [];
            const data2 = {
                ordertype: 'praise_count',
            };
            fetch('/bbsdev/getArticleList', {
                method: 'post',
                headers: {
                    'Content-type': 'application/json',
                },
                body: JSON.stringify(data2)
            }).then(res => res.json()).then(res => {
                console.log(res)
                if (res.status == 200) {
                    // 获取帖子数据
                    if (res.data) {
                        res.data.forEach(element => {
                            let more = true;
                            if (Base64.decode(element.content).length > 100) {
                                more = true; // 显示更多
                            } else {
                                more = false;
                            }
                            this.listData.push({
                                id: element.id,
                                taglist: element.taglist.split(','),
                                pin: element.comment_count,
                                zan: element.praise_count,
                                more: more,
                                title: element.id,
                                author: element.author_id,
                                posttype: element.posttype,
                                description: element.title,
                                content: Base64.decode(element.content),
                                time: moment(element.createTime).format('YYYY-MM-DD HH:mm:ss')
                            });
                        });
                        this.$store.commit("article/getarticlelist", this.listData);
                    }
                } else {
                    this.$message({
                        showClose: true,
                        message: '获取帖子列表失败',
                        type: 'error'
                    });
                }
            })
        },
        // 查询帖子列表--最多评论
        getMostComment() {
            this.listData = [];
            const data3 = {
                ordertype: 'comment_count',
            };
            fetch('/bbsdev/getArticleList', {
                method: 'post',
                headers: {
                    'Content-type': 'application/json',
                },
                body: JSON.stringify(data3)
            }).then(res => res.json()).then(res => {
                console.log(res)
                if (res.status == 200) {
                    // 获取帖子数据
                    if (res.data) {
                        res.data.forEach(element => {
                            let more = true;
                            if (Base64.decode(element.content).length > 100) {
                                more = true; // 显示更多
                            } else {
                                more = false;
                            }
                            this.listData.push({
                                id: element.id,
                                taglist: element.taglist.split(','),
                                pin: element.comment_count,
                                zan: element.praise_count,
                                more: more,
                                title: element.id,
                                author: element.author_id,
                                posttype: element.posttype,
                                description: element.title,
                                content: Base64.decode(element.content),
                                time: moment(element.createTime).format('YYYY-MM-DD HH:mm:ss')
                            });
                        });
                        this.$store.commit("article/getarticlelist", this.listData);
                    }
                } else {
                    this.$message({
                        showClose: true,
                        message: '获取帖子列表失败',
                        type: 'error'
                    });
                }
            })
        },
        gotoDetail() {
            this.$router.push({
                path: '/bbs/detail',
                query: {
                    id: 5,
                }
            });
        },
        gotoAddfriends() {
            this.$message({
                showClose: true,
                message: '关注成功！',
                type: 'success'
            });
        }
    },
    mounted() {
        this.getLatest();
    },
    computed: {
        plate() {
            return this.$store.state.article.plate;
        },
        articlelistData() {
            return this.$store.state.article.articlelist;
        },
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
    width: 100%;
    position: relative;
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

#el-tag-post {
    margin-left: 3px;
}

.footer {
    margin-left: 40px;
    margin-top: 5px;
}

#post_zan {
    display: flex;
    align-items: center;
}

#post_pin {
    display: flex;
    align-items: center;
}

.showmore {
    color: #1890ff;
}

.postcontent {
    width: 90%;
    display: -webkit-box;
    text-overflow: ellipsis;
    /*超出内容用省略号*/
    overflow: hidden;
    /*内容超出后隐藏*/
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 3;
    /*3行*/
    word-break: break-all;
}

.time {
    margin-left: 5px;
    position: absolute;
    right: 5%;
    font-size: 10px;
    color: gray;
}
</style>

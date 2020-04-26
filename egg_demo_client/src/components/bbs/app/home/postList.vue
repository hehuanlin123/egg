<template>
<div>
    <a-list :dataSource="articlelistData ? articlelistData : listData" :pagination="pagination" class="list" itemLayout="vertical" size="large">
        <a-list-item @click="gotoDetail()" class="item" key="item.title" slot="renderItem" slot-scope="item">
            <span class="title">
                <el-avatar :src="item.avatar"></el-avatar>
                {{item.author}}
                <span style="margin-left:5px;"> {{item.posttype}}</span>
                <span class="time">发表于{{item.time}}</span>
            </span>
            <div>
                <p style="margin-left:40px;"><b>{{ item.description }}</b></p>
                <p style="margin-left:40px;">
                    <span class="postcontent" v-html="item.content">{{ item.content }}</span>
                </p>
            </div>
            <e-actions>
                <span @click="gotoDetail(item)" class="showmore" v-if="item.more">查看更多</span>
            </e-actions>
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
                avatar: 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png',
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
                    avatar: 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png',
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
                ordertype: 'createTime',
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
        gotoDetail(item) {
            this.$router.push({
                path: '/bbs/detail',
                query: {
                    id: item.id,
                }
            });
        },
        gotoAddfriends() {
            this.$message({
                showClose: true,
                message: '请先登录！',
                type: 'error'
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

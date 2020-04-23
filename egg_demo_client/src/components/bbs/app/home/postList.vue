<template>
    <div>
        <a-list :dataSource="listData" :pagination="pagination" class="list" itemLayout="vertical" size="large">
            <a-list-item @click="gotoDetail(item)" class="item" key="item.title" slot="renderItem" slot-scope="item">
                <!-- <template slot="actions" v-for="{ type, text } in actions">
                    <span style="margin-left:40px;" :key="type">
                        <a-icon :type="type" style="margin-right: 8px" />
                        {{ text }}
                    </span>
                </template> -->
                <!-- <img class="logo" slot="extra" width="272" alt="logo" src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1587057993978&di=0604ac9d947fab215f8f0eaf82690035&imgtype=0&src=http%3A%2F%2Fku.90sjimg.com%2Felement_origin_min_pic%2F00%2F05%2F45%2F66568f439ec3544.jpg" /> -->
                <span class="title">
                <el-avatar src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png"></el-avatar>
                    <!-- <a-icon style="margin-left:5px;" type="tag" />{{item.tag}}-->
                {{item.author}}
                <el-button @click.stop="gotoAddfriends" round size="mini" style="margin-left:5px;"
                           type="primary">+ 关注</el-button>
                <span style="margin-left:5px;"> {{item.posttype}}</span>
            </span>
                <!-- <a-list-item-meta :description="item.description"> -->
                <!-- <a slot="title" :href="item.href"></a> -->
                <!-- <a-avatar slot="avatar" :src="item.avatar" /> -->
                <!-- </a-list-item-meta> -->
                <div>
                    <p style="margin-left:40px;">{{ item.description }}</p>
                    <p style="margin-left:40px;">
                        <span class="postcontent">{{ item.content }}</span>
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
                            <a-icon type="like"/>
                            <span>点赞 {{item.zan}}</span></a-col>
                        <a-col :span="6" id="post_pin">
                            <a-icon type="message"/>
                            <span>评论 {{item.pin}}</span></a-col>
                        <a-col :span="6"></a-col>
                        <a-col :span="6"></a-col>
                    </a-row>
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
                console.log(this.posttype)
                const listData1 = this.listData;
                // posttype -- 发帖了 、 说
                listData1.push({
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
                listData1.push({
                    taglist: ['#心情', '#Java求职圈', '#职场生活'],
                    pin: '9',
                    zan: '3',
                    more: false,
                    title: '帖子2',
                    author: '怪叔⃢-⃢',
                    posttype: '说',
                    avatar: 'https://zos.alipayobjects.com/rmsportal/ODTLcjxAfvqbxHnVXCYX.png',
                    description: '',
                    content: '不要和我谈理想',
                });
            },
            // 查询帖子列表--最新
            getLatest(){
                const data1 = {
                    ordertype:'create_time',
                };
                fetch('/bbs/getArticleList', {
                    method: 'post',
                    headers: {
                        'Content-type': 'application/json',
                    },
                    body: JSON.stringify(data1)
                }).then(res => res.json()).then(res => {
                    console.log(res)
                    if (res.status == 200) {
                        // 获取帖子数
                        this.statics.post = res.data.length;
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
            getMostPraise(){
                const data1 = {
                    ordertype:'praise_count',
                };
                fetch('/bbs/getArticleList', {
                    method: 'post',
                    headers: {
                        'Content-type': 'application/json',
                    },
                    body: JSON.stringify(data1)
                }).then(res => res.json()).then(res => {
                    console.log(res)
                    if (res.status == 200) {
                        // 获取帖子数
                        this.statics.post = res.data.length;
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
            getMostComment(){
                const data1 = {
                    ordertype:'comment_count',
                };
                fetch('/bbs/getArticleList', {
                    method: 'post',
                    headers: {
                        'Content-type': 'application/json',
                    },
                    body: JSON.stringify(data1)
                }).then(res => res.json()).then(res => {
                    console.log(res)
                    if (res.status == 200) {
                        // 获取帖子数
                        this.statics.post = res.data.length;
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
                        postid: item.postid
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
        width: 200px;
        display: -webkit-box;
        text-overflow: ellipsis; /*超出内容用省略号*/
        overflow: hidden; /*内容超出后隐藏*/
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 3; /*3行*/
        word-break: break-all;
    }
</style>

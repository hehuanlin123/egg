<template>
    <div>
        <a-list :dataSource="articlelistData" class="list" itemLayout="vertical" size="large" :pagination="pagination">
            <a-list-item class="item" slot="renderItem" slot-scope="item" key="item.title">
            <span class="title">
                <el-avatar style="margin-left: 5px;"
                           src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png"></el-avatar>
                <span>{{item.author_name}}</span>
                <span style="margin-left:5px;">{{item.posttype}}</span>
                <span class="time">发表于{{item.time}}</span>
            </span>
                <div>
                    <p style="margin-left:40px;"><b>{{ item.description }}</b></p>
                    <p style="margin-left:40px;">
                        <span class="postcontent" v-html="item.content">{{ item.content }}</span>
                    </p>
                </div>
                <e-actions>
                    <span @click="gotoDetail(item)" class="showmore">查看更多</span>
                </e-actions>
                <div style="margin-left:40px;">
                <span v-bind:key="index" v-for="(tag,index) in item.taglist">
                    <el-tag id="el-tag-post" size="mini" type="info">{{tag}}</el-tag>
                </span>
                </div>
                <div class="footer">
                    <a-row>
                        <a-col :span="6" id="post_zan">
                            <a-icon type="like"/>
                            <span style="margin-left:5px;"> {{item.zan ? item.zan : 0}} </span>
                        </a-col>
                        <a-col :span="6" id="post_pin">
                            <a-icon type="message"/>
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
        props: {},
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
            // 查询资源列表--最新
            getLatest() {
                const rLoading = this.openLoading();
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
                        // 获取资源数据
                        if (res.data) {
                            console.log(res.data);
                            res.data.forEach(element => {
                                let more = false;
                                let showcontent = '';
                                if (Base64.decode(element.content).length > 100) {
                                    more = true; // 显示更多
                                    showcontent = Base64.decode(element.content).substr(0, 100) + '...';
                                } else {
                                    more = false;
                                    showcontent = Base64.decode(element.content);
                                }
                                if (element.author_name === JSON.parse(window.localStorage.getItem('Login_data')).userdata.username) {
                                    element.author_name = "我";
                                }

                                // 查询点赞数
                                let zan;
                                const pdata = {
                                    post_id: element.id
                                };
                                fetch('/bbsdev/getPostPraise', {
                                    method: 'post',
                                    headers: {
                                        'Content-type': 'application/json',
                                    },
                                    body: JSON.stringify(pdata)
                                }).then(res => res.json()).then(res => {
                                    console.log(res);
                                    if (res.status == 200) {
                                        // 获取文章点赞数
                                        if (res.data.result) {
                                            zan = res.data.result.length;
                                            console.log("====737388euueyuy7373ey3ue77===  " + res.data.result.length);
                                            // 更新文章点赞数
                                            const updata = {
                                                id: element.id,
                                                praise_count: zan,
                                            };
                                            fetch('/bbsdev/updateArticle', {
                                                method: 'post',
                                                headers: {
                                                    'Content-type': 'application/json',
                                                },
                                                body: JSON.stringify(updata)
                                            }).then(res => res.json()).then(res => {
                                                console.log(res)
                                                if (res.status == 200) {
                                                    // 获取资源数据
                                                    if (res.data) {
                                                        console.log(res.data);
                                                    }
                                                } else {
                                                    this.$message({
                                                        showClose: true,
                                                        message: '更新资源信息失败',
                                                        type: 'error'
                                                    });
                                                }
                                            })
                                        }
                                    } else {
                                        this.$message({
                                            showClose: true,
                                            message: '获取文章点赞数失败',
                                            type: 'error'
                                        });
                                    }
                                })

                                // 查询评论数
                                let pin;
                                const cdata = {
                                    post_id: element.id
                                };
                                fetch('/bbsdev/getPostCommentCount', {
                                    method: 'post',
                                    headers: {
                                        'Content-type': 'application/json',
                                    },
                                    body: JSON.stringify(cdata)
                                }).then(res1 => res1.json()).then(res1 => {
                                    console.log(res1)
                                    if (res1.status == 200) {
                                        // 获取文章评论数
                                        if (res1.data) {
                                            fetch('/bbsdev/getPostReplyCount', {
                                                method: 'post',
                                                headers: {
                                                    'Content-type': 'application/json',
                                                },
                                                body: JSON.stringify(cdata)
                                            }).then(res2 => res2.json()).then(res2 => {
                                                console.log(res2)
                                                if (res2.status == 200) {
                                                    // 获取文章回复数
                                                    if (res2.data) {
                                                        pin = res1.data.length + res2.data.length;
                                                        // 更新文章评论数
                                                        const ucdata = {
                                                            id: element.id,
                                                            comment_count: pin,
                                                        };
                                                        fetch('/bbsdev/updateArticle', {
                                                            method: 'post',
                                                            headers: {
                                                                'Content-type': 'application/json',
                                                            },
                                                            body: JSON.stringify(ucdata)
                                                        }).then(res => res.json()).then(res => {
                                                            console.log(res)
                                                            if (res.status == 200) {
                                                                // 获取资源数据
                                                                if (res.data) {
                                                                    console.log(res.data);
                                                                }
                                                            } else {
                                                                this.$message({
                                                                    showClose: true,
                                                                    message: '更新资源信息失败',
                                                                    type: 'error'
                                                                });
                                                            }
                                                        })
                                                    }
                                                } else {
                                                    this.$message({
                                                        showClose: true,
                                                        message: '获取文章回复数失败',
                                                        type: 'error'
                                                    });
                                                }
                                            })
                                        }
                                    } else {
                                        this.$message({
                                            showClose: true,
                                            message: '获取文章评论数失败',
                                            type: 'error'
                                        });
                                    }
                                })

                                this.listData.push({
                                    id: element.id,
                                    taglist: element.taglist.split(','),
                                    pin: pin,
                                    zan: zan,
                                    more: more,
                                    title: element.id,
                                    author_id: element.author_id,
                                    author_name: element.author_name,
                                    posttype: element.posttype,
                                    description: element.title,
                                    content: showcontent,
                                    time: moment(element.createTime).format('YYYY-MM-DD HH:mm:ss')
                                });
                            });
                            this.$store.commit("article/getarticlelist", this.listData);
                            rLoading.close();
                        }
                    } else {
                        this.$message({
                            showClose: true,
                            message: '获取资源列表失败',
                            type: 'error'
                        });
                    }
                })
            },
            // 查询资源列表--最多点赞
            getMostPraise() {
                const rLoading = this.openLoading();
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
                        // 获取资源数据
                        if (res.data) {
                            console.log(res.data);
                            res.data.forEach(element => {
                                let more = false;
                                let showcontent = '';
                                if (Base64.decode(element.content).length > 100) {
                                    more = true; // 显示更多
                                    showcontent = Base64.decode(element.content).substr(0, 100) + '...';
                                } else {
                                    more = false;
                                    showcontent = Base64.decode(element.content);
                                }
                                if (element.author_name === JSON.parse(window.localStorage.getItem('Login_data')).userdata.username) {
                                    element.author_name = "我";
                                }

                                // 查询点赞数
                                let zan;
                                const pdata = {
                                    post_id: element.id
                                };
                                fetch('/bbsdev/getPostPraise', {
                                    method: 'post',
                                    headers: {
                                        'Content-type': 'application/json',
                                    },
                                    body: JSON.stringify(pdata)
                                }).then(res => res.json()).then(res => {
                                    console.log(res);
                                    if (res.status == 200) {
                                        // 获取文章点赞数
                                        if (res.data.result) {
                                            zan = res.data.result.length;
                                            console.log("====737388euueyuy7373ey3ue77===  " + res.data.result.length);
                                            // 更新文章点赞数
                                            const updata = {
                                                id: element.id,
                                                praise_count: zan,
                                            };
                                            fetch('/bbsdev/updateArticle', {
                                                method: 'post',
                                                headers: {
                                                    'Content-type': 'application/json',
                                                },
                                                body: JSON.stringify(updata)
                                            }).then(res => res.json()).then(res => {
                                                console.log(res)
                                                if (res.status == 200) {
                                                    // 获取资源数据
                                                    if (res.data) {
                                                        console.log(res.data);
                                                    }
                                                } else {
                                                    this.$message({
                                                        showClose: true,
                                                        message: '更新资源信息失败',
                                                        type: 'error'
                                                    });
                                                }
                                            })
                                        }
                                    } else {
                                        this.$message({
                                            showClose: true,
                                            message: '获取文章点赞数失败',
                                            type: 'error'
                                        });
                                    }
                                })

                                // 查询评论数
                                let pin;
                                const cdata = {
                                    post_id: element.id
                                };
                                fetch('/bbsdev/getPostCommentCount', {
                                    method: 'post',
                                    headers: {
                                        'Content-type': 'application/json',
                                    },
                                    body: JSON.stringify(cdata)
                                }).then(res1 => res1.json()).then(res1 => {
                                    console.log(res1)
                                    if (res1.status == 200) {
                                        // 获取文章评论数
                                        if (res1.data) {
                                            fetch('/bbsdev/getPostReplyCount', {
                                                method: 'post',
                                                headers: {
                                                    'Content-type': 'application/json',
                                                },
                                                body: JSON.stringify(cdata)
                                            }).then(res2 => res2.json()).then(res2 => {
                                                console.log(res2)
                                                if (res2.status == 200) {
                                                    // 获取文章回复数
                                                    if (res2.data) {
                                                        pin = res1.data.length + res2.data.length;
                                                        // 更新文章评论数
                                                        const ucdata = {
                                                            id: element.id,
                                                            comment_count: pin,
                                                        };
                                                        fetch('/bbsdev/updateArticle', {
                                                            method: 'post',
                                                            headers: {
                                                                'Content-type': 'application/json',
                                                            },
                                                            body: JSON.stringify(ucdata)
                                                        }).then(res => res.json()).then(res => {
                                                            console.log(res)
                                                            if (res.status == 200) {
                                                                // 获取资源数据
                                                                if (res.data) {
                                                                    console.log(res.data);
                                                                }
                                                            } else {
                                                                this.$message({
                                                                    showClose: true,
                                                                    message: '更新资源信息失败',
                                                                    type: 'error'
                                                                });
                                                            }
                                                        })
                                                    }
                                                } else {
                                                    this.$message({
                                                        showClose: true,
                                                        message: '获取文章回复数失败',
                                                        type: 'error'
                                                    });
                                                }
                                            })
                                        }
                                    } else {
                                        this.$message({
                                            showClose: true,
                                            message: '获取文章评论数失败',
                                            type: 'error'
                                        });
                                    }
                                })

                                this.listData.push({
                                    id: element.id,
                                    taglist: element.taglist.split(','),
                                    pin: pin,
                                    zan: zan,
                                    more: more,
                                    title: element.id,
                                    author_id: element.author_id,
                                    author_name: element.author_name,
                                    posttype: element.posttype,
                                    description: element.title,
                                    content: showcontent,
                                    time: moment(element.createTime).format('YYYY-MM-DD HH:mm:ss')
                                });
                            });
                            this.$store.commit("article/getarticlelist", this.listData);
                            rLoading.close();
                        }
                    } else {
                        this.$message({
                            showClose: true,
                            message: '获取资源列表失败',
                            type: 'error'
                        });
                    }
                })
            },
            // 查询资源列表--最多评论
            getMostComment() {
                const rLoading = this.openLoading();
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
                        // 获取资源数据
                        if (res.data) {
                            console.log(res.data);
                            res.data.forEach(element => {
                                let more = false;
                                let showcontent = '';
                                if (Base64.decode(element.content).length > 100) {
                                    more = true; // 显示更多
                                    showcontent = Base64.decode(element.content).substr(0, 100) + '...';
                                } else {
                                    more = false;
                                    showcontent = Base64.decode(element.content);
                                }
                                if (element.author_name === JSON.parse(window.localStorage.getItem('Login_data')).userdata.username) {
                                    element.author_name = "我";
                                }

                                // 查询点赞数
                                let zan;
                                const pdata = {
                                    post_id: element.id
                                };
                                fetch('/bbsdev/getPostPraise', {
                                    method: 'post',
                                    headers: {
                                        'Content-type': 'application/json',
                                    },
                                    body: JSON.stringify(pdata)
                                }).then(res => res.json()).then(res => {
                                    console.log(res);
                                    if (res.status == 200) {
                                        // 获取文章点赞数
                                        if (res.data.result) {
                                            zan = res.data.result.length;
                                            console.log("====737388euueyuy7373ey3ue77===  " + res.data.result.length);
                                            // 更新文章点赞数
                                            const updata = {
                                                id: element.id,
                                                praise_count: zan,
                                            };
                                            fetch('/bbsdev/updateArticle', {
                                                method: 'post',
                                                headers: {
                                                    'Content-type': 'application/json',
                                                },
                                                body: JSON.stringify(updata)
                                            }).then(res => res.json()).then(res => {
                                                console.log(res)
                                                if (res.status == 200) {
                                                    // 获取资源数据
                                                    if (res.data) {
                                                        console.log(res.data);
                                                    }
                                                } else {
                                                    this.$message({
                                                        showClose: true,
                                                        message: '更新资源信息失败',
                                                        type: 'error'
                                                    });
                                                }
                                            })
                                        }
                                    } else {
                                        this.$message({
                                            showClose: true,
                                            message: '获取文章点赞数失败',
                                            type: 'error'
                                        });
                                    }
                                })

                                // 查询评论数
                                let pin;
                                const cdata = {
                                    post_id: element.id
                                };
                                fetch('/bbsdev/getPostCommentCount', {
                                    method: 'post',
                                    headers: {
                                        'Content-type': 'application/json',
                                    },
                                    body: JSON.stringify(cdata)
                                }).then(res1 => res1.json()).then(res1 => {
                                    console.log(res1)
                                    if (res1.status == 200) {
                                        // 获取文章评论数
                                        if (res1.data) {
                                            fetch('/bbsdev/getPostReplyCount', {
                                                method: 'post',
                                                headers: {
                                                    'Content-type': 'application/json',
                                                },
                                                body: JSON.stringify(cdata)
                                            }).then(res2 => res2.json()).then(res2 => {
                                                console.log(res2)
                                                if (res2.status == 200) {
                                                    // 获取文章回复数
                                                    if (res2.data) {
                                                        pin = res1.data.length + res2.data.length;
                                                        // 更新文章评论数
                                                        const ucdata = {
                                                            id: element.id,
                                                            comment_count: pin,
                                                        };
                                                        fetch('/bbsdev/updateArticle', {
                                                            method: 'post',
                                                            headers: {
                                                                'Content-type': 'application/json',
                                                            },
                                                            body: JSON.stringify(ucdata)
                                                        }).then(res => res.json()).then(res => {
                                                            console.log(res)
                                                            if (res.status == 200) {
                                                                // 获取资源数据
                                                                if (res.data) {
                                                                    console.log(res.data);
                                                                }
                                                            } else {
                                                                this.$message({
                                                                    showClose: true,
                                                                    message: '更新资源信息失败',
                                                                    type: 'error'
                                                                });
                                                            }
                                                        })
                                                    }
                                                } else {
                                                    this.$message({
                                                        showClose: true,
                                                        message: '获取文章回复数失败',
                                                        type: 'error'
                                                    });
                                                }
                                            })
                                        }
                                    } else {
                                        this.$message({
                                            showClose: true,
                                            message: '获取文章评论数失败',
                                            type: 'error'
                                        });
                                    }
                                })

                                this.listData.push({
                                    id: element.id,
                                    taglist: element.taglist.split(','),
                                    pin: pin,
                                    zan: zan,
                                    more: more,
                                    title: element.id,
                                    author_id: element.author_id,
                                    author_name: element.author_name,
                                    posttype: element.posttype,
                                    description: element.title,
                                    content: showcontent,
                                    time: moment(element.createTime).format('YYYY-MM-DD HH:mm:ss')
                                });
                            });
                            this.$store.commit("article/getarticlelist", this.listData);
                            rLoading.close();
                        }
                    } else {
                        this.$message({
                            showClose: true,
                            message: '获取资源列表失败',
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
        margin-left: 40px;
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

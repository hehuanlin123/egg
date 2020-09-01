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
                    pageSize: 5,
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
            // 查询资源列表--最新
            getLatest() {
                var self = this;
                const rLoading = self.openLoading();
                self.listData = [];
                const data1 = {
                    ordertype: 'createTime'
                };
                fetch('/bbsdev/getArticleList', {
                    method: 'post',
                    headers: {
                        'Content-type': 'application/json',
                    },
                    body: JSON.stringify(data1)
                }).then(res1 => res1.json()).then(res1 => {
                    console.log(res1)
                    if (res1.status == 200) {
                        // 获取资源数据
                        console.log(res1.data)
                        if (res1.data) {
                            res1.data.forEach(element => {
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
                                element.more = more;
                                element.showcontent = showcontent;
                                // 查询点赞数
                                fetch('/bbsdev/getPostPraise', {
                                    method: 'post',
                                    headers: {
                                        'Content-type': 'application/json',
                                    },
                                    body: JSON.stringify({
                                        post_id: element.post_id
                                    })
                                }).then(res2 => res2.json()).then(res2 => {
                                    console.log("=========================res2=========================");
                                    console.log(res2);
                                    if (res2.status == 200) {
                                        // 获取文章点赞数
                                        if (res2.data.result.length >= 0) {
                                            element.zan = res2.data.result.length;
                                            console.log("====737388euueyuy7373ey3ue77===  " + res2.data.result.length);
                                            // 查询评论回复数
                                            fetch('/bbsdev/getPostCommentCount', {
                                                method: 'post',
                                                headers: {
                                                    'Content-type': 'application/json',
                                                },
                                                body: JSON.stringify({
                                                    post_id: element.post_id
                                                })
                                            }).then(res3 => res3.json()).then(res3 => {
                                                console.log(res3)
                                                if (res3.status == 200) {
                                                    // 获取文章评论数
                                                    if (res3.data.length >= 0) {
                                                        fetch('/bbsdev/getPostReplyCount', {
                                                            method: 'post',
                                                            headers: {
                                                                'Content-type': 'application/json',
                                                            },
                                                            body: JSON.stringify({
                                                                post_id: element.post_id
                                                            })
                                                        }).then(res4 => res4.json()).then(res4 => {
                                                            console.log(res4)
                                                            if (res4.status == 200) {
                                                                // 获取文章回复数
                                                                if (res4.data.length >= 0) {
                                                                    element.pin = res3.data.length + res4.data.length;
                                                                    for(let i = 0;i < 10;i++){
                                                                        self.listData.push({
                                                                            id: element.post_id,
                                                                            post_id: element.post_id,
                                                                            zan: element.zan,
                                                                            pin: element.pin,
                                                                            taglist: element.taglist.split(','),
                                                                            more: element.more,
                                                                            title: element.id,
                                                                            author_id: element.author_id,
                                                                            author_name: element.author_name,
                                                                            posttype: element.posttype,
                                                                            description: element.title,
                                                                            content: element.showcontent,
                                                                            time: moment(element.createTime).format('YYYY-MM-DD HH:mm:ss')
                                                                        });
                                                                    }
                                                                    if(element.pin > 0) {
                                                                        // 更新文章评论回复数
                                                                        fetch('/bbsdev/updateArticle', {
                                                                            method: 'post',
                                                                            headers: {
                                                                                'Content-type': 'application/json',
                                                                            },
                                                                            body: JSON.stringify({
                                                                                post_id: element.post_id,
                                                                                comment_count: element.pin
                                                                            })
                                                                        }).then(res5 => res5.json()).then(res5 => {
                                                                            console.log(res5)
                                                                            if (res5.status == 200) {
                                                                                // 获取资源数据
                                                                                if (res5.data) {
                                                                                    console.log(res5.data);
                                                                                }
                                                                            } else {
                                                                                self.$message({
                                                                                    showClose: true,
                                                                                    message: '更新评论回复数失败',
                                                                                    type: 'error'
                                                                                });
                                                                            }
                                                                        })
                                                                    }
                                                                }
                                                            } else {
                                                                self.$message({
                                                                    showClose: true,
                                                                    message: '获取文章回复数失败',
                                                                    type: 'error'
                                                                });
                                                            }
                                                        })
                                                    }
                                                } else {
                                                    self.$message({
                                                        showClose: true,
                                                        message: '获取文章评论数失败',
                                                        type: 'error'
                                                    });
                                                }
                                            })
                                            if(element.zan > 0) {
                                                // 更新文章点赞数
                                                fetch('/bbsdev/updateArticle', {
                                                    method: 'post',
                                                    headers: {
                                                        'Content-type': 'application/json',
                                                    },
                                                    body: JSON.stringify({
                                                        post_id: element.post_id,
                                                        praise_count: element.zan,
                                                    })
                                                }).then(res6 => res6.json()).then(res6 => {
                                                    console.log(res6);
                                                    if (res6.status == 200) {
                                                        // 获取资源数据
                                                        if (res6.data) {
                                                            console.log(res6.data);
                                                        }
                                                    } else {
                                                        self.$message({
                                                            showClose: true,
                                                            message: '更新点赞数失败',
                                                            type: 'error'
                                                        });
                                                    }
                                                })
                                            }
                                        }
                                    } else {
                                        self.$message({
                                            showClose: true,
                                            message: '获取文章点赞数失败',
                                            type: 'error'
                                        });
                                    }
                                })
                            });
                            self.$store.commit("article/getarticlelist", self.listData);
                            console.log("==============self.listData===============");
                            console.log(self.listData);
                            rLoading.close();
                        }
                    } else {
                        self.$message({
                            showClose: true,
                            message: '获取资源列表失败',
                            type: 'error'
                        });
                    }
                });
            },
            // 查询资源列表--最多点赞
            getMostPraise() {
                var self = this;
                const rLoading = self.openLoading();
                self.listData = [];
                const data1 = {
                    ordertype: 'praise_count'
                };
                fetch('/bbsdev/getArticleList', {
                    method: 'post',
                    headers: {
                        'Content-type': 'application/json',
                    },
                    body: JSON.stringify(data1)
                }).then(res1 => res1.json()).then(res1 => {
                    console.log(res1)
                    if (res1.status == 200) {
                        // 获取资源数据
                        console.log(res1.data)
                        if (res1.data) {
                            res1.data.forEach(element => {
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
                                element.more = more;
                                element.showcontent = showcontent;
                                // 查询点赞数
                                fetch('/bbsdev/getPostPraise', {
                                    method: 'post',
                                    headers: {
                                        'Content-type': 'application/json',
                                    },
                                    body: JSON.stringify({
                                        post_id: element.post_id
                                    })
                                }).then(res2 => res2.json()).then(res2 => {
                                    console.log("=========================res2=========================");
                                    console.log(res2);
                                    if (res2.status == 200) {
                                        // 获取文章点赞数
                                        if (res2.data.result.length >= 0) {
                                            element.zan = res2.data.result.length;
                                            console.log("====737388euueyuy7373ey3ue77===  " + res2.data.result.length);
                                            // 查询评论回复数
                                            fetch('/bbsdev/getPostCommentCount', {
                                                method: 'post',
                                                headers: {
                                                    'Content-type': 'application/json',
                                                },
                                                body: JSON.stringify({
                                                    post_id: element.post_id
                                                })
                                            }).then(res3 => res3.json()).then(res3 => {
                                                console.log(res3)
                                                if (res3.status == 200) {
                                                    // 获取文章评论数
                                                    if (res3.data.length >= 0) {
                                                        fetch('/bbsdev/getPostReplyCount', {
                                                            method: 'post',
                                                            headers: {
                                                                'Content-type': 'application/json',
                                                            },
                                                            body: JSON.stringify({
                                                                post_id: element.post_id
                                                            })
                                                        }).then(res4 => res4.json()).then(res4 => {
                                                            console.log(res4)
                                                            if (res4.status == 200) {
                                                                // 获取文章回复数
                                                                if (res4.data.length >= 0) {
                                                                    element.pin = res3.data.length + res4.data.length;
                                                                    self.listData.push({
                                                                        id: element.post_id,
                                                                        post_id: element.post_id,
                                                                        zan: element.zan,
                                                                        pin: element.pin,
                                                                        taglist: element.taglist.split(','),
                                                                        more: element.more,
                                                                        title: element.id,
                                                                        author_id: element.author_id,
                                                                        author_name: element.author_name,
                                                                        posttype: element.posttype,
                                                                        description: element.title,
                                                                        content: element.showcontent,
                                                                        time: moment(element.createTime).format('YYYY-MM-DD HH:mm:ss')
                                                                    });
                                                                    if(element.pin > 0) {
                                                                        // 更新文章评论回复数
                                                                        fetch('/bbsdev/updateArticle', {
                                                                            method: 'post',
                                                                            headers: {
                                                                                'Content-type': 'application/json',
                                                                            },
                                                                            body: JSON.stringify({
                                                                                post_id: element.post_id,
                                                                                comment_count: element.pin
                                                                            })
                                                                        }).then(res5 => res5.json()).then(res5 => {
                                                                            console.log(res5)
                                                                            if (res5.status == 200) {
                                                                                // 获取资源数据
                                                                                if (res5.data) {
                                                                                    console.log(res5.data);
                                                                                }
                                                                            } else {
                                                                                self.$message({
                                                                                    showClose: true,
                                                                                    message: '更新评论回复数失败',
                                                                                    type: 'error'
                                                                                });
                                                                            }
                                                                        })
                                                                    }
                                                                }
                                                            } else {
                                                                self.$message({
                                                                    showClose: true,
                                                                    message: '获取文章回复数失败',
                                                                    type: 'error'
                                                                });
                                                            }
                                                        })
                                                    }
                                                } else {
                                                    self.$message({
                                                        showClose: true,
                                                        message: '获取文章评论数失败',
                                                        type: 'error'
                                                    });
                                                }
                                            })
                                            if(element.zan > 0) {
                                                // 更新文章点赞数
                                                fetch('/bbsdev/updateArticle', {
                                                    method: 'post',
                                                    headers: {
                                                        'Content-type': 'application/json',
                                                    },
                                                    body: JSON.stringify({
                                                        post_id: element.post_id,
                                                        praise_count: element.zan,
                                                    })
                                                }).then(res6 => res6.json()).then(res6 => {
                                                    console.log(res6);
                                                    if (res6.status == 200) {
                                                        // 获取资源数据
                                                        if (res6.data) {
                                                            console.log(res6.data);
                                                        }
                                                    } else {
                                                        self.$message({
                                                            showClose: true,
                                                            message: '更新点赞数失败',
                                                            type: 'error'
                                                        });
                                                    }
                                                })
                                            }
                                        }
                                    } else {
                                        self.$message({
                                            showClose: true,
                                            message: '获取文章点赞数失败',
                                            type: 'error'
                                        });
                                    }
                                })
                            });
                            self.$store.commit("article/getarticlelist", self.listData);
                            console.log("==============self.listData===============");
                            console.log(self.listData);
                            rLoading.close();
                        }
                    } else {
                        self.$message({
                            showClose: true,
                            message: '获取资源列表失败',
                            type: 'error'
                        });
                    }
                });
            },
            // 查询资源列表--最多评论
            getMostComment() {
                var self = this;
                const rLoading = self.openLoading();
                self.listData = [];
                const data1 = {
                    ordertype: 'comment_count'
                };
                fetch('/bbsdev/getArticleList', {
                    method: 'post',
                    headers: {
                        'Content-type': 'application/json',
                    },
                    body: JSON.stringify(data1)
                }).then(res1 => res1.json()).then(res1 => {
                    console.log(res1)
                    if (res1.status == 200) {
                        // 获取资源数据
                        console.log(res1.data)
                        if (res1.data) {
                            res1.data.forEach(element => {
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
                                element.more = more;
                                element.showcontent = showcontent;
                                // 查询点赞数
                                fetch('/bbsdev/getPostPraise', {
                                    method: 'post',
                                    headers: {
                                        'Content-type': 'application/json',
                                    },
                                    body: JSON.stringify({
                                        post_id: element.post_id
                                    })
                                }).then(res2 => res2.json()).then(res2 => {
                                    console.log("=========================res2=========================");
                                    console.log(res2);
                                    if (res2.status == 200) {
                                        // 获取文章点赞数
                                        if (res2.data.result.length >= 0) {
                                            element.zan = res2.data.result.length;
                                            console.log("====737388euueyuy7373ey3ue77===  " + res2.data.result.length);
                                            // 查询评论回复数
                                            fetch('/bbsdev/getPostCommentCount', {
                                                method: 'post',
                                                headers: {
                                                    'Content-type': 'application/json',
                                                },
                                                body: JSON.stringify({
                                                    post_id: element.post_id
                                                })
                                            }).then(res3 => res3.json()).then(res3 => {
                                                console.log(res3)
                                                if (res3.status == 200) {
                                                    // 获取文章评论数
                                                    if (res3.data.length >= 0) {
                                                        fetch('/bbsdev/getPostReplyCount', {
                                                            method: 'post',
                                                            headers: {
                                                                'Content-type': 'application/json',
                                                            },
                                                            body: JSON.stringify({
                                                                post_id: element.post_id
                                                            })
                                                        }).then(res4 => res4.json()).then(res4 => {
                                                            console.log(res4)
                                                            if (res4.status == 200) {
                                                                // 获取文章回复数
                                                                if (res4.data.length >= 0) {
                                                                    element.pin = res3.data.length + res4.data.length;
                                                                    self.listData.push({
                                                                        id: element.post_id,
                                                                        post_id: element.post_id,
                                                                        zan: element.zan,
                                                                        pin: element.pin,
                                                                        taglist: element.taglist.split(','),
                                                                        more: element.more,
                                                                        title: element.id,
                                                                        author_id: element.author_id,
                                                                        author_name: element.author_name,
                                                                        posttype: element.posttype,
                                                                        description: element.title,
                                                                        content: element.showcontent,
                                                                        time: moment(element.createTime).format('YYYY-MM-DD HH:mm:ss')
                                                                    });
                                                                    if(element.pin > 0) {
                                                                        // 更新文章评论回复数
                                                                        fetch('/bbsdev/updateArticle', {
                                                                            method: 'post',
                                                                            headers: {
                                                                                'Content-type': 'application/json',
                                                                            },
                                                                            body: JSON.stringify({
                                                                                post_id: element.post_id,
                                                                                comment_count: element.pin
                                                                            })
                                                                        }).then(res5 => res5.json()).then(res5 => {
                                                                            console.log(res5)
                                                                            if (res5.status == 200) {
                                                                                // 获取资源数据
                                                                                if (res5.data) {
                                                                                    console.log(res5.data);
                                                                                }
                                                                            } else {
                                                                                self.$message({
                                                                                    showClose: true,
                                                                                    message: '更新评论回复数失败',
                                                                                    type: 'error'
                                                                                });
                                                                            }
                                                                        })
                                                                    }
                                                                }
                                                            } else {
                                                                self.$message({
                                                                    showClose: true,
                                                                    message: '获取文章回复数失败',
                                                                    type: 'error'
                                                                });
                                                            }
                                                        })
                                                    }
                                                } else {
                                                    self.$message({
                                                        showClose: true,
                                                        message: '获取文章评论数失败',
                                                        type: 'error'
                                                    });
                                                }
                                            })
                                            if(element.zan > 0) {
                                                // 更新文章点赞数
                                                fetch('/bbsdev/updateArticle', {
                                                    method: 'post',
                                                    headers: {
                                                        'Content-type': 'application/json',
                                                    },
                                                    body: JSON.stringify({
                                                        post_id: element.post_id,
                                                        praise_count: element.zan,
                                                    })
                                                }).then(res6 => res6.json()).then(res6 => {
                                                    console.log(res6);
                                                    if (res6.status == 200) {
                                                        // 获取资源数据
                                                        if (res6.data) {
                                                            console.log(res6.data);
                                                        }
                                                    } else {
                                                        self.$message({
                                                            showClose: true,
                                                            message: '更新点赞数失败',
                                                            type: 'error'
                                                        });
                                                    }
                                                })
                                            }
                                        }
                                    } else {
                                        self.$message({
                                            showClose: true,
                                            message: '获取文章点赞数失败',
                                            type: 'error'
                                        });
                                    }
                                })
                            });
                            self.$store.commit("article/getarticlelist", self.listData);
                            console.log("==============self.listData===============");
                            console.log(self.listData);
                            rLoading.close();
                        }
                    } else {
                        self.$message({
                            showClose: true,
                            message: '获取资源列表失败',
                            type: 'error'
                        });
                    }
                });
            },
            gotoDetail(item) {
                console.log("===================item====================");
                console.log(item);
                this.$router.push({
                    path: '/bbs/detail',
                    query: {
                        id: item.post_id,
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

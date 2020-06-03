<template>
    <!-- 三栏布局 flex布局-->
    <div class="layout">
        <div class="left">
        <span>
            <img alt=""
                 src="https://upload-images.jianshu.io/upload_images/7761489-3e058de1c7c19dda.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"
                 style="height:30px;width:auto;">
            标签推荐系统
        </span>
        </div>
        <div class="center">
            <ul>
                <li :key="list.id" v-for="list in headerList">
                    <!--              <a href="#">-->
                    <!--                {{ list.title }}-->
                    <!--              </a>-->
                    <el-link href="#" type="primary">{{ list.title }}</el-link>
                </li>
            </ul>
        </div>
        <div class="right">
            <span v-show="searchVisible">
                <el-button @click.stop="goSearch" class="search" icon="el-icon-search" size="mini"
                           type="info">输入关键词搜索资源</el-button>
            </span>
            <span v-show="!searchVisible">
                <el-input class="search" placeholder="输入关键词搜索资源" size="mini" v-model="search" @blur="goblur"></el-input>
                <el-button @click.stop="Search" class="searchbtn" type="primary">搜索</el-button>
            </span>
            <el-button @click.stop="dialogLoginVisible = true" class="login" type="text">登录</el-button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <el-button @click.stop="dialogRegVisible = true" class="reg" type="text">注册</el-button>
            <el-dialog :visible.sync="dialogLoginVisible">
                <v-login @func1="getMsg1FormSon"></v-login>
            </el-dialog>
            <el-dialog :visible.sync="dialogRegVisible">
                <v-reg @func2="getMsg2FormSon"></v-reg>
            </el-dialog>
        </div>
    </div>
    <!-- 三栏布局 flex布局-->
</template>

<script>
    import login from "../../../../views/bbs/app/Login";
    import reg from "../../../../views/bbs/app/Register";
    let Base64 = require('js-base64').Base64;
    import moment from "moment";

    export default {
        name: 'headerone',
        components: {
            "v-login": login,
            "v-reg": reg,
        },
        data() {
            return {
                headerList: [{
                    id: '1',
                    name: 'Home',
                    title: '首页'
                },],
                isShow: false,
                dialogLoginVisible: false,
                dialogRegVisible: false,
                searchVisible: true,
                search: "",
                listData: [],
            }
        },
        methods: {
            getMsg1FormSon(data) {
                this.dialogLoginVisible = data
                console.log(this.dialogLoginVisible)
            },
            getMsg2FormSon(data) {
                this.dialogRegVisible = data;
                console.log(this.dialogRegVisible)
            },
            goSearch() {
                this.searchVisible = false;
                this.search = "";
            },
            goblur() {
                if (this.search === null || this.search === "") {
                    this.searchVisible = true;
                    window.location.reload();
                }
            },
            Search() {
                const rLoading = this.openLoading();
                this.listData = [];
                if(this.search){
                    const data1 = {
                        title: this.search,
                        ordertype: 'createTime'
                    };
                    fetch('/bbsdev/searchArticleList', {
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
                                    this.listData.push({
                                        id: element.id,
                                        taglist: element.taglist.split(','),
                                        pin: element.comment_count,
                                        zan: element.praise_count,
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
                                message: '搜索资源列表失败',
                                type: 'error'
                            });
                        }
                    })
                } else {
                    const rLoading = this.openLoading();
                    const data2 = {
                        ordertype: 'createTime'
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
                                    this.listData.push({
                                        id: element.id,
                                        taglist: element.taglist.split(','),
                                        pin: element.comment_count,
                                        zan: element.praise_count,
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
                }

            }
        },
        mounted() {

        }
    }
</script>

<style scoped>
    * {
        margin: 0;
        padding: 0;
        font-size: 15px;
        color: #ffffff;
    }

    .layout {
        background: #3d444c;
        text-align: center;
        height: 100%;
        display: flex;
        align-items: center;
    }

    .layout .left {
        width: 200px;
        height: 50px;
        text-align: left;
        padding-left: 1%;
        padding-top: 10px;
    }

    .layout .right {
        width: 100%;
        height: 50px;
        text-align: right;
        padding-right: 1%;
        padding-top: 10px;
    }

    .layout .center {
        width: 200px;
        height: 50px;
        text-align: left;
        padding-left: 1%;
        background-color: #31363d;
        padding-top: 10px;
    }

    .layout .right .search {
        position: relative;
        left: -30%;
        color: #fff;
        background: #31363e;
        padding: 5px;
        width: 35%;
        text-align: left;
    }

    #btn {
        margin-left: 20px;
        width: 80px;
        height: 30px;
        background-color: #1890ff;
    }

    .layout .right .searchbtn {
        position: relative;
        left: -30%;
        color: #fff;
        background: #1890ff;
        border-color: #1890ff;
        padding: 5px;
        width: 10%;
        text-align: center;
    }
</style>

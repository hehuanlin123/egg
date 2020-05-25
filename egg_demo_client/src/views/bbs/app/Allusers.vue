<template>
    <div class="container">
        <v-headerfive></v-headerfive>
        <ul class="infinite-list" v-infinite-scroll="load" style="overflow:auto">
            <li v-bind:key="userlist[i].id" v-for="i in count" class="infinite-list-item">
                <a-col :span="4">
                    <el-avatar
                            src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png"></el-avatar>
                </a-col>
                <a-col style="text-align: left;" :span="14">
                    <p>{{ userlist[i].username }}</p>
                    <p>
                        个性签名：<span>{{ userlist[i].desc }}</span>
                    </p>
                </a-col>
                <a-col :span="6">
                    <el-row>
                        <el-button @click="addFriend(userlist[i].id)" v-if="!self" class="btn" type="primary">关注</el-button>
                    </el-row>
                </a-col>
                <el-divider></el-divider>
            </li>
        </ul>
    </div>
</template>

<script>
    export default {
        name: "Allusers",
        data() {
            return {
                count: 0,
                userlist: []
            }
        },
        methods: {
            load() {
                this.count += 2;
            },
            init() { //获取所有用户数据
                const data = {};
                fetch('/bbsdev/getUserInfo', {
                    method: 'post',
                    headers: {
                        'Content-type': 'application/json',
                    },
                    body: JSON.stringify(data)
                }).then(res => res.json()).then(res => {
                    console.log(res)
                    if (res.status == 200) {
                        if (res.data) {
                            res.data.forEach(item => {
                                this.userlist.push(item);
                            });
                        }
                    } else {
                        this.$message({
                            showClose: true,
                            message: '获取用户信息列表失败',
                            type: 'error'
                        });
                    }
                })
            },
            addFriend(id){
                // 添加好友关系
                const data = {
                    author_id: JSON.parse(window.localStorage.getItem('Login_data')).userdata.id,
                    fans_id: id
                };
                fetch('/bbsdev/addFriends', {
                    method: 'post',
                    headers: {
                        'Content-type': 'application/json',
                    },
                    body: JSON.stringify(data)
                }).then(res => res.json()).then(res => {
                    console.log(res)
                    if (res.status == 200) {
                        if (res.data) {
                            this.$message({
                                showClose: true,
                                message: '关注成功',
                                type: 'success'
                            });
                            return res.data;
                        }
                    } else {
                        this.$message({
                            showClose: true,
                            message: '关注好友失败',
                            type: 'error'
                        });
                    }
                })
            }
        },
        mounted() {
            this.init();
        }
    }
</script>

<style scoped>
    .container {
        width: 60%;
        height: auto;
        text-align: left;
        background-color: #ffffff;
        border: 1px solid #e0e0e0;
    }


    .btn {
        color: #fff;
        width: 50px;
        background-color: #1890ff;
        border-color: #1890ff;
        text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.12);
        -webkit-box-shadow: 0 2px 0 rgba(0, 0, 0, 0.045);
        box-shadow: 0 2px 0 rgba(0, 0, 0, 0.045);
    }
</style>
<template>
    <div>
        <ul>
            <a-col :span="6">
                <p>电话号码</p>
                <p>电子邮箱</p>
                <p>用户名</p>
                <p>密码</p>
                <p>QQ账号</p>
                <p>真实姓名</p>
                <p>性别</p>
                <p>个性签名</p>
            </a-col>
            <a-col class="right" :span="18">
                <p>{{ userlist.cellphone }}</p>
                <p>{{ userlist.email }}</p>
                <p>{{ userlist.username }}</p>
                <p>{{ userlist.password }}</p>
                <p>{{ userlist.qq }}</p>
                <p>{{ userlist.realname }}</p>
                <p>{{ userlist.gender }}</p>
                <p>{{ userlist.signature }}</p>
            </a-col>
        </ul>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                // userid: '',
                form: {
                    phone: '',
                    email: '',
                    name: '',
                    password: '',
                    qq: '',
                    realname: '',
                    sex: '',
                    desc: ''
                }
            }
        },
        props:{
            userlist: {
                type: Object,
                required: true
            }
        },
        components: {},
        computed: {},
        methods: {
            init(id) {
                const data = {
                    author_id: id
                };
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
                            this.form.phone = res.data.cellphone;
                            this.form.email = res.data.email;
                            this.form.name = res.data.username;
                            this.form.password = res.data.password;
                            this.form.qq = res.data.qq;
                            this.form.realname = res.data.realname;
                            this.form.sex = res.data.gender == 1 ? '男' : res.data.gender == 2 ? '女' : res.data.gender == 3 ? '私密' : '未知';
                            this.form.desc = res.data.signature;
                        }
                        return res.data;
                    } else {
                        this.$message({
                            showClose: true,
                            message: '获取用户信息失败',
                            type: 'error'
                        });
                    }
                })
            },
        },
        mounted() {
            // this.userid = this.$route.query.userid;
            this.init(this.userid);
        }
    }
</script>

<style scoped>
    * {
        margin: 0;
        padding: 0;
    }

    p {
        line-height: 40px;
    }

    .right p {
        color: #999;
    }
</style>

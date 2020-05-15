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
                <p>{{ form.phone }}</p>
                <p>{{ form.email }}</p>
                <p>{{ form.name }}</p>
                <p>{{ form.password }}</p>
                <p>{{ form.qq }}</p>
                <p>{{ form.realname }}</p>
                <p>{{ form.sex }}</p>
                <p>{{ form.desc }}</p>
            </a-col>
        </ul>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                userid: '',
                form: {
                    phone: '15626075071',
                    email: '15266226@163.com',
                    name: 'hwc',
                    password: '676767',
                    qq: '5622267262',
                    realname: '何伟成',
                    sex: '男',
                    desc: 'java/python/c/c++'
                }
            }
        },
        components: {},
        computed: {},
        methods: {
            init(id) {
                const data = {
                    userid: id
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
                        if (res.data[0]) {
                            this.form.phone = res.data[0].phone;
                            this.form.email = res.data[0].email;
                            this.form.name = res.data[0].name;
                            this.form.password = res.data[0].password;
                            this.form.qq = res.data[0].qq;
                            this.form.realname = res.data[0].realname;
                            this.form.sex = res.data[0].sex;
                            this.form.desc = res.data[0].desc;
                        }
                        return res.data[0];
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
            this.userid = this.$route.query.userid;
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

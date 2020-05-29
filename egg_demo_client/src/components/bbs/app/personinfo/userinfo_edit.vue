<template>
    <div>
        <el-form ref="form" :model="form" label-width="80px">
            <el-form-item label="电话号码">
                <el-input v-model="form.phone"></el-input>
            </el-form-item>
            <el-form-item label="电子邮箱">
                <el-input v-model="form.email"></el-input>
            </el-form-item>
            <el-form-item label="用户名">
                <el-input v-model="form.name"></el-input>
            </el-form-item>
            <el-form-item label="密码">
                <el-input v-model="form.password"></el-input>
            </el-form-item>
            <el-form-item label="QQ账号">
                <el-input v-model="form.qq"></el-input>
            </el-form-item>
            <el-form-item label="真实姓名">
                <el-input v-model="form.realname"></el-input>
            </el-form-item>
            <el-form-item label="性别">
                <el-select style="display: flex;" v-model="form.sex" placeholder="请选择性别">
                    <el-option label="男" value="1"></el-option>
                    <el-option label="女" value="2"></el-option>
                    <el-option label="保密" value="3"></el-option>
                    <el-option label="未知" value="4"></el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="个性签名">
                <el-input v-model="form.desc"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button class="btn" type="primary" @click="onSubmit">保存</el-button>
                <el-button style="background-color: silver;border-color: silver;" class="btn" @click="onCancel">取消
                </el-button>
            </el-form-item>
        </el-form>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                userid: '',
                form: {
                    phone: JSON.parse(window.localStorage.getItem('Login_data')).userdata.cellphone,
                    email: JSON.parse(window.localStorage.getItem('Login_data')).userdata.email,
                    name: JSON.parse(window.localStorage.getItem('Login_data')).userdata.username,
                    password: JSON.parse(window.localStorage.getItem('Login_data')).userdata.password,
                    qq: JSON.parse(window.localStorage.getItem('Login_data')).userdata.qq,
                    realname: JSON.parse(window.localStorage.getItem('Login_data')).userdata.realname,
                    sex: '',
                    desc: JSON.parse(window.localStorage.getItem('Login_data')).userdata.signature
                }
            }
        },
        components: {},
        computed: {},
        methods: {
            onSubmit() {
                const data = {
                    id: this.userid,
                    cellphone: this.form.phone,
                    email: this.form.email,
                    username: this.form.name,
                    password: this.form.pasword,
                    qq: this.form.qq,
                    realname: this.form.realname,
                    gender: this.form.sex,
                    signature: this.form.desc
                };
                fetch('/bbsdev/updateUserInfo', {
                    method: 'post',
                    headers: {
                        'Content-type': 'application/json',
                    },
                    body: JSON.stringify(data)
                }).then(res => res.json()).then(res => {
                    console.log(res)
                    if (res.status == 200) {
                        this.$message({
                            showClose: true,
                            message: '修改用户信息成功',
                            type: 'success'
                        });
                        this.$emit('closeEdit');
                        return res.data;
                    } else {
                        this.$message({
                            showClose: true,
                            message: '修改用户信息失败',
                            type: 'error'
                        });
                    }
                })
            },
            onCancel() {
                this.$emit('closeEdit');
            }
        },
        mounted() {
            this.userid = this.$route.query.userid;
            this.form.sex = JSON.parse(window.localStorage.getItem('Login_data')).userdata.gender == 1 ? '男' :
                JSON.parse(window.localStorage.getItem('Login_data')).userdata.gender == 2 ? '女' :
                    JSON.parse(window.localStorage.getItem('Login_data')).userdata.gender == 3 ? '保密' : '未知'
        }
    }
</script>

<style scoped>
    * {
        margin: 0;
        padding: 0;
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

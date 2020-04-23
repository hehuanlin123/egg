<template>
    <p class="login">
        <el-tabs v-model="activeName" @tab-click="handleClick">
            <el-tab-pane label="登录" name="first">
                <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
                    <el-form-item label="手机号" prop="name">
                        <el-input v-model="ruleForm.name"></el-input>
                    </el-form-item>

                    <el-form-item label="密码" prop="pass">
                        <el-input type="password" v-model="ruleForm.pass" auto-complete="off"></el-input>
                    </el-form-item>

                    <el-form-item>
                        <el-button type="primary" @click="submitForm(ruleForm)">登录</el-button>
                        <el-button @click="resetForm('ruleForm')">重置</el-button>
                    </el-form-item>
                </el-form>
            </el-tab-pane>

            <el-tab-pane label="注册" name="second">
                <register></register>
            </el-tab-pane>
        </el-tabs>
    </p>
</template>

<script>
    import register from './Register';

    export default {
        name: "Login",
        data() {
            var validatePass = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请输入密码'));
                } else {
                    if (this.ruleForm.checkPass !== '') {
                        this.$refs.ruleForm.validateField('checkPass');
                    }

                    callback();
                }
            };

            return {
                activeName: 'first',
                ruleForm: {
                    name: '',
                    pass: '',
                    checkPass: ''
                },
                rules: {
                    name: [{
                        required: true,
                        message: '请输入您的名称',
                        trigger: 'blur'
                    }, {
                        min: 2,
                        max: 5,
                        message: '长度在 2 到 5 个字符',
                        trigger: 'blur'
                    }],
                    pass: [{
                        required: true,
                        validator: validatePass,
                        trigger: 'blur'
                    }]
                },
                success1: '',
            };
        },

        methods: {
            //选项卡切换
            handleClick(tab, event) {
                console.log(tab)
                console.log(event)
            },
            //重置表单
            resetForm(formName) {
                this.$refs[formName].resetFields();
            },
            //提交表单
            submitForm(ruleForm) {
                // 用户登录：校验用户名密码
                const data = {
                    name: ruleForm.name,
                    pass: ruleForm.pass,
                    checkPass: ruleForm.checkPass
                };
                console.log(data)
                this.$message({
                    showClose: true,
                    message: '登录成功',
                    type: 'success'
                });
                this.success1 = false;
                this.$emit('func1', this.success1);
                // 保存用户信息
                localStorage.setItem("Login_data", JSON.stringfy({
                    name: this.name,
                    pass: this.pass
                }));
                this.$router.push('/bbs/home_login');
                // fetch('/bbs/getUserInfo', {
                //     method: 'post',
                //     headers: {
                //         'Content-type': 'application/json',
                //     },
                //     body: JSON.stringify(data)
                // }).then(res => res.json()).then(res => {
                //     console.log(res)
                //     if (res.status == 200) {
                //         this.$message({
                //             showClose: true,
                //             message: '登录成功',
                //             type: 'success'
                //         });
                //         this.activeName = 'second';
                //         this.$router.push('/bbs/home');
                //     } else {
                //         this.$message({
                //             showClose: true,
                //             message: '登录失败',
                //             type: 'error'
                //         });
                //     }
                // })
            }
        },
        components: {
            register
        }
    };
</script>

<style scoped>
    .login {
        width: 400px;
        margin: 0 auto;
    }

    .el-tabsitem {
        text-align: center;
        width: 60px;
    }
</style>

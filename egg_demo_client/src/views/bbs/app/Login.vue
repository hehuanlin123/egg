<template>
<p class="login">
    <el-tabs v-model="activeName" @tab-click="handleClick">
        <el-tab-pane label="登录" name="first">
            <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
                <el-form-item label="手机号" prop="name">
                    <el-input v-model="ruleForm.cellphone"></el-input>
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
                cellphone: '',
                pass: '',
                checkPass: ''
            },
            rules: {
                cellphone: [{
                    required: true,
                    message: '请输入您的手机号',
                    trigger: 'blur'
                }, {
                    min: 11,
                    max: 11,
                    message: '手机号格式不正确',
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
            const rLoading = this.openLoading();
            // 用户登录：校验用户名密码
            const data = {
                cellphone: ruleForm.cellphone,
                password: ruleForm.pass
            };
            console.log(data)
            fetch('/bbsdev/login', {
                method: 'post',
                headers: {
                    'Content-type': 'application/json',
                },
                body: JSON.stringify(data)
            }).then(res => res.json()).then(res => {
                console.log(res)
                if (res.status == 200) {
                    // 保存用户信息
                    window.localStorage.setItem("Login_data", JSON.stringify({"userdata": res.data}));
                    this.$message({
                        showClose: true,
                        message: '登录成功',
                        type: 'success'
                    });
                    this.success1 = false;
                    this.$emit('func1', this.success1);
                    rLoading.close();
                    this.$router.push('/bbs/home_login');
                } else {
                    this.$message({
                        showClose: true,
                        message: '登录失败',
                        type: 'error'
                    });
                }
            })
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

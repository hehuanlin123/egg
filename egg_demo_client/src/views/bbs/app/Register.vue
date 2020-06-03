<template>
<div>
    <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
        <el-form-item label="手机号" prop="cellphone">
            <el-input v-model="ruleForm.cellphone"></el-input>
        </el-form-item>
        <el-form-item label="密码" prop="pass">
            <el-input type="password" v-model="ruleForm.pass" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item label="确认密码" prop="checkPass">
            <el-input type="password" v-model="ruleForm.checkPass" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item>
            <el-button type="primary" @click="submitForm(ruleForm)">注册</el-button>
            <el-button @click="resetForm('ruleForm')">重置</el-button>
        </el-form-item>
    </el-form>
</div>
</template>

<script>
export default {
    name: 'Register',
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

        var validatePass2 = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请再次输入密码'));
            } else if (value !== this.ruleForm.pass) {
                callback(new Error('两次输入密码不一致!'));
            } else {
                callback();
            }
        };

        return {
            activeName: 'second',
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
                }],
                checkPass: [{
                    required: true,
                    validator: validatePass2,
                    trigger: 'blur'
                }]
            },
            success2: '',
        };
    },

    methods: {
        submitForm(ruleForm) {
            const rLoading = this.openLoading();
            // 用户注册：向数据库插入一条用户信息
            const data = {
                cellphone: ruleForm.cellphone,
                password: ruleForm.pass
            };
            console.log(data)
            // this.$message({
            //     showClose: true,
            //     message: '注册成功',
            //     type: 'success'
            // });
            // this.success2 = false;
            // this.$emit('func2',this.success2)
            // this.$router.push('/bbs/home_login');
            fetch('/bbsdev/addUserInfo', {
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
                        message: '注册成功',
                        type: 'success'
                    });
                    this.success2 = false;
                    this.$emit('func2',this.success2);
                    rLoading.close();
                    this.$router.push('/bbs/home');
                } else {
                    this.$message({
                        showClose: true,
                        message: '注册失败',
                        type: 'error'
                    });
                }
            })
        },

        resetForm(formName) {
            this.$refs[formName].resetFields();
        }
    }
};
</script>

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
                <el-option label="男" value="0"></el-option>
                <el-option label="女" value="1"></el-option>
                <el-option label="保密" value="2"></el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="个性签名">
            <el-input v-model="form.desc"></el-input>
        </el-form-item>
        <el-form-item>
            <el-button class="btn" type="primary" @click="onSubmit">保存</el-button>
            <el-button style="background-color: silver;border-color: silver;" class="btn">取消</el-button>
        </el-form-item>
    </el-form>
</div>
</template>

<script>
export default {
    data() {
        return {
            form: {
                name: '',
                region: '',
                date1: '',
                date2: '',
                delivery: false,
                type: [],
                resource: '',
                desc: ''
            }
        }
    },
    components: {

    },
    computed: {

    },
    methods: {
        onSubmit() {
            console.log('submit!');
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

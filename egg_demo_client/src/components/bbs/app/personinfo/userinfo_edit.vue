<template>
<div>
    <el-form ref="form" :model="form" label-width="80px">
        <el-form-item label="昵称">
            <el-input v-model="form.name"></el-input>
        </el-form-item>
        <el-form-item label="性别">
            <el-select v-model="form.sex" placeholder="请选择性别">
                <el-option label="男" value="0"></el-option>
                <el-option label="女" value="1"></el-option>
                <el-option label="保密" value="2"></el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="简介">
            <el-input v-model="form.desc"></el-input>
        </el-form-item>
        <el-form-item label="身份认证">
            <p>暂未认证，点击申请 ></p>
        </el-form-item>
        <el-form-item label="居住地">
            <el-input v-model="form.address"></el-input>
        </el-form-item>
        <el-form-item label="毕业年份">
            <el-col :span="12">
                <el-date-picker type="date" placeholder="选择日期" v-model="form.date1" style="width: 100%;"></el-date-picker>
            </el-col>
        </el-form-item>
        <el-form-item label="学历">
            <el-select v-model="form.degree" placeholder="请选择学历">
                <el-option label="本科" value="0"></el-option>
                <el-option label="硕士" value="1"></el-option>
                <el-option label="博士" value="2"></el-option>
                <el-option label="其他" value="3"></el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="毕业学校">
            <el-input v-model="form.school"></el-input>
        </el-form-item>
        <el-form-item label="效力公司">
            <el-input v-model="form.school"></el-input>
        </el-form-item>
        <el-form-item label="毕业学校">
            <el-input v-model="form.school"></el-input>
        </el-form-item>
        <el-form-item label="职业">
            <el-select v-model="form.job" placeholder="请选择职业">
                <el-option label="Java工程师" value="0"></el-option>
                <el-option label="前端工程师" value="1"></el-option>
                <el-option label="算法工程师" value="2"></el-option>
                <el-option label="产品经理" value="3"></el-option>
                <el-option label="测试工程师" value="4"></el-option>
            </el-select>
        </el-form-item>
        <el-form-item>
            <el-button type="primary" @click="onSubmit">保存</el-button>
            <el-button>取消</el-button>
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
</style>

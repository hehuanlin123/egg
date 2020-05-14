<template>
<div>
    <ul>
        <a-col :span="6">
            <li>我的昵称</li>
            <li>我的性别</li>
            <li>我的简介</li>
            <li>身份认证</li>
            <li>我居住地</li>
            <li>我现在</li>
            <li>毕业年份</li>
            <li>学历</li>
            <li>我毕业学校</li>
            <li>我效力的公司</li>
            <li>我从事的工作</li>
        </a-col>
        <a-col :span="18">
            <li>hwc</li>
            <li>男</li>
            <li>Java/python</li>
            <li>暂未认证，点击申请 ></li>
            <li>北京市</li>
            <li>已经工作</li>
            <li>2018</li>
            <li>硕士</li>
            <li>清华大学</li>
            <li>阿里巴巴</li>
            <li>Java工程师</li>
        </a-col>
    </ul>
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

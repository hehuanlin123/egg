<template>
<div>
    <ul>
        <a-col :span="6">
            <li>电话号码</li>
            <li>电子邮箱</li>
            <li>用户名</li>
            <li>密码</li>
            <li>QQ账号</li>
            <li>真实姓名</li>
            <li>性别</li>
            <li>个性签名</li>
        </a-col>
        <a-col class="right" :span="18">
            <li>15626075071</li>
            <li>15266226@163.com</li>
            <li>hwc</li>
            <li>676767</li>
            <li>5622267262</li>
            <li>何伟成</li>
            <li>男</li>
            <li>java/python/c/c++</li>
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

li {
    line-height: 40px;
}

.right li {
    color: #999;
}
</style>

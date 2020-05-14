<template>
<div>
    <v-headertwo></v-headertwo>
    <a-row>
        <a-col :span="5"></a-col>
        <a-col :span="14">
            <div>
                <a-col :span="4">
                    <el-avatar src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png"></el-avatar>
                </a-col>
                <a-col :span="14">
                    <p>hwc</p>
                    <p>
                        <span>北京市海淀区</span>
                        <span>学生</span>
                        <span>清华大学</span>
                    </p>
                </a-col>
                <a-col :span="6">
                    <el-row>
                        <el-button type="primary">编辑</el-button>
                        <el-button type="primary">打卡</el-button>
                    </el-row>
                </a-col>
            </div>
            <div>
                <a-col :span="8">
                    <v-myinfo class="myinfo"></v-myinfo>
                </a-col>
                <a-col :span="16">
                    <p>基本信息</p>
                    <el-divider></el-divider>
                    <p>
                        <v-userinfo v-if="!eidt"></v-userinfo>
                        <v-userinfoedit v-if="eidt"></v-userinfoedit>
                    </p>
                </a-col>
            </div>
        </a-col>
        <a-col :span="5"></a-col>
    </a-row>
</div>
</template>

<script>
import headertwo from "../../../components/bbs/app/public/headertwo";
import myinfo_login from "../../../components/bbs/app/home/myinfo_login";
import userinfo from "../../../components/bbs/app/personinfo/userinfo";
import userinfo_edit from "../../../components/bbs/app/personinfo/userinfo_edit";

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
            },
            eidt: false,
        }
    },
    components: {
        "v-headertwo": headertwo,
        "v-myinfo": myinfo_login,
        "v-userinfo": userinfo,
        "v-userinfoedit": userinfo_edit,
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

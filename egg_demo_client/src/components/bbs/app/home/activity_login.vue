<template>
<div class="layout">
    <el-menu :default-active="activeIndex" class="el-menu-demo" mode="horizontal" @select="handleSelect" background-color="#ffffff" text-color="#000000" active-text-color="#409EFF">
        <el-menu-item style="margin-left:20px;width:50px;" index="1">发动态</el-menu-item>
        <el-menu-item @click="gotoPost" style="margin-left:20px;width:50px;" index="2">发帖子</el-menu-item>
    </el-menu>
    <!-- <el-divider></el-divider> -->
    <el-input class="textarea" type="textarea" :autosize="{ minRows: 2, maxRows: 4}" placeholder="此刻你想和大家分享什么..." v-model="textarea">
    </el-input>
    <div class="tools">
        <span class="left">
            <i class="el-icon-chat-line-round"></i><span @click="addTopic" class="dakatext">话题</span>
            <i class="el-icon-folder-checked"></i>
            <el-button class="dakatext" type="text" @click="open">打卡</el-button>
            <i class="el-icon-link"></i>
            <el-popover placement="bottom" width="160" v-model="visible">
                <el-input v-model="input" placeholder="请输入网页链接"></el-input>
                <p>一次只推荐一个网页哦</p>
                <div style="text-align: right; margin: 0">
                    <!-- <el-button class="cancellink" size="mini" type="text" @click="visible = false">取消</el-button> -->
                    <el-button class="conflink" type="text" size="mini" @click="visible = false">添加</el-button>
                </div>
                <el-button class="linkbtn" slot="reference"><span class="dakatext">链接</span></el-button>
            </el-popover>

        </span>
        <span class="right">
            <!-- <el-dropdown class="choose">
                <span class="el-dropdown-link">
                    选择标签<i class="el-icon-arrow-down el-icon--right"></i>
                </span>
                <el-dropdown-menu slot="dropdown">
                    <el-dropdown-item>标签一</el-dropdown-item>
                    <el-dropdown-item>标签二</el-dropdown-item>
                    <el-dropdown-item>标签三</el-dropdown-item>
                    <el-dropdown-item disabled>标签四</el-dropdown-item>
                </el-dropdown-menu>
            </el-dropdown> -->
            <el-button class="post" type="info">发布</el-button>
        </span>
    </div>
</div>
</template>

<script>
export default {
    name: "activity",
    components: {

    },
    data() {
        return {
            activeIndex: '1',
            textarea: '',
            input: '',
            visible: false,
        };
    },
    methods: {
        handleSelect(key, keyPath) {
            console.log(key, keyPath);
        },
        gotoPost() {
            this.$router.push({
                path: '/bbs/post'
            });
        },
        open() {
            this.$alert('你已打开 1 天', '打卡成功！', {
                confirmButtonText: '确定',
                callback: action => {
                    this.$message({
                        type: 'info',
                        message: `action: ${ action }`
                    });
                }
            });
        },
        addTopic() {
            this.textarea = this.textarea + '#';
        }
    },
    mounted: {}
};
</script>

<style scoped>
* {
    margin: 0;
    padding: 0;
}

.layout {
    width: 90%;
    position: relative;
    left: 5%;
    background-color: #ffffff;
}

.textarea {
    width: 98%;
    position: relative;
    margin: 5px 0;
}

.el-dropdown-link {
    cursor: pointer;
    color: #409EFF;
}

.el-icon-arrow-down {
    font-size: 12px;
}

.tools {
    font-size: 16px;
    text-align: left;
}

.choose {
    font-size: 16px;
}

.post {
    font-size: 16px;
    width: 80px;
    height: 40px;
    margin: 5px;
    position: relative;
    left: 14%;
}

.tools .left {
    position: relative;
    left: 2%;
}

.tools .right {
    position: relative;
    left: 60%;
}

.dakatext {
    color: #000000;
    font-size: 16px;
    font-weight: normal;
}

.el-icon-folder-checked {
    margin-left: 5px;
}

.linkbtn {
    border: none;
}
</style>

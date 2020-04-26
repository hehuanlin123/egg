<template>
<div class="layout">
    <el-menu :default-active="activeIndex" @select="handleSelect" active-text-color="#409EFF" background-color="#ffffff" class="el-menu-demo" mode="horizontal" text-color="#000000">
        <el-menu-item index="1" style="margin-left:20px;width:50px;">发动态</el-menu-item>
        <el-menu-item @click="gotoPost" index="2" style="margin-left:20px;width:50px;">发帖子</el-menu-item>
    </el-menu>
    <el-input :autosize="{ minRows: 2, maxRows: 4}" class="textarea" placeholder="此刻你想和大家分享什么..." type="textarea" v-model="textarea"></el-input>
    <!-- 发布说说 -->
    <!-- <v-create class="textarea"></v-create> -->
    <!-- 照片墙 -->
    <div class="postpic">
        <el-upload action="https://jsonplaceholder.typicode.com/posts/" list-type="picture-card" :on-preview="handlePictureCardPreview" :on-remove="handleRemove">
            <i class="el-icon-plus"></i>
        </el-upload>
        <el-dialog :visible.sync="dialogVisible">
            <img width="100%" :src="dialogImageUrl" alt="">
        </el-dialog>
    </div>
    <!-- 照片墙 -->
    <el-dialog :visible.sync="dialogVisible">
        <img width="100%" :src="dialogImageUrl" alt="">
    </el-dialog>
    <div class="tools">
        <!-- 说说的标签 -->
        <span class="tag">
            <el-tag :disable-transitions="false" :key="tag" @close="handleClose(tag)" closable size="mini" v-for="tag in dynamicTags">
                {{tag}}
            </el-tag>
            <el-input @blur="handleInputConfirm" @keyup.enter.native="handleInputConfirm" class="input-new-tag" ref="saveTagInput" size="mini" v-if="inputVisible" v-model="inputValue"></el-input>
            <el-button @click="showInput" class="button-new-tag" size="mini" v-else>+ 添加</el-button>
        </span>
        <span class="left">
            <!-- 说说的链接 -->
            <span class="link">
                <i class="el-icon-link"></i>
                <el-popover placement="bottom" v-model="visible" width="160">
                    <el-input placeholder="请输入网页链接" v-model="input"></el-input>
                    <p>一次只推荐一个网页哦</p>
                    <div style="text-align: right; margin: 0">
                        <el-button @click="addlink" class="conflink" size="mini" type="text">添加</el-button>
                    </div>
                    <el-button class="linkbtn" slot="reference"><span class="dakatext">链接</span></el-button>
                </el-popover>
            </span>
            <!-- 说说的表情 -->
            <span class="face">
                <a-icon type="smile" /><span class="dakatext">表情</span>
            </span>
        </span>
        <span class="right">
            <el-button @click="handlePostActivity" class="post" type="primary" plain>发布</el-button>
        </span>
    </div>
</div>
</template>

<script>
// let Base64 = require('js-base64').Base64;
// import create from '../post/create';

export default {
    name: "activity",
    components: {
        // 'v-create': create,
    },
    data() {
        return {
            activeIndex: '1',
            textarea: '',
            input: '',
            visible: false,
            dynamicTags: ['心情', '工作'],
            inputVisible: false,
            inputValue: '',
            // 照片墙
            dialogImageUrl: '',
            dialogVisible: false
            // 照片墙
        };
    },
    methods: {
        // 照片墙
        handleRemove(file, fileList) {
            console.log(file, fileList);
        },
        handlePictureCardPreview(file) {
            this.dialogImageUrl = file.url;
            this.dialogVisible = true;
        },
        // 照片墙
        addlink() {
            this.visible = false;
            this.textarea = this.textarea + this.input;
            this.input = '';
        },
        handleSelect(key, keyPath) {
            console.log(key, keyPath);
        },
        gotoPost() {
            this.$message({
                showClose: true,
                message: '请先登录！',
                type: 'error'
            });
        },
        open() {
            this.$message({
                showClose: true,
                message: '请先登录！',
                type: 'error'
            });
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
    left: 20%;
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
</style>

<template>
<div class="layout">
    <el-menu :default-active="activeIndex" @select="handleSelect" active-text-color="#409EFF" background-color="#ffffff" class="el-menu-demo" mode="horizontal" text-color="#000000">
        <el-menu-item index="1" style="margin-left:20px;width:50px;">发动态</el-menu-item>
        <el-menu-item @click="gotoPost" index="2" style="margin-left:20px;width:50px;">发帖子</el-menu-item>
    </el-menu>
<!--    <el-input :autosize="{ minRows: 2, maxRows: 4}" class="textarea" placeholder="此刻你想和大家分享什么..." type="textarea" v-model="textarea"></el-input>-->
    <!-- 发布说说 -->
    <v-DynamicCreate></v-DynamicCreate>
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
                        <el-button @click="visible = false" class="conflink" size="mini" type="text">添加</el-button>
                    </div>
                    <el-button class="linkbtn" slot="reference"><span class="dakatext">链接</span></el-button>
                </el-popover>
            </span>
            <!-- 说说的图片 -->
            <span class="pic">
                <a-icon type="picture" /><span class="dakatext">图片</span>
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
let Base64 = require('js-base64').Base64;
import DynamicCreate from '../post/create';

export default {
    name: "activity",
    components: {
        'v-DynamicCreate': DynamicCreate,
    },
    data() {
        return {
            activeIndex: '1',
            textarea: '',
            input: '',
            visible: false,
            dynamicTags: ['心情', '工作'],
            inputVisible: false,
            inputValue: ''
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
                        message: `action: ${action}`
                    });
                }
            });
        },
        addTopic() {
            this.textarea = this.textarea + '#';

        },
        handlePostActivity() {
            console.log('6727282982928');
            console.log(Base64.encode('hssjsjiw9282'));
            // console.log(Base64.decode('5r2Y6auY'));
            // 发布文章接口
            const data = {
                content: Base64.encode(this.textarea),
                author_id: JSON.parse(window.localStorage.getItem('Login_data')).userdata.id,
                taglist: this.dynamicTags.toString(),
                posttype: '说'
            };
            console.log(data);
            fetch('/bbsdev/addArticle', {
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
                        message: '发布文章成功',
                        type: 'success'
                    });
                    this.textarea = '';
                    this.success2 = false;
                    this.$emit('func2', this.success2)
                    this.$router.push('/bbs/home_login');
                } else {
                    this.$message({
                        showClose: true,
                        message: '发布文章失败',
                        type: 'error'
                    });
                }
            })
        },
        handleClose(tag) {
            this.dynamicTags.splice(this.dynamicTags.indexOf(tag), 1);
        },

        showInput() {
            this.inputVisible = true;
            this.$nextTick(_ => {
                this.$refs.saveTagInput.$refs.input.focus();
                console.log(_);
            });
        },
        handleInputConfirm() {
            let inputValue = this.inputValue;
            if (inputValue) {
                this.dynamicTags.push(inputValue);
            }
            this.inputVisible = false;
            this.inputValue = '';
        }
    },
    mounted: {

    }
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
    display: flex;
    margin-top: 10px;
}

.tools .right {
    position: relative;
    left: 70%;
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

.el-tag+.el-tag {
    margin-left: 10px;
}

.button-new-tag[data-v-5e5f693f] {
    margin-left: 10px;
    height: 30px;
    width: 67.17px;
    line-height: 30px;
    padding-top: 0;
    padding-bottom: 0;
    color: #606266;
    font-size: 15px;
}

.input-new-tag {
    width: 90px;
    margin-left: 10px;
    vertical-align: bottom;
}

.tag {
    position: relative;
    left: 2%;
    margin-top: 10px;
    text-align: left;
    display: flex;
    align-items: center;
}

.el-tag {
    background-color: #409EFF;
    border-color: #409EFF;
    color: #ffffff;
    height: 30px;
    min-width: 60px;
    max-width: 100%;
    display: flex;
    padding: 5px 5px;
    font-size: 15px;
    align-items: center;
}

.el-tag .el-tag__close {
    color: #ffffff;
    padding: 5px;
    font-size: 15px;
}

.left {
    display: flex;
    align-items: center;
}

.pic {
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    margin-left: 10px;
}

.face {
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    margin-left: 10px;
}
</style>

<template>
    <div class="layout">
        <el-menu :default-active="activeIndex" @select="handleSelect" active-text-color="#409EFF"
                 background-color="#ffffff"
                 class="el-menu-demo" mode="horizontal" text-color="#000000">
            <el-menu-item index="1" style="margin-left:20px;width:50px;">发动态</el-menu-item>
            <el-menu-item @click="gotoPost" index="2" style="margin-left:20px;width:50px;">发帖子</el-menu-item>
        </el-menu>
        <el-input :autosize="{ minRows: 2, maxRows: 4}" class="textarea" placeholder="此刻你想和大家分享什么..." type="textarea"
                  v-model="textarea"></el-input>
        <div class="tools">
            <span class="left">
                <!-- 说说的标签 -->
                <span class="tag">
                    <el-tag :disable-transitions="false" :key="tag" @close="handleClose(tag)" closable size="mini" v-for="tag in dynamicTags">
                    {{tag}}
                    </el-tag>
                    <el-input @blur="handleInputConfirm" @keyup.enter.native="handleInputConfirm" class="input-new-tag"
                            ref="saveTagInput" size="mini" size="small" v-if="inputVisible" v-model="inputValue"></el-input>
                    <el-button @click="showInput" class="button-new-tag" size="small" size="mini" v-else># 话题</el-button>
                </span>
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
            </span>
            <span class="right">
                <el-button @click="handlePostActivity" class="post" type="info">发布</el-button>
            </span>
        </div>
    </div>
</template>

<script>
    import Base64 from "js-base64";

    export default {
        name: "activity",
        components: {},
        data() {
            return {
                activeIndex: '1',
                textarea: '',
                input: '',
                visible: false,
                taglist: [],
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
                // 发布文章接口
                const data = {
                    content: Base64.encode(this.textarea),
                    author_id: JSON.parse(window.localStorage.getItem('Login_data')).userdata.id,
                    taglist: this.taglist,
                    posttype: '说'
                };
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
                        this.success2 = false;
                        this.$emit('func2', this.success2)
                        this.$router.push('/bbs/home');
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

    .el-tag + .el-tag {
        margin-left: 10px;
    }

    .button-new-tag {
        margin-left: 10px;
        height: 32px;
        line-height: 30px;
        padding-top: 0;
        padding-bottom: 0;
    }

    .input-new-tag {
        width: 90px;
        margin-left: 10px;
        vertical-align: bottom;
    }
</style>

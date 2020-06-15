<template>
    <div class="layout">
        <!-- <el-menu :default-active="activeIndex" @select="handleSelect" active-text-color="#409EFF" background-color="#ffffff" class="el-menu-demo" mode="horizontal" text-color="#000000">
            <el-menu-item index="1" style="margin-left:20px;width:50px;">发动态</el-menu-item>
            <el-menu-item @click="gotoPost" index="2" style="margin-left:20px;width:50px;">发资源</el-menu-item>
        </el-menu> -->
        <el-input :autosize="{ minRows: 2, maxRows: 4}" class="textarea" placeholder="此刻你想和大家分享什么..." type="textarea"
                  v-model="textarea"></el-input>
        <!-- 发布说说 -->
        <!-- <v-create class="textarea"></v-create> -->
        <!-- 照片墙 -->
        <div class="postpic">
            <el-upload class="upload-demo" ref="upload" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg"
                       :on-change="uploadFile" :action="upLoadUrl" list-type="picture-card" :on-preview="handlePictureCardPreview"
                       :on-remove="handleRemove" :on-success="addImg" :before-remove="beforeRemove" :on-exceed="handleExceed"
                       :limit="6" :file-list="fileList" :auto-upload="true" :before-upload="onBeforeUploadImg"
                       :http-request="uploadRotationImage" multiple>
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
            <!-- <span class="tag">
                <a-icon style="margin-right:5px;height:16px;width:16px;" type="tags" />
                <el-tag :disable-transitions="false" :key="tag" @close="handleClose(tag)" closable size="mini" v-for="tag in dynamicTags">
                    {{tag}}
                </el-tag>
                <el-input @blur="handleInputConfirm" @keyup.enter.native="handleInputConfirm" class="input-new-tag" ref="saveTagInput" size="mini" v-if="inputVisible" v-model="inputValue"></el-input>
                <el-button @click="showInput" class="button-new-tag" size="mini" v-else>+ 添加</el-button>
            </span> -->
            <!-- <span class="left"> -->
            <!-- 说说的链接 -->
            <!-- <span class="link">
                <i class="el-icon-link"></i>
                <el-popover placement="bottom" v-model="visible" width="160">
                    <el-input placeholder="请输入网页链接" v-model="input"></el-input>
                    <p>一次只推荐一个网页哦</p>
                    <div style="text-align: right; margin: 0">
                        <el-button @click="addlink" class="conflink" size="mini" type="text">添加</el-button>
                    </div>
                    <el-button class="linkbtn" slot="reference"><span class="dakatext">链接</span></el-button>
                </el-popover>
            </span> -->
            <!-- 说说的表情 -->
            <!-- <span class="face">
                <a-icon type="smile" /><span class="dakatext">表情</span>
            </span> -->
            <!-- </span> -->
            <span class="right">
                <el-button @click="handlePostActivity" class="post" type="primary" plain>发布</el-button>
            </span>
        </div>
    </div>
</template>

<script>
    let Base64 = require('js-base64').Base64;
    // import create from '../post/create';

    export default {
        name: "activity_login",
        components: {
            // 'v-create': create,
        },
        data() {
            return {
                upLoadUrl: 'http://127.0.0.1:7001/bbsdev/addImageList',
                activeIndex: '1',
                textarea: '',
                input: '',
                visible: false,
                dynamicTags: [],
                inputVisible: false,
                inputValue: '',
                // 照片墙
                dialogImageUrl: '',
                dialogVisible: false,
                // 照片墙
                fileList: []
            };
        },
        methods: {
            // 照片墙
            handleRemove(file, fileList) {
                console.log("removeFile: " + file, "removeFileList: " + fileList);
            },
            handlePictureCardPreview(file) {
                console.log("PictureCardPreview: " + file.url);
                this.dialogImageUrl = file.url;
                this.dialogVisible = true;
            },
            addImg(response, file, fileList){
                console.log("addImg response: " + response);
                console.log("addImg file: " + file);
                console.log("addImg fileList: " + fileList);
            },
            handleExceed(files, fileList) {
                this.$message.warning(`当前限制选择 3 个文件，本次选择了 ${files.length} 个文件，共选择了 ${files.length + fileList.length} 个文件`);
            },
            beforeRemove(file, fileList) {
                console.log("PictureCardRemove: " + fileList);
                return this.$confirm(`确定移除 ${ file.name }？`);
            },
            onBeforeUploadImg(file){
                //图片上传前图片大小和类型判断
                const isImg = file.type === 'image/jpeg'|| 'image/jpg' || 'image/png';
                const isSize = file.size/1024/1024 <5;
                if(!isImg){
                    this.$message.error('上传文件只能是图片格式！');
                }
                if(!isSize){
                    this.$message.error('上传图片不能超过5MB！');
                }
                return isImg && isSize
            },
            fileChange(file){
                //更新文件列表数据，文件状态改变时的钩子，添加文件、上传成功和上传失败时都会被调用
                this.fileList =
                    {
                        name:file.name,
                        url:file.url
                    };
                console.log('上传的文件列表fileList',this.fileList);
            },
            // 上传图片
            async uploadFile(file, fileList) {
                console.log(file,fileList);
                var data = {
                    imageText1: '',
                    imageText2: '',
                    imageText3: '',
                    imageText4: '',
                    imageText5: ''
                };
                for(var i = 0;i < 5;i++) {
                    if(fileList[i]) {
                        var key = 'imageText' + (i+1).toString();
                        data[key] = this.imageToBase64(this.fileList[i]);
                    }
                }
                await fetch('/bbsdev/addImageList', {
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
                            message: '发布图片成功',
                            type: 'success'
                        });
                    } else {
                        this.$message({
                            showClose: true,
                            message: '发布图片失败',
                            type: 'error'
                        });
                    }
                })
            },
            addlink() {
                console.log("addLink: " + this.input);
                this.visible = false;
                this.textarea = this.textarea + this.input;
                this.input = '';
            },
            handleSelect(key, keyPath) {
                console.log("PictureCardSelect: " + key, "PictureCardSelect: " + keyPath);
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
                        console.log(action);
                        // this.$message({
                        //     type: 'info',
                        //     message: `action: ${action}`
                        // });
                    }
                });
            },
            addTopic() {
                this.textarea = this.textarea + '#';
            },
            handlePostActivity() {
                // 获取keywords
                const data1 = {
                    text: this.textarea,
                    topN: 3,
                };
                fetch('/bbsdev/extractKeywords', {
                    method: 'post',
                    headers: {
                        'Content-type': 'application/json',
                    },
                    body: JSON.stringify(data1)
                }).then(res => res.json()).then(res => {
                    console.log(res)
                    if (res.status == 200) {
                        if (res.data) {
                            this.dynamicTags = [];
                            res.data.forEach(element => {
                                this.dynamicTags.push(element.word);
                            });
                            // 发布文章接口
                            const data2 = {
                                content: Base64.encode(this.textarea),
                                author_id: JSON.parse(window.localStorage.getItem('Login_data')).userdata.id,
                                taglist: this.dynamicTags.toString(),
                                posttype: '说',
                                read_count: 0,
                                praise_count: 0,
                                comment_count: 0,
                                is_removed: 0,
                                imglist: this.fileList.toString()
                            };
                            fetch('/bbsdev/addArticle', {
                                method: 'post',
                                headers: {
                                    'Content-type': 'application/json',
                                },
                                body: JSON.stringify(data2)
                            }).then(res => res.json()).then(res => {
                                console.log(res)
                                if (res.status == 200) {
                                    this.$message({
                                        showClose: true,
                                        message: '发布说说成功',
                                        type: 'success'
                                    });
                                    this.textarea = '';
                                    this.fileList = [];
                                    this.success2 = false;
                                    this.$emit('func2', this.success2);
                                    this.$router.push('/bbs/home_login');
                                } else {
                                    this.$message({
                                        showClose: true,
                                        message: '发布说说失败',
                                        type: 'error'
                                    });
                                }
                            })
                        }
                    } else {
                        this.$message({
                            showClose: true,
                            message: '获取说说标签失败',
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
        display: flex;
        flex-direction: column;
    }

    .choose {
        font-size: 16px;
    }

    .tools .left {
        position: relative;
        left: 2%;
        display: flex;
        margin-top: 10px;
    }

    .tools .right {
        position: relative;
        /*left: 70%;*/
    }

    .post {
        font-size: 16px;
        width: 15%;
        height: 40px;
        margin: 5px;
        position: relative;
        left: 80%;
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
        height: 25px;
        width: 67.17px;
        line-height: 25px;
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
        height: 25px;
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

    .postpic {
        text-align: left;
        padding-left: 20px;
    }
</style>

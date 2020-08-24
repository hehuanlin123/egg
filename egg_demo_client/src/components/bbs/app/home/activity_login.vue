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
                       action="auto" :http-request="uploadSectionFile" list-type="picture-card" :on-preview="handlePictureCardPreview"
                       :on-remove="handleRemove" :on-success="addImg" :before-remove="beforeRemove" :on-exceed="handleExceed"
                       :limit="6" :file-list="fileList" :auto-upload="true" :before-upload="onBeforeUploadImg" multiple>
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
                uploadFile : [],
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
                this.fileList.push(file);
                console.log("================this.filelist===================");
                console.log(this.fileList);
                console.log(this.fileList[0].name);
                console.log(this.fileList[0].raw.name);
                /*[{
                    name: "（原生）我的.png",
                    percentage: 100,
                    raw: {
                            lastModified: 1573875081450,
                            lastModifiedDate: Sat Nov 16 2019 11:31:21 GMT+0800 (中国标准时间),
                            name: "（原生）我的.png",
                            size: 274664,
                            type: "image/png",
                            uid: 1597630577875,
                            webkitRelativePath: ""
                        }
                }]*/
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
                const isSize = file.size/1024/1024 < 5;
                if(!isImg){
                    this.$message.error('上传文件只能是图片格式！');
                }
                if(!isSize){
                    this.$message.error('上传图片不能超过5MB！');
                }
                return isImg && isSize;
            },
            fileChange(file){
                //更新文件列表数据，文件状态改变时的钩子，添加文件、上传成功和上传失败时都会被调用
                this.fileList = {
                    name:file.name,
                    url:file.url
                };
                console.log('上传的文件列表fileList',this.fileList);
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
            uploadSectionFile (param) {
                var uploadFileLength = this.uploadFile.length;
                let fileObj = param.file;
                if (fileObj.type === "image/jpeg" || fileObj.type === "image/jpg") {
                    let file = new File([fileObj], new Date().getTime() + ".jpg", {
                        type: "image/jpeg"
                    });
                    this.uploadFile[uploadFileLength] = {
                        'title' : this.thisTitle,
                        'imgFile' : file
                    };
                } else if (fileObj.type === "image/png") {
                    let file  = new File([fileObj], new Date().getTime() + ".png", {
                        type: "image/png"
                    });
                    this.uploadFile[uploadFileLength] = {
                        'title' : this.thisTitle,
                        'imgFile' : file
                    };
                } else {
                    this.$message.error("只能上传jpg/png文件");
                    return;
                }
            },
            handlePostActivity() {
                // 生成唯一id
                let post_id = Math.random().toString().substr(3, 3) + Date.now();
                // 发布图片文件
                for(var int = 0; int < this.uploadFile.length; int++) {
                    var param = new FormData(); // FormData 对象
                    var list = this.uploadFile[int];
                    var file = list.imgFile;
                    var name = list.title;
                    param.append("uploadFile", file); // 文件对象
                    param.append("uploadTitle", name); // 文件标题
                    param.append("post_id", post_id); // 发布ID
                    console.log("====================param参数是：==========================");
                    console.log(param);
                    console.log(list);
                    console.log(file);
                    console.log(name);
                    this.$axios({
                        method: "POST",
                        url: "http://127.0.0.1:7001/bbsdev/addImageObjectList",
                        headers: {
                            'content-type': 'application/x-www-form-urlencoded',
                            'token': 'token'
                        },
                        data: param
                    }).then(data => {
                        console.log(data);
                        this.$message({
                            showClose: true,
                            message: '上传成功',
                            type: 'success'
                        });
                    }).catch(error => {
                        console.log(error);
                        this.$message({
                            showClose: true,
                            message: '上传失败,请稍后重试',
                            type: 'error'
                        });
                    });
                }
                // 获取keywords
                const data2 = {
                    text: this.textarea,
                    topN: 3,
                };
                fetch('/bbsdev/extractKeywords', {
                    method: 'post',
                    headers: {
                        'Content-type': 'application/json',
                    },
                    body: JSON.stringify(data2)
                }).then(res => res.json()).then(res => {
                    console.log(res)
                    if (res.status == 200) {
                        if (res.data) {
                            this.dynamicTags = [];
                            res.data.forEach(element => {
                                this.dynamicTags.push(element.word);
                            });
                            // 发布文章
                            const data3 = {
                                post_id: post_id,
                                content: Base64.encode(this.textarea),
                                author_id: JSON.parse(window.localStorage.getItem('Login_data')).userdata.id,
                                taglist: this.dynamicTags.toString(),
                                posttype: '说',
                                read_count: 0,
                                praise_count: 0,
                                comment_count: 0,
                                is_removed: 0,
                                imglist: ''
                            };
                            fetch('/bbsdev/addArticle', {
                                method: 'post',
                                headers: {
                                    'Content-type': 'application/json',
                                },
                                body: JSON.stringify(data3)
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

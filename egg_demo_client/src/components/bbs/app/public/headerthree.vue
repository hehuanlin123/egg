<template>
<!-- 三栏布局 flex布局-->
<div class="layout">
    <div class="left">
        <span>
            <img style="height:30px;width:auto;" src="https://upload-images.jianshu.io/upload_images/7761489-3e058de1c7c19dda.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240" alt="">
            标签推荐系统
        </span>
    </div>
    <div class="center">
        <ul>
            <li v-for="list in headerList" :key="list.id">
                <!--              <a href="#">-->
                <!--                {{ list.title }}-->
                <!--              </a>-->
                <el-link type="primary" href="#">{{ list.title_ }}</el-link>
            </li>
        </ul>
    </div>
    <div class="right">
        <span>
            <el-button @click="handlecancel" type="text">取消</el-button>
            <el-button class="btn" type="primary" @click="handleConfirmPost">确定</el-button>
            <el-dialog title="设置" :visible.sync="dialogFormVisible">
                <el-form>
<!--                    <el-form-item class="choice" label="资源版块：" :label-width="formLabelWidth">-->
<!--                        <el-select v-model="form.region" placeholder="请选择发布的版块">-->
<!--                            <el-option label="程序人生" value="程序人生"></el-option>-->
<!--                            <el-option label="Python" value="Python"></el-option>-->
<!--                            <el-option label="Java" value="Java"></el-option>-->
<!--                            <el-option label="前端" value="前端"></el-option>-->
<!--                            <el-option label="架构" value="架构"></el-option>-->
<!--                            <el-option label="区块链" value="区块链"></el-option>-->
<!--                            <el-option label="数据库" value="数据库"></el-option>-->
<!--                            <el-option label="5G" value="5G"></el-option>-->
<!--                            <el-option label="游戏开发" value="游戏开发"></el-option>-->
<!--                            <el-option label="移动开发" value="移动开发"></el-option>-->
<!--                            <el-option label="云计算大数据" value="云计算大数据"></el-option>-->
<!--                            <el-option label="运维" value="运维"></el-option>-->
<!--                            <el-option label="安全" value="安全"></el-option>-->
<!--                            <el-option label="研发管理" value="研发管理"></el-option>-->
<!--                        </el-select>-->
<!--                    </el-form-item>-->
                    <el-form-item class="recomendtags" label="资源相关标签：" :label-width="formLabelWidth">
                        <!-- 文章标签 -->
                        <div class="tag">
                            <el-tag :key="tag" v-for="tag in dynamicTags" closable :disable-transitions="false" @close="handleClose(tag)">
                                {{tag}}
                            </el-tag>
                            <el-input class="input-new-tag" v-if="inputVisible" v-model="inputValue" ref="saveTagInput" size="small" @keyup.enter.native="handleInputConfirm" @blur="handleInputConfirm">
                            </el-input>
                            <el-button v-else class="button-new-tag" size="small" @click="showInput">+ 添加</el-button>
                        </div>
                    </el-form-item>
                </el-form>
                <div class="tips">
                    <a-icon type="info-circle" />以上是为您自动推荐的标签，最多可输入5个标签，方便资源检索</div>
                <div slot="footer" class="dialog-footer">
                    <el-button style="color:#606266;" type="text" @click="dialogFormVisible = false">取 消</el-button>
                    <el-button class="btn" type="primary" @click="handleConfirmTag">确 定</el-button>
                </div>
            </el-dialog>
        </span>
    </div>
</div>
<!-- 三栏布局 flex布局-->
</template>

<script>
let Base64 = require('js-base64').Base64;

export default {
    name: 'headerone',
    props: {
        title: String,
        content: String
    },
    data() {
        return {
            headerList: [{
                id: '1',
                name: 'Post',
                title_: '写文章'
            }, ],
            isShow: false,
            dialogFormVisible: false,
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
            formLabelWidth: '120px',
            dynamicTags: [],
            inputVisible: false,
            inputValue: ''
        }
    },
    methods: {
        handlecancel() {
            this.$router.push({
                path: '/bbs/home_login'
            });
        },

        handleClose(tag) {
            this.dynamicTags.splice(this.dynamicTags.indexOf(tag), 1);
        },

        showInput() {
            if (this.dynamicTags.length <= 5) {
                this.inputVisible = true;
                this.$nextTick(_ => {
                    this.$refs.saveTagInput.$refs.input.focus();
                    console.log(_);
                });
            } else {
                this.inputVisible = false;
                this.$message({
                    showClose: true,
                    message: '最多输入5个标签',
                    type: 'error'
                });
            }
        },

        handleInputConfirm() {
            let inputValue = this.inputValue;
            if (inputValue) {
                if (this.dynamicTags.length <= 5) {
                    this.dynamicTags.push(inputValue);
                } else {
                    this.$message({
                        showClose: true,
                        message: '最多输入5个标签',
                        type: 'error'
                    });
                }
            }
            this.inputVisible = false;
            this.inputValue = '';
        },
        handleConfirmPost() {
            if (this.title == null) {
                this.$message({
                    showClose: true,
                    message: '请输入资源标题',
                    type: 'error'
                });
                this.dialogFormVisible = false;
                return;
            }
            if (this.content == null) {
                this.$message({
                    showClose: true,
                    message: '请输入资源内容',
                    type: 'error'
                });
                this.dialogFormVisible = false;
                return;
            }
            let test = this.content.replace(/<[^>]+>|&[^>]+;/g, "");
            console.log(test);
            const data = {
                text: test,
                topN: 5,
            };
            fetch('/bbsdev/extractKeywords', {
                method: 'post',
                headers: {
                    'Content-type': 'application/json',
                },
                body: JSON.stringify(data)
            }).then(res => res.json()).then(res => {
                console.log(res)
                if (res.status == 200) {
                    if (res.data) {
                        this.dynamicTags = [];
                        res.data.forEach(element => {
                            this.dynamicTags.push(element.word);
                        });
                    }
                } else {
                    this.$message({
                        showClose: true,
                        message: '获取标签失败',
                        type: 'error'
                    });
                }
            })

            this.dialogFormVisible = true;
        },
        handleConfirmTag() {
            this.dialogFormVisible = false;
            // 发布文章接口
            const data = {
                title: this.title,
                content: Base64.encode(this.content),
                author_id: JSON.parse(window.localStorage.getItem('Login_data')).userdata.id,
                author_name: JSON.parse(window.localStorage.getItem('Login_data')).userdata.username,
                taglist: this.dynamicTags.toString(),
                plate: this.form.region,
                posttype: '发帖了',
                read_count: '',
                praise_count: '',
                comment_count: '',
                is_removed: 0
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
                    this.title = '';
                    this.content = '';
                    this.taglist = '';
                    this.plate = '';
                    this.posttype = '';
                    this.success2 = false;
                    this.$emit('func2', this.success2);
                    this.$router.push('/bbs/home_login');
                } else {
                    this.$message({
                        showClose: true,
                        message: '发布文章失败',
                        type: 'error'
                    });
                }
            })
        }
    }
}
</script>

<style scoped>
* {
    margin: 0;
    padding: 0;
    font-size: 15px;
    color: #ffffff;
}

.layout {
    background: #3d444c;
    text-align: center;
    height: 100%;
    display: flex;
    align-items: center;
}

.layout .left {
    width: 200px;
    height: 50px;
    text-align: left;
    padding-left: 1%;
    padding-top: 10px;
}

.layout .right {
    width: 100%;
    height: 50px;
    text-align: right;
    padding-right: 1%;
    padding-top: 10px;
}

.layout .center {
    width: 200px;
    height: 50px;
    text-align: left;
    padding-left: 1%;
    background-color: #31363d;
    padding-top: 10px;
}

.layout .right .search {
    position: relative;
    left: -30%;
    color: #fff;
    background: #31363e;
    padding: 5px;
    width: 25%;
    text-align: left;
}

.btn {
    margin-left: 20px;
    width: 80px;
    height: 30px;
    background-color: #1890ff;
}

.tag {
    margin: 5px auto;
    text-align: left;
    display: flex;
    align-items: center;
}

.el-tag+.el-tag {
    margin-left: 10px;
}

.button-new-tag {
    margin-left: 10px;
    height: 32px;
    width: 67.17px;
    line-height: 30px;
    padding-top: 0;
    padding-bottom: 0;
    color: #606266;
}

.input-new-tag {
    width: 90px;
    margin-left: 10px;
    vertical-align: bottom;
}

.el-tag {
    background-color: #409EFF;
    border-color: #409EFF;
    color: #ffffff;
    height: 30px;
    min-width: 60px;
    max-width: 100%;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    padding: 5px 5px;
    font-size: 15px;
    align-items: center;
}

.el-select-dropdown__item {
    color: #606266;
}

.choice {
    display: table-cell;
}

.recomendtags {
    display: table;
}

.tips {
    color: #606266;
    text-align: left;
    position: relative;
    left: 5%;
    font-size: 8px;
}
</style>

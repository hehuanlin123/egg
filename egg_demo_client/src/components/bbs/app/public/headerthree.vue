<template>
    <!-- 三栏布局 flex布局-->
    <div class="layout">
        <div class="left">
            <span>Python论坛</span>
        </div>
        <div class="center">
            <ul>
                <li v-for="list in headerList" :key="list.id">
                    <!--              <a href="#">-->
                    <!--                {{ list.title }}-->
                    <!--              </a>-->
                    <el-link type="primary" href="#">{{ list.title }}</el-link>
                </li>
            </ul>
        </div>
        <div class="right">
        <span>
            <el-button @click="handlecancel" type="text">取消</el-button>
            <el-button class="btn" type="primary" @click="handleConfirmPost">确定</el-button>
            <el-dialog title="设置" :visible.sync="dialogFormVisible">
                <el-form>
                    <el-form-item class="choice" label="帖子版块：" :label-width="formLabelWidth">
                        <el-select v-model="form.region" placeholder="请选择发布的版块">
                            <el-option label="程序人生" value="1"></el-option>
                            <el-option label="Python" value="2"></el-option>
                            <el-option label="Java" value="3"></el-option>
                            <el-option label="前端" value="4"></el-option>
                            <el-option label="架构" value="5"></el-option>
                            <el-option label="区块链" value="6"></el-option>
                        </el-select>
                    </el-form-item>
                    <el-form-item class="recomendtags" label="帖子相关标签：" :label-width="formLabelWidth">
                        <!-- 文章标签 -->
                        <div class="tag">
                            <el-tag :key="tag" v-for="tag in dynamicTags" closable :disable-transitions="false"
                                    @close="handleClose(tag)">
                                {{tag}}
                            </el-tag>
                            <el-input class="input-new-tag" v-if="inputVisible" v-model="inputValue" ref="saveTagInput"
                                      size="small" @keyup.enter.native="handleInputConfirm" @blur="handleInputConfirm">
                            </el-input>
                            <el-button v-else class="button-new-tag" size="small" @click="showInput">+ 添加</el-button>
                        </div>
                    </el-form-item>
                </el-form>
                <div class="tips"><a-icon type="info-circle"/>以上是为您自动推荐的标签，最多可输入5个标签，方便帖子检索</div>
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
    import Base64 from 'js-base64';

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
                    title: '写文章'
                },],
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
                dynamicTags: ['Java', '云计算大数据', '5G'],
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
            },
            handleConfirmPost() {
                if (this.title == null) {
                    this.$message({
                        showClose: true,
                        message: '请输入帖子标题',
                        type: 'error'
                    });
                }
                if (this.content == null) {
                    this.$message({
                        showClose: true,
                        message: '请输入帖子内容',
                        type: 'error'
                    });
                }
                this.dialogFormVisible = true;
            },
            handleConfirmTag() {
                this.dialogFormVisible = false;
                // 发布文章接口
                const data = {
                    title: this.title,
                    content: Base64.encode(this.content),
                    author_id: JSON.parse(window.localStorage.getItem('Login_data')).userdata.id,
                    taglist: this.dynamicTags,
                    plate: this.form.region,
                    posttype: '发帖了'
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
    }

    .el-tag + .el-tag {
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

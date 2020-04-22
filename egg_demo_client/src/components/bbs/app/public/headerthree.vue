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
            <el-button class="btn" type="primary" @click="dialogFormVisible = true">确定</el-button>
            <el-dialog title="设置" :visible.sync="dialogFormVisible">
                <el-form :model="form">
                    <el-form-item label="帖子相关话题" :label-width="formLabelWidth">
                        <el-input v-model="form.name" autocomplete="off"></el-input>
                    </el-form-item>
                    <el-form-item label="帖子版块" :label-width="formLabelWidth">
                        <el-select class="choice" v-model="form.region" placeholder="请选择发布的版块">
                            <el-option label="版块一" value="1"></el-option>
                            <el-option label="版块二" value="2"></el-option>
                            <el-option label="版块一" value="3"></el-option>
                            <el-option label="版块二" value="4"></el-option>
                            <el-option label="版块一" value="5"></el-option>
                            <el-option label="版块二" value="6"></el-option>
                        </el-select>
                    </el-form-item>
                    <el-form-item label="帖子相关标签" :label-width="formLabelWidth">
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
                <div slot="footer" class="dialog-footer">
                    <el-button style="color:#000000;" type="text" @click="dialogFormVisible = false">取 消</el-button>
                    <el-button class="btn" type="primary" @click="dialogFormVisible = false">确 定</el-button>
                </div>
            </el-dialog>
        </span>
    </div>
</div>
<!-- 三栏布局 flex布局-->
</template>

<script>
export default {
    name: 'headerone',
    data() {
        return {
            headerList: [{
                id: '1',
                name: 'Post',
                title: '写文章'
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
            dynamicTags: ['标签一', '标签二', '标签三'],
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
    color: #000000;
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
    color: #000000;
}

.el-select {
    width: 487.5px;
}

</style>

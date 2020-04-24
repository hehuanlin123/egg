<template>
<div class="layout">
    <v-headerthree :title="input" :content="content" class="header"></v-headerthree>
    <el-input class="title" placeholder="文章标题：一句话说明你遇到的问题或想分享的经验" v-model="input" clearable>
    </el-input>
    <!-- 文章标签 -->
    <!-- <div class="tag">
        <el-tag :key="tag" v-for="tag in dynamicTags" closable :disable-transitions="false" @close="handleClose(tag)">
            {{tag}}
        </el-tag>
        <el-input class="input-new-tag" v-if="inputVisible" v-model="inputValue" ref="saveTagInput" size="small" @keyup.enter.native="handleInputConfirm" @blur="handleInputConfirm">
        </el-input>
        <el-button v-else class="button-new-tag" size="small" @click="showInput">+ New Tag</el-button>
    </div> -->
    <div>
        <el-card class="editor">
            <v-quilleditor v-model="content" ref="myQuillEditor" style="height: 500px;" :options="editorOption">
                <!-- 自定义toolar -->
                <div id="toolbar" slot="toolbar">
                    <!-- Add a bold button -->
                    <button class="ql-bold" title="加粗">Bold</button>
                    <button class="ql-italic" title="斜体">Italic</button>
                    <button class="ql-underline" title="下划线">underline</button>
                    <button class="ql-strike" title="删除线">strike</button>
                    <button class="ql-blockquote" title="引用"></button>
                    <button class="ql-code-block" title="代码"></button>
                    <button class="ql-header" value="1" title="标题1"></button>
                    <button class="ql-header" value="2" title="标题2"></button>
                    <!--Add list -->
                    <button class="ql-list" value="ordered" title="有序列表"></button>
                    <button class="ql-list" value="bullet" title="无序列表"></button>
                    <!-- Add font size dropdown -->
                    <select class="ql-header" title="段落格式">
                        <option selected>段落</option>
                        <option value="1">标题1</option>
                        <option value="2">标题2</option>
                        <option value="3">标题3</option>
                        <option value="4">标题4</option>
                        <option value="5">标题5</option>
                        <option value="6">标题6</option>
                    </select>
                    <select class="ql-size" title="字体大小">
                        <option value="10px">10px</option>
                        <option value="12px">12px</option>
                        <option value="14px">14px</option>
                        <option value="16px" selected>16px</option>
                        <option value="18px">18px</option>
                        <option value="20px">20px</option>
                    </select>
                    <select class="ql-font" title="字体">
                        <option value="SimSun">宋体</option>
                        <option value="SimHei">黑体</option>
                        <option value="Microsoft-YaHei">微软雅黑</option>
                        <option value="KaiTi">楷体</option>
                        <option value="FangSong">仿宋</option>
                        <option value="Arial">Arial</option>
                    </select>
                    <!-- Add subscript and superscript buttons -->
                    <select class="ql-color" value="color" title="字体颜色"></select>
                    <select class="ql-background" value="background" title="背景颜色"></select>
                    <select class="ql-align" value="align" title="对齐"></select>
                    <button class="ql-clean" title="还原"></button>
                    <!-- You can also add your own -->
                </div>
            </v-quilleditor>
        </el-card>
        <!-- 自定义标签 -->
    </div>
</div>
</template>

<script>
import headerthree from "../../../components/bbs/app/public/headerthree";
import {
    Quill,
    quillEditor
} from 'vue-quill-editor'
import 'quill/dist/quill.core.css'
import 'quill/dist/quill.snow.css'
import 'quill/dist/quill.bubble.css'

//引入font.css 
import '../../../assets/css/font.css'

// 自定义字体大小
let Size = Quill.import('attributors/style/size')
Size.whitelist = ['10px', '12px', '14px', '16px', '18px', '20px']
Quill.register(Size, true)

// 自定义字体类型
var fonts = ['SimSun', 'SimHei', 'Microsoft-YaHei', 'KaiTi', 'FangSong', 'Arial', 'Times-New-Roman', 'sans-serif',
    '宋体', '黑体'
]
var Font = Quill.import('formats/font')
Font.whitelist = fonts
Quill.register(Font, true)

export default {
    name: "Post",
    components: {
        "v-headerthree": headerthree,
        "v-quilleditor": quillEditor,
    },
    data() {
        return {
            input: '',
            content: null,
            editorOption: {
                placeholder: "请输入",
                theme: "snow", // or 'bubble' 
                modules: {
                    toolbar: {
                        container: '#toolbar'
                    }
                }
            },
            dynamicTags: ['标签一', '标签二', '标签三'],
            inputVisible: false,
            inputValue: ''
        };
    },
    methods: {
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

.header {
    height: 10%;
}

.title {
    height: 10%;
    width: 96%;
    margin: 5px 0 5px 0;
    left: 2%;
}

.editor {
    height: 600px;
}

.el-tag+.el-tag {
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

.tag{
  margin: 5px auto;
  text-align: left;
  padding-left: 2%;
}
</style>

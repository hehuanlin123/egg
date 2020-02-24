<template>
    <div>
        <van-uploader
                v-model="fileList"
                :max-count="1"
                :after-read="afterRead"
        />
        <van-cell-group>
            <van-field label="文章标题:" placeholder="请输入文章标题" v-model="title"></van-field>
            <van-field label="文章简介:" placeholder="请输入文章简介" v-model="summary"></van-field>
            <van-field label="文章内容:" placeholder="请输入文章内容" v-model="content" type="textarea" autosize></van-field>
        </van-cell-group>
        <van-button type="primary" @click="handleAdd" class="add-button">提交</van-button>
    </div>
</template>

<script>
    import {Uploader,CellGroup,Field,Button} from 'vant'

    export default {
        name: "Add",
        computed:{
            [Uploader.name]:Uploader,
            [CellGroup.name]:CellGroup,
            [Field.name]:Field,
            [Button.name]:Button,
        },
        data(){
            return {
                fileList:[],
                title:'',
                summary:'',
                content:'',
                img:'',
            }
        },
        methods:{
            afterRead(info){
                console.log(info)
                this.img = info.content;
            },
            handleAdd(){
                const data = {
                    title:this.title,
                    summary: this.summary,
                    content:this.content,
                    img:this.img
                };
                console.log(data)
            }
        },
    }
</script>

<style scoped>
    .add-button{
        position: absolute;
        width: 80%;
        bottom: 80px;
        left:10%;
    }
</style>
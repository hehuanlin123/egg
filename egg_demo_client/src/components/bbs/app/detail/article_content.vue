<template>
    <div>
        <div class="titleBox">
            <h1>{{article.description}}</h1>
        </div>
        <div class="introBox">
            <a-row>
                <a-col :span="4">
                    <el-avatar :src="article.avatar"></el-avatar>
                </a-col>
                <a-col :span="8">
                    <p>{{article.author}}</p>
                    <p>
                        <发表于&nbsp;&nbsp;
                        {{article.time}}
                    </p>
                </a-col>
                <a-col :span="12">
                    <p>
                        <span v-bind:key="index" v-for="(tag,index) in article.taglist">
                            <el-tag id="el-tag-post" size="mini" type="info">{{tag}}</el-tag>
                        </span>
                    </p>
                    <p>
                        <a-icon type="like" /><span>赞&nbsp;&nbsp;{{article.read}}</span>
                        <a-icon type="message" /><span>评论&nbsp;&nbsp;{{article.read}}</span>
                        <a-icon type="eye" /><span>浏览&nbsp;&nbsp;{{article.read}}</span>
                    </p>
                </a-col>
            </a-row>
        </div>
        <div class="articleText" v-html="article.content"></div>
    </div>
</template>

<script>
    export default {
        name: "article_content",
        props: ['article'],
        data() {
            return {};
        },
        methods: {},
        mounted: {}
    }
</script>

<style scoped>

</style>

<template>
<div>
    <div class="titleBox" style="border-bottom:none;">
        <p class="title">{{article.description}}</p>
    </div>
    <div class="introBox">
        <a-row>
            <a-col :span="2">
                <el-avatar style="margin-left:20px;" :src="article.avatar"></el-avatar>
            </a-col>
            <a-col :span="4">
                <p>{{article.author}}</p>
                <p>
                    发表于&nbsp;&nbsp;
                    {{article.time}}
                </p>
            </a-col>
            <a-col :span="12">
            </a-col>
            <a-col :span="6">
                <p>
                    <span v-bind:key="index" v-for="(tag,index) in article.taglist">
                        <el-tag style="margin:2px 5px;" id="el-tag-post" size="mini" type="info">{{tag}}</el-tag>
                    </span>
                </p>
                <p>
                    <span class="icon_static" @click="addPraise(article.title)">赞&nbsp;&nbsp;{{article.zan ? article.zan : 0}}&nbsp;|&nbsp;</span>
                    <span class="icon_static">评论&nbsp;&nbsp;{{article.pin ? article.pin : 0}}&nbsp;|&nbsp;</span>
                    <span class="icon_static">浏览&nbsp;&nbsp;{{article.read ? article.read : 0}}</span>
                </p>
            </a-col>
        </a-row>
    </div>
    <div style="margin: 20px;" class="articleText" v-html="article.content"></div>
</div>
</template>

<script>
export default {
    name: "article_content",
    props: ['article'],
    data() {
        return {};
    },
    methods: {
        addPraise(id){ // 点赞

        },
    },
    mounted: {}
}
</script>

<style scoped>
* {
    padding: 0%;
    margin: 0%;
}

.title {
    position: relative;
    left: 20px;
    text-align: left;
    font-weight: bolder;
    padding-top: 10px;
}

.introBox {
    border-bottom: 1px solid #ccc;
    text-align: left;
    font-size: 12px;
}

.icon_static{
    margin: auto 5px;
}
</style>

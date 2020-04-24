<template>
    <div>
        <div class="titleBox">
            <h1>{{article.description}}</h1>
            <p><i class="glyphicon glyphicon-time"></i><span>{{article.time}}</span><i
                    class="glyphicon glyphicon-eye-open"></i><span>阅读量：{{article.read}}</span></p>
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

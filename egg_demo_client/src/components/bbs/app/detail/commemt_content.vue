<template>
    <div class="commentBox">
        <h3>评论</h3>
        <p v-if="comment.length==0">暂无评论，我来发表第一篇评论！</p>
        <div v-else>
            <div class="comment" v-for="(item,index1) in comment" v-bind:key="index1">
                <b>{{item.name}}<span>{{item.time}}</span></b>
                <p @click="changeCommenter(item.name,index1)">{{item.content}}</p>
                <div v-if="item.reply.length > 0">
                    <div class="reply" v-bind:key="index2" v-for="(reply,index2) in item.reply">
                        <b>{{reply.responder}}&nbsp;&nbsp;回复&nbsp;&nbsp;{{reply.reviewers}}<span>{{reply.time}}</span></b>
                        <p @click="changeCommenter(reply.responder,index2)">{{reply.content}}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "commemt_content",
        props: ['comment'],
        methods: {
            changeCommenter: function (name, index) {
                this.$emit("change", name, index);
            }
        },
        data() {
            return {};
        },
        mounted: {}
    }
</script>

<style scoped>

</style>


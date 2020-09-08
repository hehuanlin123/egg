<template>
    <div class="commentBox">
        <h3>发表评论</h3>
        <b v-if="type">你回复&nbsp;{{name}}</b>
        <textarea class="area" name="" value="请填写评论内容" v-model="commentText"></textarea>
        <button style="background: #1890ff;color: #ffffff;" class="btn" @click="addComment">发表</button>
        <button style="background: darkgray;color: #ffffff;" class="btn" @click="canelComment">取消</button>
    </div>
</template>

<script>
    export default {
        name: "comment_textarea",
        props: ['type', 'name'],
        data: function () {
            return {commentText: ""}
        },
        methods: {
            addComment: function () {
                this.$emit("submit", this.commentText);
                this.commentText = "";
            },
            canelComment: function () {
                this.$emit("canel");
                this.commentText = "";
            }
        }
    }
</script>

<style scoped>

    * {
        margin: 0;
        padding: 0;
    }

    .area {
        text-indent: 20px;
    }

</style>

<template>
    <div class="fixed-menu" style="bottom: 406px;">
        <ul>
            <li @click.stop="backtop">
                <a-icon type="up" />
            </li>
            <li>
                <a-icon type="weibo" />
            </li>
            <li>
                <a-icon type="qq" />
            </li>
            <li>
                <a-icon type="wechat" />
            </li>
            <li>
                <a-icon type="edit" />
            </li>
            <li>
                <a-icon type="mobile" />
            </li>
        </ul>
    </div>
</template>

<script>
    export default {
        name: "THeader",
        methods: {
            backtop() {
                this.$emit('backtop');
            }
        }
    }
</script>

<style scoped>
.fixed-menu > ul > li{
    background-color: #ffffff;
    border-radius: 3px;
    margin-bottom: 10px;
}
</style>
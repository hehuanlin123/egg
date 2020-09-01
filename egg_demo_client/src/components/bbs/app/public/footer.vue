<template>
    <div>
        <el-row>
            <el-col :span="6">
                <div class="grid-content bg-purple">
                    <p><img class="qrcode" src="https://uploadfiles.nowcoder.com/app/app_download.png"></p>
                    <p>扫一扫，关注我</p>
                </div>
            </el-col>
            <el-col :span="8">
                <div class="grid-content bg-purple-light">
                    <p class="icon">在这里，寻找答案</p>
                    <p><el-row>
                        <el-col :span="4">
                            <div class="grid-content bg-purple">
                                <a-icon type="github" />
                            </div>
                        </el-col>
                        <el-col :span="4">
                            <div class="grid-content bg-purple">
                                <a-icon class="a-icon" type="qq" />
                            </div>
                        </el-col>
                        <el-col :span="4">
                            <div class="grid-content bg-purple-light">
                                <a-icon class="a-icon" type="wechat" />
                            </div>
                        </el-col>
                        <el-col :span="4">
                            <div class="grid-content bg-purple">
                                <a-icon class="a-icon" type="weibo-circle" />
                            </div>
                        </el-col>
                        <el-col :span="4">
                            <div class="grid-content bg-purple-light">
                                <a-icon class="a-icon" type="zhihu" />
                            </div>
                        </el-col>
                        <el-col :span="4">
                            <div class="grid-content bg-purple">
                                <a-icon type="dingding" />
                            </div>
                        </el-col>
                    </el-row></p>
                </div>
            </el-col>
            <el-col :span="10">
                <div class="grid-content bg-purple">
                    333333333
                </div>
            </el-col>
        </el-row>
    </div>
</template>

<script>
    export default {
        name: 'footer',
        data() {
            return {}
        }
    }
</script>

<style scoped>
.qrcode{
    height: 70px;
    margin-top: 20px;
    margin-bottom: 20px;
}
.icon{
    height: 20px;
    margin-top: 20px;
    margin-bottom: 20px;
}
</style>

<template>
    <div>
        <el-row>
            <el-col :span="5">
                <div class="grid-content bg-purple">
                    <p><img class="qrcode" src="https://uploadfiles.nowcoder.com/app/app_download.png"></p>
                    <p>扫一扫，关注我</p>
                </div>
            </el-col>
            <el-col :span="8">
                <div class="grid-content bg-purple-light">
                    <p class="icon">在这里，寻找答案</p>
                    <p><el-row>
                        <el-col :span="1"><div class="grid-content bg-purple word">1</div></el-col>
                        <el-col :span="3">
                            <div class="grid-content bg-purple">
                                <a-icon type="github" />
                            </div>
                        </el-col>
                        <el-col :span="1"><div class="grid-content bg-purple word">2</div></el-col>
                        <el-col :span="3">
                            <div class="grid-content bg-purple">
                                <a-icon class="a-icon" type="qq" />
                            </div>
                        </el-col>
                        <el-col :span="1"><div class="grid-content bg-purple word">3</div></el-col>
                        <el-col :span="3">
                            <div class="grid-content bg-purple-light">
                                <a-icon class="a-icon" type="wechat" />
                            </div>
                        </el-col>
                        <el-col :span="3">
                            <div class="grid-content bg-purple">
                                <a-icon class="a-icon" type="weibo-circle" />
                            </div>
                        </el-col>
                        <el-col :span="1"><div class="grid-content bg-purple word">4</div></el-col>
                        <el-col :span="3">
                            <div class="grid-content bg-purple-light">
                                <a-icon class="a-icon" type="zhihu" />
                            </div>
                        </el-col>
                        <el-col :span="1"><div class="grid-content bg-purple word">5</div></el-col>
                        <el-col :span="3">
                            <div class="grid-content bg-purple">
                                <a-icon type="dingding" />
                            </div>
                        </el-col>
                        <el-col :span="1"><div class="grid-content bg-purple word">6</div></el-col>
                    </el-row></p>
                </div>
            </el-col>
            <el-col class="desc-container" :span="11">
                <div class="grid-content bg-purple">
                    <el-row class="desc">
                        <el-col :span="4"><div class="grid-content bg-purple">关于我们</div></el-col>
                        <el-col :span="1"><div class="grid-content bg-purple"></div></el-col>
                        <el-col :span="4"><div class="grid-content bg-purple"></div>意见反馈</el-col>
                        <el-col :span="1"><div class="grid-content bg-purple"></div></el-col>
                        <el-col :span="4"><div class="grid-content bg-purple-light">联系我们</div></el-col>
                        <el-col :span="1"><div class="grid-content bg-purple"></div></el-col>
                        <el-col :span="4"><div class="grid-content bg-purple"></div>友情链接</el-col>
                        <el-col :span="1"><div class="grid-content bg-purple"></div></el-col>
                        <el-col :span="4"><div class="grid-content bg-purple-light">免责声明</div></el-col>
                    </el-row>
                    <p>公司地址：北京市朝阳区北苑路北美国际商务中心K2座一层-北京极客科技有限公司</p>
                    <p>联系方式：010-60728802(电话) admin@jiker.com</p>
                    <p>京ICP备14055008号-4 增值电信业务经营许可证</p>
                </div>
            </el-col>
        </el-row>
    </div>
</template>

<script>
    export default {
        name: 'bottom',
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
.desc-container{
    text-align: left;
}
.desc{
    height: 20px;
    margin-top: 20px;
    margin-bottom: 20px;
}
.word{
    color: #3d444c;
}
el-divider{
    background-color: #ffffff;
    width: 5px;
}
</style>

<template>
    <div>
        <div class="update-info" v-show="!isshow">
            <div class="information">
                <p class="info-title">基本资料</p>
                <div class="info-head clearfix">
                    <div class="info-avatar">
                        <img :src="'api/' + infoForm.headpic"/>
                        <a @click="showBox" class="editor-txt"><span class="avatar-editor">编辑头像</span></a>
                    </div>
                    <div class="info-describ">
                        <div class="info-nickname">{{nickName}}</div>
                        <div class="info-complete">
                            资料完整度：
                            <span class="complete-percent text-center"><span class="percent">30%</span></span>
                        </div>
                    </div>
                </div>
                <el-form :model="infoForm" :rules="rules" ref="infoForm" label-width="100px">
                    <el-form-item class="info-item" label="昵称:" prop="nickname">
                        <el-input type="text" v-model="infoForm.nickname" ref="inputname"></el-input>
                    </el-form-item>
                    <el-form-item class="info-item" label="移动电话:" prop="tel">
                        <el-input type="num" v-model="infoForm.tel" ref="inputtel"></el-input>
                    </el-form-item>
                    <el-form-item class="info-item" label="邮箱:" prop="email">
                        <el-input disabled v-model="infoForm.email"></el-input>
                    </el-form-item>
                </el-form>
                <div style="padding-left:20%;">
                    <el-button @click="reset">重置</el-button>
                    <el-button type="primary" @click="submit">保存</el-button>
                </div>
            </div>
        </div>
        <!-- 修改头像弹出框 -->
        <!-- :action 里的内容我用点代替，那里就是后台服务器的ip地址和请求的接口名字-->
        <!-- :action: "'ip地址/接口名字'"-->
        <div class="custom-pic" v-show="show">
            <div class="upload-box text-center">
                <p class="upload-title">
                    <span>自定义头像</span>
                    <a @click="showBox"><span class="icon iconfont icon-quxiao"></span></a>
                </p>
                <el-upload
                        ref="upload"
                        class="upload-item"
                        :action="....."
                        list-type="picture-card"
                        :on-preview="handlePictureCardPreview"
                        :limit='1'
                        :headers='uploadHeaders'
                        :on-remove="handleRemove"
                        :auto-upload="false"
                        :before-upload="beforeAvatarUpload"
                >
                    <i class="el-icon-plus"></i>
                </el-upload>
                <el-dialog :visible.sync="dialogVisible">
                    <img width="100%" :src="dialogImageUrl" alt="">
                </el-dialog>
                <el-button style="margin-left: 10px;margin-top: 20px;" size="small" @click="showBox">取消</el-button>
                <el-button style="margin-left: 10px; margin-top: 20px;" size="small" type="primary"
                           @click="submitUpload">修改
                </el-button>
            </div>
        </div>
    </div>
</template>

<script>
    import axios from 'axios'

    export default {
        data() {
            let checkTel = (rule, value, callback) => {
                // 自定义验证手机号
                if (!value) {
                    return callback(new Error('请输入手机号!'))
                } else {
                    const reg = /^[1][3,4,5,7,8][0-9]\d{8}$/
                    if (reg.test(value)) {
                        callback()
                    } else {
                        return callback(new Error('请输入格式正确的手机号'))
                    }
                }
            }
            return {
                nickName: '',
                tel: '',
                show: false,
                dialogVisible: false,
                dialogImageUrl: '',
                imageUrl: '',
                infoForm: {},
                rules: {
                    nickname: [
                        {
                            required: true, message: '请输入您的昵称', trigger: 'blur'
                        },
                        {
                            min: 4, max: 20, message: '长度在4到20个字符之间', trigger: 'blur'
                        }
                    ],
                    tel: [
                        {
                            validator: checkTel, trigger: 'blur'
                        }
                    ]
                }
            }
        },
        components: {
            Bottom
        },
        computed: {
            // 计算属性 图片上传
            uploadHeaders() {
                return {
                    Authorization: this.$store.state.id
                }
            }
        },
        methods: {
            handleClose(done) {
                // 关闭修改头像的弹窗
                this.$confirm('确认取消?').then(_ => {
                    done()
                }).catch(_ => {
                })
            },
            submit() {
                // 修改资料保存触发该方法
                // params里的数据是需要返回给后台的
                const data1 = {
                    nickname: this.infoForm.nickname,
                    cellphone: this.infoForm.tel,
                    headpic: this.infoForm.headpic,
                    email: this.infoForm.email
                };
                fetch('/bbsdev/updateUserInfo', {
                    method: 'post',
                    headers: {
                        'Content-type': 'application/json',
                    },
                    body: JSON.stringify(data1)
                }).then(res => res.json()).then(res => {
                    console.log(res)
                    if (res.status == 200) {
                        // 这里的res.data.data的形式是根据后台存储的形式来调用的
                        this.infoForm = res.data.data
                        window.localStorage.setItem('info', JSON.stringify(this.infoForm))
                        // 刷新本页面
                        this.$router.go(0)
                    }
                })
            },
            handleRemove(file, fileList) {
                console.log(file, fileList)
            },
            handlePictureCardPreview(file) {
                console.log(file)
                this.dialogImageUrl = file.url
                this.dialogVisible = true
            },
            beforeAvatarUpload(file) {
                // 图片上传之前的方法，这些都是element-ui里封装的方法
                // 直接拿过来使用就好
                this.infoForm.headpic = file.name
                const isJPG = file.type === 'image/jpeg'
                const isLt2M = file.size / 1024 / 1024 < 2

                if (!isJPG) {
                    this.$message.error('上传头像图片只能是 JPG 格式!')
                }
                if (!isLt2M) {
                    this.$message.error('上传头像图片大小不能超过 2MB!')
                }
                return isJPG && isLt2M
            },
            submitUpload() {
                // 手动上传头像
                this.$refs.upload.submit()
                let success = false
                if (!success) {
                    this.$message({
                        message: '修改成功',
                        type: 'success'
                    })
                    this.show = false
                } else {
                    this.$message({
                        message: '修改失败,请检查网络状况',
                        type: 'error'
                    })
                }
            },
            showBox() {
                // 修改头像弹框
                this.show = !this.show
            },
            reset() {
                // 重置
                this.infoForm.nickname = ''
                this.infoForm.tel = ''
            }
        },
        mounted() {
            // 这里是在挂载完成之后直接将localStorage的内容更新
            // 简单粗暴还挺有用
            let infomation = JSON.parse(window.localStorage.getItem('info'))
            this.infoForm = infomation
        }
    }
</script>

<style scoped>
    * {
        margin: 0;
        padding: 0;
    }
</style>

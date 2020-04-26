import { Toast } from "mint-ui";
import uploader from "../../../src/components/bbs/app/post/upload";

export default {
    name: "DynamicCreate",
    data() {
        return {
            dynamicContent: "", //动态内容
            imgList: [], //已上传的图片集合
            FilecodeList: [],
            isSubmit: false
        };
    },
    methods: {
        getImageList(files) {
            this.$nextTick(() => {
                for (let i = 0, len = files.length; i < len; i++) {
                    this.imgList.push(files[i].src.split("base64,")[1]);
                    //上传图片
                    //   this._getFileCode({
                    //     Base64Str: files[i].src.split("base64,")[1],
                    //     AttachmentType: this.$enums.AttachmentType.Activity
                    //   });
                }
            });
        },
        //删除图片
        removeImage(index) {
            this.imgList.splice(index, 1);
        },

        //上传图片获取fileCode (目前该方法没调用，供参考)
        _getFileCode(obj) {
            // Indicator.open(this.lang.dynamic_publishing);
            this.$http
                .post(this.$profileApi.Shared_UploadImage, obj)
                .then(data => {
                    if (data.Rstatus) {
                        this.FilecodeList.push(data.Rdata);
                    } else {
                        // Toast(this.lang.dynamic_upload_fail);
                    }
                })
                .catch(err => {
                    console.log(err);
                    //   Toast(this.lang.dynamic.dynamic_net_error);
                });
        },

        //创建动态 (发布动态的请求)
        createDynamic(arr) {
            this.isSubmit = true;
            this.$http
                .post(this.$profileApi.Dynamic_CreateDynamic, {
                    Subject: this.dynamicContent,
                    Files: arr
                })
                .then(data => {
                    this.isSubmit = false;
                    if (data.Rstatus) {
                        // Toast(this.lang.dynamic_publish_ok);
                        this.$router.back();
                    } else {
                        // Toast(this.lang.dynamic_publish_fail);
                    }
                })
                .catch(err => {
                    console.log(err);
                    //   Toast(this.lang.dynamic_net_error);
                });
        },

        //发布事件
        send() {
            Toast("提交信息在控制台里～图片地址是压缩后的base64地址");
            console.log("内容" + this.dynamicContent);
            console.log(this.imgList);

            //   if (this.dynamicContent.trim() == "" && this.imgList.length === 0) {
            //     // Toast(this.lang.dynamic_content_no_null);
            //     return;
            //   }
            //   //当图片还没上传成功
            //   let self = this;
            //   var timer = setInterval(function() {
            //     if (
            //       self.FilecodeList &&
            //       self.imgList &&
            //       self.FilecodeList.length < self.imgList.length
            //     ) {
            //       // Indicator.open(self.lang.dynamic_uploading)
            //       self.isSubmit = true;
            //     } else {
            //       clearInterval(timer);
            //       // Indicator.close();
            //       self.createDynamic(self.FilecodeList);
            //     }
            //   }, 200);
        }
    },
    components: {
        uploader
    }
};
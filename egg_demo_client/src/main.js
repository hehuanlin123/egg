import Vue from 'vue'
import App from './App.vue'
import router from './router/router'
import {Button, Cell, CellGroup, Field, List, Toast, Uploader} from 'vant';
import ElementUI, {Loading, Message} from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import Antd from 'ant-design-vue';
import 'ant-design-vue/dist/antd.less';

import "bootstrap/dist/css/bootstrap.min.css";
import "../src/assets/css/detail.css";
import "../src/assets/css/reset.css";
import "../src/assets/css/font.css";

import store from './store' //引入状态管理 store
import Mint from 'mint-ui';
import 'mint-ui/lib/style.css';

import axios from 'axios'
import qs from 'qs.js'
Vue.prototype.$axios = axios;   //全局注册，使用方法为:this.$axios
Vue.prototype.qs = qs;           //全局注册，使用方法为:this.qs

var VueFire = require("vuefire");

Vue.use(Mint);
Vue.use(Message);
//在APP组件引入vant的组件库
Vue.use(Uploader);
Vue.use(Field);
Vue.use(CellGroup);
Vue.use(Button);
Vue.use(List);
Vue.use(Cell);
Vue.use(Toast);

//在PC端引入element组件库
Vue.use(ElementUI);
// Vue.use(Element, { size: 'small', zIndex: 3000 });

Vue.use(Antd);

Vue.prototype.$message = Message

Vue.config.productionTip = false

//需要使用use将Vuefire引用到Vue环境中
Vue.use(VueFire);

Vue.use(Loading);

//声明加载遮罩层方法
Vue.prototype.openLoading = function () {
    const loading = this.$loading({           // 声明一个loading对象
        lock: true,                             // 是否锁屏
        text: '拼命加载中...',                     // 加载动画的文字
        background: 'rgba(0, 0, 0, 0.7)',       // 背景颜色
        body: true,
        target: document.body,
        customClass: 'mask'                     // 遮罩层新增类名
    })
    setTimeout(function () {                  // 设定定时器，超时5S后自动关闭遮罩层，避免请求失败时，遮罩层一直存在的问题
        loading.close();                        // 关闭遮罩层
    }, 5000)
    return loading;
}

Vue.prototype.getPraiseCount = function (id) {
    const data = {
        post_id: id
    };
    fetch('/bbsdev/getPostPraise', {
        method: 'post',
        headers: {
            'Content-type': 'application/json',
        },
        body: JSON.stringify(data)
    }).then(res => res.json()).then(res => {
        console.log(res);
        if (res.status == 200) {
            // 获取文章点赞数
            if (res.data.result) {
                let praise = res.data.result.length;
                console.log("====737388euueyuy7373ey3ue77===  " + res.data.result.length);
                // 更新文章点赞数
                const data1 = {
                    post_id: id,
                    praise_count: praise,
                };
                fetch('/bbsdev/updateArticle', {
                    method: 'post',
                    headers: {
                        'Content-type': 'application/json',
                    },
                    body: JSON.stringify(data1)
                }).then(res => res.json()).then(res => {
                    console.log(res)
                    if (res.status == 200) {
                        // 获取资源数据
                        if (res.data) {
                            console.log(res.data);
                        }
                    } else {
                        this.$message({
                            showClose: true,
                            message: '更新资源信息失败',
                            type: 'error'
                        });
                    }
                })
                return praise;
            }
        } else {
            this.$message({
                showClose: true,
                message: '获取文章点赞数失败',
                type: 'error'
            });
        }
    })
}

Vue.prototype.getCommentReplyCount = function (id) {
    const data = {
        post_id: id
    };
    fetch('/bbsdev/getPostCommentCount', {
        method: 'post',
        headers: {
            'Content-type': 'application/json',
        },
        body: JSON.stringify(data)
    }).then(res1 => res1.json()).then(res1 => {
        console.log(res1)
        if (res1.status == 200) {
            // 获取文章评论数
            if (res1.data) {
                fetch('/bbsdev/getPostReplyCount', {
                    method: 'post',
                    headers: {
                        'Content-type': 'application/json',
                    },
                    body: JSON.stringify(data)
                }).then(res2 => res2.json()).then(res2 => {
                    console.log(res2)
                    if (res2.status == 200) {
                        // 获取文章回复数
                        if (res2.data) {
                            let commentReply = res1.data.length + res2.data.length;
                            // 更新文章评论数
                            const data1 = {
                                post_id: id,
                                comment_count: commentReply,
                            };
                            fetch('/bbsdev/updateArticle', {
                                method: 'post',
                                headers: {
                                    'Content-type': 'application/json',
                                },
                                body: JSON.stringify(data1)
                            }).then(res => res.json()).then(res => {
                                console.log(res)
                                if (res.status == 200) {
                                    // 获取资源数据
                                    if (res.data) {
                                        console.log(res.data);
                                    }
                                } else {
                                    this.$message({
                                        showClose: true,
                                        message: '更新资源信息失败',
                                        type: 'error'
                                    });
                                }
                            })
                            return commentReply;
                        }
                    } else {
                        this.$message({
                            showClose: true,
                            message: '获取文章回复数失败',
                            type: 'error'
                        });
                    }
                })
            }
        } else {
            this.$message({
                showClose: true,
                message: '获取文章评论数失败',
                type: 'error'
            });
        }
    })
}

Vue.prototype.imageToBase64 = function (file) {
    var reader = new FileReader()
    reader.readAsDataURL(file)
    reader.onload = () => {
        console.log('file 转 base64结果：' + reader.result)
        this.iconBase64 = reader.result
    }
    reader.onerror = function (error) {
        console.log('Error: ', error)
    }
}

new Vue({
    router,
    store,//注册store(这可以把 store 的实例注入所有的子组件)
    render: h => h(App),
}).$mount('#app')

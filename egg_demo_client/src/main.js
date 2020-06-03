import Vue from 'vue'
import App from './App.vue'
import router from './router/router'
import {Button, Cell, CellGroup, Field, List, Toast, Uploader} from 'vant';
import ElementUI, {Message} from 'element-ui';
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

import { Loading } from 'element-ui'

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
Vue.prototype.openLoading = function() {
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
    },5000)
    return loading;
}

new Vue({
    router,
    store,//注册store(这可以把 store 的实例注入所有的子组件)
    render: h => h(App),
}).$mount('#app')

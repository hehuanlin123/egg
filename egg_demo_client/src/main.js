import Vue from 'vue'
import App from './App.vue'
import router from './router/router'
import { Uploader,Field,CellGroup,Button,List,Cell,Toast } from 'vant';
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import Antd from 'ant-design-vue';
import 'ant-design-vue/dist/antd.css';

import { Message } from 'element-ui';

import "bootstrap/dist/css/bootstrap.min.css";
import "../src/assets/css/detail.css";
import "../src/assets/css/reset.css";
import "../src/assets/css/font.css";

import store from './store' //引入状态管理 store

import Mint from 'mint-ui';
import 'mint-ui/lib/style.css';

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

new Vue({
  router,
  store,//注册store(这可以把 store 的实例注入所有的子组件)
  render: h => h(App),
}).$mount('#app')

import Vue from 'vue'
import App from './App.vue'
import router from './router/router'
import { Uploader,Field,CellGroup,Button,List,Cell,Toast } from 'vant';
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import Antd from 'ant-design-vue';
import 'ant-design-vue/dist/antd.css';

import { Message } from 'element-ui';

Vue.use(Message)

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
  render: h => h(App),
}).$mount('#app')

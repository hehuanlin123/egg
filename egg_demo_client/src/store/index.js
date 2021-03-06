import Vue from 'vue';
import Vuex from 'vuex'; //引入 vuex

import article from './modules/article';

Vue.use(Vuex); //使用 vuex

const state = {}
const actions = {}
const mutations = {}
const store = new Vuex.Store({
  modules: {
    article
  },
  actions,
  state,
  mutations,
})
export default store;
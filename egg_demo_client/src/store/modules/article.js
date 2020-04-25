// initial state
const state = {
    articlelist: [],
    plate: ""
  }
  
  const getters = {}
  
  const actions = {}
  
  const mutations = {
    getarticlelist(state, value) {
      state.articlelist = value;
    },
    getplate(state, value) {
      state.plate = value;
    }
  }
  
  export default {
    namespaced: true,
    state,
    getters,
    actions,
    mutations
  }
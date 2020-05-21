// initial state
const state = {
    firebaseconfig: {
        apiKey: "AIzaSyAtPlu-CFtSIK8qm8yX-35D5spRTjgeppk",
        authDomain: "bbsdemo-db7da.firebaseapp.com",
        databaseURL: "https://bbsdemo-db7da.firebaseio.com",
        projectId: "bbsdemo-db7da",
        storageBucket: "bbsdemo-db7da.appspot.com",
        messagingSenderId: "509144997691",
        appId: "1:509144997691:web:23d0710e8f6d7f9032211e",
        measurementId: "G-126RVPGY90"
    }
}

const getters = {}

const actions = {}

const mutations = {
    getfirebaseconfig(state, value) {
        state.firebaseconfig = value;
    }
}

export default {
    namespaced: true,
    state,
    getters,
    actions,
    mutations
}
import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const router = new VueRouter({
    mode:'history',
    routes:[
        {
            path:'/demo',
            component:() => import('../views/demo/Home.vue'),
            name:'demo_Home1'
        },
        {
            path:'/demo/home',
            component:() => import('../views/demo/Home.vue'),
            name:'demo_Home2'
        },
        {
            path:'/demo/detail',
            component:() => import('../views/demo/Detail.vue'),
            name:'demo_Detail'
        },
        {
            path:'/demo/add',
            component:() => import('../views/demo/Add.vue'),
            name:'demo_Add'
        },
        {
            path:'/bbs',
            component:() => import('../views/bbs/app/Home.vue'),
            name:'bbs_Home1'
        },
        {
            path:'/bbs/home',
            component:() => import('../views/bbs/app/Home.vue'),
            name:'bbs_Home2'
        },
        {
            path:'/bbs/home_login',
            component:() => import('../views/bbs/app/Home_login.vue'),
            name:'bbs_Home2_login'
        },
        {
            path:'/bbs/detail',
            component:() => import('../views/bbs/app/Detail.vue'),
            name:'bbs_Detail'
        },
        {
            path:'/bbs/login',
            component:() => import('../views/bbs/app/Login.vue'),
            name:'bbs_Login'
        },
        {
            path:'/bbs/mycenter',
            component:() => import('../views/bbs/app/Mycenter.vue'),
            name:'bbs_Post'
        },
        {
            path:'/bbs/post',
            component:() => import('../views/bbs/app/Post.vue'),
            name:'bbs_Post'
        },
        {
            path:'/bbs/register',
            component:() => import('../views/bbs/app/Register.vue'),
            name:'bbs_Register'
        },
        {
            path:'/bbs/setting',
            component:() => import('../views/bbs/app/Setting.vue'),
            name:'bbs_Setting'
        },
    ]
})

export default router;
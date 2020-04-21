<template>
<div>
    <el-tabs class="tabs" type="border-card">
        <el-tab-pane @click="handlenew" label="最新帖子">
            <v-postList :posttype='index'></v-postList>
        </el-tab-pane>
        <!-- <el-tab-pane @click="handletop" label="精华帖子">
            <v-postList :posttype='index'></v-postList>
        </el-tab-pane> -->
        <el-tab-pane @click="handlezan" label="点赞最多">
            <v-postList :posttype='index'></v-postList>
        </el-tab-pane>
        <el-tab-pane @click="handlepin" label="评论最多">
            <v-postList :posttype='index'></v-postList>
        </el-tab-pane>
    </el-tabs>
</div>
</template>

<script>
import {
    List,
    Cell,
    Toast
} from 'vant';
import moment from 'moment';
import postList_login from "./postList_login";

export default {
    name: "navigator",
    comments: {
        [List.name]: List,
        [Cell.name]: Cell,
        [Toast.name]: Toast,
    },
    components: {
        "v-postList": postList_login,
    },
    data() {
        return {
            count: 0,
            loading: false,
            finished: false,
            list: [],
            isShow: [true, false, false, false],
            index: '',
        };
    },
    methods: {
        onLoad() {
            fetch('/article/lists')
                .then(res => res.json())
                .then(res => {
                    if (res.status == 200) {
                        this.loading = false;
                        this.finished = true;
                        this.list = res.data.map(item => {
                            if (item.createTime) {
                                item.createTime = moment(item.createTime).format('YYYY-MM-DD HH:mm:ss');
                            }
                            if (item.img) {
                                //解决静态资源缓存问题
                                item.img += '?randomId =' + Math.random().toString()
                            }
                            return item;
                        });
                    } else {
                        Toast.fail(res.errMsg)
                    }
                })
        },
        handleClick(id) {
            this.$router.push({
                path: '/bbs/detail',
                query: {
                    id
                }
            })
        },
        handlenew() {
            this.index = 1;
        },
        // handletop() {
        //     this.index = 2;
        // },
        handlezan() {
            this.index = 2;
        },
        handlepin() {
            this.index = 3;
        },
    },
    mounted: {

    }
};
</script>

<style scoped>
* {
    margin: 0;
    padding: 0;
}

body,
p {
    margin: 0;
}

.tabs {
    width: 90%;
    position: relative;
    left: 5%;
    margin-top: 10px;
}
</style>

<template>
<div>
    <!--四等分布局-->
    <div class="parent">
        <div class="child">
            <p @click="handlenew">
                <img v-show="!isShow[0]" class="new" src="https://upload-images.jianshu.io/upload_images/7761489-d45d2b35b2387d9e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240" alt="">
                <img v-show="isShow[0]" class="new" src="https://upload-images.jianshu.io/upload_images/7761489-ad4a87f87a195545.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240" alt="">
            </p>
            <p @click="handlenew">最新帖子</p>
        </div>
        <div class="child">
            <p @click="handletop">
                <img v-show="!isShow[1]" class="top" src="https://upload-images.jianshu.io/upload_images/7761489-c641841878b94733.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240" alt="">
                <img v-show="isShow[1]" class="top" src="https://upload-images.jianshu.io/upload_images/7761489-c8082f145f4f32d1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240" alt="">
            </p>
            <p>精华帖子</p>
        </div>
        <div class="child">
            <p @click="handletop">
                <img v-show="!isShow[2]" class="zan" src="https://upload-images.jianshu.io/upload_images/7761489-831cb984c30e4602.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240" alt="">
                <img v-show="isShow[2]" class="zan" src="https://upload-images.jianshu.io/upload_images/7761489-ab591505002a5861.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240" alt="">
            </p>
            <p>点赞最多</p>
        </div>
        <div class="child" @click="handlepin">
            <p @click="handletop">
                <img v-show="!isShow[3]" class="pin" src="https://upload-images.jianshu.io/upload_images/7761489-462e3b37ebc907e5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240" alt="">
                <img v-show="isShow[3]" class="pin" src="https://upload-images.jianshu.io/upload_images/7761489-5d4cd8993c0d8089.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240" alt="">
            </p>
            <p>评论最多</p>
        </div>
    </div>
    <!--四等分布局-->
    <!-- 列表 -->
    <v-postList></v-postList>
</div>
</template>

<script>
import {
    List,
    Cell,
    Toast
} from 'vant';
import moment from 'moment';
import postList from "./postList";

export default {
    name: "navigator",
    comments: {
        [List.name]: List,
        [Cell.name]: Cell,
        [Toast.name]: Toast,
    },
    components: {
        "v-postList": postList,
    },
    data() {
        return {
            count: 0,
            loading: false,
            finished: false,
            list: [],
            isShow: [true, false, false, false],
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
            this.isShow[0] = !this.isShow[0];
        },
        handletop() {
            this.isShow[1] = !this.isShow[1];
        },
        handlezan() {
            this.isShow[2] = !this.isShow[2];
        },
        handlepin() {
            this.isShow[3] = !this.isShow[3];
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

.parent {
    display: flex;
    background: #eee;
    color: #000000;
    height: 100%;
    width: 90%;
    position: relative;
    left: 5%;
    margin-bottom: 10px;
    margin-top: 10px;
}

.child {
    flex: 1;
    background-color: #ffffff;
}

.child+.child {
    margin-left: 20px;
}

img {
    width: 20px;
    height: auto;
}
</style>

<template>
    <div>
        <!--四等分布局-->
        <div class="parent" style="background-color: lightgrey;">
            <div class="child" style="background-color: lightblue;">
                <p>icon</p>
                <p>最新帖子</p>
            </div>
            <div class="child" style="background-color: lightgreen;">
                <p>icon</p>
                <p>精华帖子</p>
            </div>
            <div class="child" style="background-color: lightsalmon;">
                <p>icon</p>
                <p>点赞最多</p>
            </div>
            <div class="child" style="background-color: pink;">
                <p>icon</p>
                <p>评论最多</p>
            </div>
        </div>
        <!--四等分布局-->
        <!-- 列表 -->
        <v-postList></v-postList>
    </div>
</template>

<script>
    import {List, Cell, Toast} from 'vant';
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
            };
        },
        methods: {
            load() {//无限滚动
                this.count += 2
            },
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
        },
        mounted: {}
    };
</script>

<style scoped>
    * {
        margin: 0;
        padding: 0;
    }

    body, p {
        margin: 0;
    }

    .parent {
        display: flex;
    }

    .child {
        flex: 1;
        height: 100px;
    }

    .child + .child {
        margin-left: 20px;
    }
</style>

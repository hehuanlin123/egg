<template>
<!-- 三栏布局 flex布局-->
<div class="layout">
    <div class="left">
        <span>Python论坛</span>
    </div>
    <div class="center">
        <ul>
            <li v-for="list in headerList" :key="list.id">
                <!--              <a href="#">-->
                <!--                {{ list.title }}-->
                <!--              </a>-->
                <el-link type="primary" href="#">{{ list.title }}</el-link>
            </li>
        </ul>
    </div>
    <div class="right">
        <span>
            取消
            <el-button class="btn" type="primary">确定</el-button>
        </span>
    </div>
</div>
<!-- 三栏布局 flex布局-->
</template>

<script>
export default {
    name: 'headerone',
    data() {
        return {
            headerList: [{
                id: '1',
                name: 'Post',
                title: '写文章'
            }, ],
            isShow: false
        }
    }
}
</script>

<style scoped>
* {
    margin: 0;
    padding: 0;
    font-size: 15px;
    color: #ffffff;
}

.layout {
    background: #3d444c;
    text-align: center;
    height: 100%;
    display: flex;
    align-items: center;
}

.layout .left {
    width: 200px;
    height: 50px;
    text-align: left;
    padding-left: 1%;
    padding-top: 10px;
}

.layout .right {
    width: 100%;
    height: 50px;
    text-align: right;
    padding-right: 1%;
    padding-top: 10px;
}

.layout .center {
    width: 200px;
    height: 50px;
    text-align: left;
    padding-left: 1%;
    background-color: #31363d;
    padding-top: 10px;
}

.layout .right .search {
    position: relative;
    left: -30%;
    color: #fff;
    background: #31363e;
    padding: 5px;
    width: 25%;
    text-align: left;
}
.btn {
    margin-left: 20px;
    width: 80px;
    height: 30px;
    background-color: #1890ff;
}
</style>

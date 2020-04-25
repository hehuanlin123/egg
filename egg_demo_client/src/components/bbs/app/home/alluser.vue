<template>
<div class="last_box">
    <!-- <p class="title">板块</p> -->
    <a-list size="small" bordered :dataSource="data">
        <a-list-item slot="renderItem" slot-scope="item">
            <a-row :align="middle">
                <a-col :span="8">
                    <el-avatar :src="item.headlink"></el-avatar>
                </a-col>
                <a-col :span="8">{{ item.name }}</a-col>
                <a-col :span="8">
                    <el-button id="alluseradd" type="primary">查看</el-button>
                </a-col>
            </a-row>
            <!-- <el-avatar :src="item.headlink"></el-avatar>
            {{ item.name }}
            <el-button type="primary">+ 关注</el-button> -->
        </a-list-item>
        <div class="user-list-header" slot="header"><b>推荐用户</b></div>
        <div class="more" slot="footer">查看全部</div>
    </a-list>
</div>
</template>

<script>
const data = [{
        name: "0324wybh",
        headlink: "https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png"
    },
    {
        name: "Hello猫博士",
        headlink: "https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png"
    },
    {
        name: "J.Sun0210",
        headlink: "https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png"
    }
];
export default {
    name: "alluser",
    data() {
        return {
            data,
        };
    },
    methods: {

    },
    created() {},
    mounted() {},
};
</script>

<style scoped>
* {
    margin: 0;
    padding: 0;
}

.last_box {
    margin-top: 30px;
    background-color: #ffffff;
}

.title {
    margin-bottom: '16px';
    font-size: '20px';
}

.tip {
    min-width: 26px;
    height: 26px;
    background: red;
    box-sizing: border-box;
    color: #ffffff;
    font-size: 10px;
    text-align: center;
    line-height: 26px;
    padding: 0 5px;
    border-radius: 13px;
    display: inline-block;
    position: absolute;
    right: 10px;
}

.el-btn {
    color: #fff;
    background-color: #1890ff;
    border-color: #1890ff;
    text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.12);
    -webkit-box-shadow: 0 2px 0 rgba(0, 0, 0, 0.045);
    box-shadow: 0 2px 0 rgba(0, 0, 0, 0.045);
    height: 32px;
    width: 194.92px;
}

.more {
    background-color: #eee;
}

.ant-row {
    display: flex;
    align-items: center;
}

#alluseradd {
    margin-left: 20px;
    width: 50px;
    height: 30px;
    /* visibility: hidden; */
}

/* .user-list-header {
    background-color: #f1f9f8;
} */
</style>

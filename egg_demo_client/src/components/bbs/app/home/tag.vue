<template>
<div>
    <div class="top_btn">
        <a-button @click="handlePost" type="primary" block>发表新帖子</a-button>
    </div>
    <div class="middle_btn">
        <el-popover placement="bottom" title="打卡成功！" width="200" trigger="manual" :content=content v-model="visible">
            <!-- <a-button @click="handlePost" type="primary" block><el-button slot="reference" @click="visible = !visible">签到</el-button></a-button> -->
            <el-button class="el-btn" slot="reference" @click="handlePost">签到</el-button>
        </el-popover>
    </div>
    <!-- <div class="last_box"> -->
    <!-- <p class="title">板块</p> -->
    <!-- <a-list size="small" bordered :dataSource="data">
            <a-list-item slot="renderItem" slot-scope="item">
                {{ item.name }}
                <div class="tip">{{ item.count }}</div>
            </a-list-item>
            <div slot="header">我的版块</div> -->
    <!-- <div slot="footer">Footer</div> -->
    <!-- </a-list> -->
    <!-- </div> -->

</div>
</template>

<script>
const data = [{
        name: "所有版块",
        count: ""
    },
    {
        name: "Python",
        count: ""
    },
    {
        name: "Java",
        count: ""
    },
    {
        name: "意见箱",
        count: ""
    },
    {
        name: "Web",
        count: ""
    },
    {
        name: "Linux",
        count: ""
    },
    {
        name: "Redis",
        count: ""
    },
    {
        name: "灌水区",
        count: ""
    }
];
export default {
    name: "tag",
    data() {
        return {
            data,
            visible: false,
            content: '你已打卡 1 天',
            days: '100',
        };
    },
    methods: {
        handlePost() {
            this.$message({
                showClose: true,
                message: '请先登录！',
                type: 'error'
            });
        },
        initDays(){
            this.content = this.content + `<span style="color:blue;">` 
            + this.days + `</span>` + '天'
        }
    },
    created(){
        this.initDays;
    },
    mounted(){
        this.initDays;
    },
};
</script>

<style scoped>
* {
    margin: 0;
    padding: 0;
}

.top_btn {
    margin-top: 10px;
}

.middle_btn {
    margin-top: 20px;
}


.last_box {
    margin-top: 30px;
    background-color: #ffffff;
}

.title {
    margin-bottom: '16px';
    font-size: '20px';
}

/* .tip {
    min-width: 26px;
    height: 26px;
    background:red;
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
} */

.el-btn{
    color: #fff;
    background-color: #1890ff;
    border-color: #1890ff;
    text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.12);
    -webkit-box-shadow: 0 2px 0 rgba(0, 0, 0, 0.045);
    box-shadow: 0 2px 0 rgba(0, 0, 0, 0.045);
    height: 32px;
    width: 194.92px;
}

</style>

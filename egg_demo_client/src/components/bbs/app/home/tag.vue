<template>
<div>
    <div class="top_btn">
        <a-button @click="handlePost" type="primary" block>发布资源</a-button>
    </div>
    <div class="middle_btn">
        <el-popover placement="bottom" title="打卡成功！" width="200" trigger="manual" :content=content v-model="visible">
            <!-- <a-button @click="handlePost" type="primary" block><el-button slot="reference" @click="visible = !visible">签到</el-button></a-button> -->
            <el-button class="el-btn" slot="reference" @click="handlePost">签到</el-button>
        </el-popover>
    </div>
    <div class="last_box">
        <!-- <p class="title">板块</p> -->
        <a-list size="small" bordered :dataSource="data">
            <a-list-item :msg="count" @click="handleclick(item.name)" class="itemcontainer" slot="renderItem" slot-scope="item">
                <span>{{ item.name }}</span>
                <span style="margin-left:20px;color: gray;">{{ item.time }}</span>
                <span style="margin-left:10px;color: gray;"><i class="el-icon-view"></i>{{ item.count }}</span>
                <!-- <div class="tip">{{ item.count }}</div> -->
            </a-list-item>
            <div style="text-align:left;" class="plate-list-header" slot="header"><span class="dot"></span><b>热门资源</b></div>
            <!-- <div class="more" slot="footer">查看全部</div> -->
        </a-list>
    </div>
</div>
</template>

<script>
const data = [{
        name: "Inline JavaScript is not enabled. Is it set in your options?",
        time: "2020-05-12",
        count: "8736"
    },
    {
        name: "Inline JavaScript is not enabled",
        time: "2020-05-12",
        count: "530"
    },
    {
        name: "bezierEasingMixin(); Inline JavaScript is not enabled. Is it set in your options?",
        time: "2020-05-12",
        count: "8736"
    },
    {
        name: "Inline JavaScript is not enabled",
        time: "2020-05-12",
        count: "8736"
    },
    {
        name: "bezierEasingMixin(); Inline JavaScript is not enabled. Is it set in your options?",
        time: "2020-05-12",
        count: "8736"
    },
    {
        name: "Inline JavaScript is not enabled",
        time: "2020-05-12",
        count: "8736"
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
        handleclick(name) {
            this.platename = name;
            this.$store.commit("article/getplate", this.platename);
            this.$store.commit("article/getarticlelist", this.$store.state.article.articlelist.filter(item => {
                return item.plate === this.platename;
            }));
            console.log(this.$store.state.article.plate);
            console.log(this.$store.state.article.articlelist.toString()); //undefine
        },
        handlePost() {
            this.$message({
                showClose: true,
                message: '请先登录！',
                type: 'error'
            });
        },
        initDays() {
            this.content = this.content + `<span style="color:blue;">` +
                this.days + `</span>` + '天'
        }
    },
    created() {
        this.initDays;
    },
    mounted() {
        this.initDays;
    },
    computed: {
        articlelistData() {
            return this.$store.state.article.articlelist.filter(item => {
                return item.plate = this.platename;
            });
        },
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
    width: 230px;
}

.middle_btn {
    margin-top: 20px;
}

.last_box {
    margin-top: 30px;
    background-color: #ffffff;
    text-align: left;
}

.title {
    margin-bottom: '16px';
    font-size: '20px';
}

.tip {
    min-width: 26px;
    height: 26px;
    background: #999aaa;
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
    width: 230px;
}

.more {
    background-color: #eee;
}

.itemcontainer {
    display: list-item;
}

/* .plate-list-header {
    background-color: #f1f9f8;
} */

.dot {
    background: #ff6547;
    content: "";
    display: inline-block;
    width: 7px;
    height: 7px;
    margin-right: 5px;
    margin-bottom: 2px;
    vertical-align: middle;
}
</style>

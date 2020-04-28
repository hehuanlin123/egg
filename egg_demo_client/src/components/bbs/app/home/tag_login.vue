<template>
<div>
    <div class="top_btn">
        <a-button @click="handlePost" type="primary" block>发表新帖子</a-button>
    </div>
    <div class="middle_btn">
        <el-popover placement="bottom" title="打卡成功！" width="200" trigger="manual" :content=content v-model="visible">
            <!-- <a-button @click="handlePost" type="primary" block><el-button slot="reference" @click="visible = !visible">签到</el-button></a-button> -->
            <el-button class="el-btn" slot="reference" @click="visible = !visible">签到</el-button>
        </el-popover>
    </div>
    <div class="last_box">
        <!-- <p class="title">板块</p> -->
        <a-list size="small" bordered :dataSource="data">
            <a-list-item :msg="count" @click="handleclick(item.name)" class="itemcontainer" slot="renderItem" slot-scope="item">
                {{ item.name }}
                <!-- <div class="tip">{{ item.count }}</div> -->
            </a-list-item>
            <div style="text-align:center;" class="plate-list-header" slot="header"><span class="dot"></span><b>推荐版块</b></div>
            <div class="more" slot="footer">查看全部</div>
        </a-list>
    </div>
</div>
</template>

<script>
const data = [{
        name: "程序人生",
        count: "23"
    },
    {
        name: "Python",
        count: "11"
    },
    {
        name: "Java",
        count: "56"
    },
    {
        name: "前端",
        count: "34"
    },
    {
        name: "架构",
        count: "21"
    },
    {
        name: "区块链",
        count: "9"
    },
    {
        name: "数据库",
        count: "50"
    },
    {
        name: "5G",
        count: "23"
    },
    {
        name: "游戏开发",
        count: "12"
    },
    {
        name: "移动开发",
        count: "45"
    },
    {
        name: "云计算大数据",
        count: "23"
    },
    {
        name: "运维",
        count: "12"
    },
    {
        name: "安全",
        count: "23"
    },
    {
        name: "研发管理",
        count: "33"
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
            articlelist: [],
            platename: '',
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
            console.log("====" + this.$store.state.article.articlelist.toString()); //undefine
        },
        handlePost() {
            this.$router.push({
                path: '/bbs/post'
            });
        },
        initDays() {
            this.content = this.content + `<span style="color:blue;">` +
                this.days + `</span>` + '天'
        },
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

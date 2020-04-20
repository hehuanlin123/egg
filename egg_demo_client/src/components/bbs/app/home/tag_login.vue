<template>
<div>
    <div class="top_btn">
        <a-button @click="handlePost" type="primary" block>发表新帖子</a-button>
    </div>
    <div class="middle_btn">
        <a-button @click="handleOnsite" type="primary" block>签到</a-button>
    </div>
    <div class="last_box">
        <!-- <p class="title">板块</p> -->
        <a-list size="small" bordered :dataSource="data">
            <a-list-item slot="renderItem" slot-scope="item">
                {{ item.name }}
                <div class="tip">{{ item.count }}</div>
            </a-list-item>
            <div slot="header">我的版块</div>
            <!-- <div slot="footer">Footer</div> -->
        </a-list>
    </div>
</div>
</template>

<script>
const data = [{name:"所有版块",count:"51"},
{name:"Python",count:"10"},
{name:"Java",count:"5"},
{name:"意见箱",count:"7"},
{name:"Web",count:"22"},
{name:"Linux",count:"1"},
{name:"Redis",count:"0"},
{name:"灌水区",count:"6"}
];
export default {
    name: "tag",
    data() {
        return {
            data,
        };
    },
    methods: {
        handlePost(){
            this.$router.push({path:'/bbs/post'});
        },
        handleOnsite(){
            
        }
    },
    mounted: {}
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

.tip {
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
}
</style>

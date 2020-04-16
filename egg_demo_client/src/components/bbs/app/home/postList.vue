<template>
<a-list itemLayout="vertical" size="large" :pagination="pagination" :dataSource="listData">
    <div slot="footer"><b>ant design vue</b> footer part</div>
    <a-list-item slot="renderItem" slot-scope="item" key="item.title">
        <template slot="actions" v-for="{ type, text } in actions">
            <span :key="type">
                <a-icon :type="type" style="margin-right: 8px" />
                {{ text }}
            </span>
        </template>
        <img class="logo" slot="extra" width="272" alt="logo" src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1587057993978&di=0604ac9d947fab215f8f0eaf82690035&imgtype=0&src=http%3A%2F%2Fku.90sjimg.com%2Felement_origin_min_pic%2F00%2F05%2F45%2F66568f439ec3544.jpg" />
        <a-list-item-meta :description="item.description">
            <a slot="title" :href="item.href">{{ item.title }}</a>
            <a-avatar slot="avatar" :src="item.avatar" />
        </a-list-item-meta>
        {{ item.content }}
    </a-list-item>
</a-list>
</template>

<script>
export default {
    name: "postList",
    data() {
        return {
            listData: [],
            pagination: {
                onChange: page => {
                    console.log(page);
                },
                pageSize: 3,
            },
            actions: [{
                    type: 'star-o',
                    text: '156'
                },
                {
                    type: 'like-o',
                    text: '156'
                },
                {
                    type: 'message',
                    text: '2'
                },
            ],
        };
    },
    methods: {
        getData() {
            const listData1 = this.listData;
            for (let i = 0; i < 23; i++) {
                listData1.push({
                    href: 'https://www.antdv.com/',
                    title: `帖子 ${i}`,
                    avatar: 'https://zos.alipayobjects.com/rmsportal/ODTLcjxAfvqbxHnVXCYX.png',
                    description: '学习python',
                    content: 'python flask django sklearn jupyter',
                });
            }
        }
    },
    mounted() {
        this.getData()
    }
};
</script>

<style>
* {
    padding: 0;
    margin: 0;
}

.logo {
    height: 100px;
    width: auto;
}
</style>

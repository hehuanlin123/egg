<template>
<!-- 三栏布局 flex布局-->
    <div class="layout">
      <main>
        <div class="left">Python论坛</div>
        <div class="center">
            <ul>
            <li v-for="list in headerList" :key="list.id">
              <a href="#">
                {{ list.title }}
              </a>
            </li>
          </ul></div>
        <div class="right">
            <span class="login">登录</span>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <span class="reg">注册</span></div>
      </main>
    </div>
    <!-- 三栏布局 flex布局-->
</template>

<script>
  export default {
    name: 'headerone',
    data() {
      return {
        headerList: [
          {id: '1', name: 'Home', title: '首页'},
        ],
        isShow: false
      }
    }
  }
</script>

<style scoped>
* {
  margin: 0;
  padding: 0;
  font-size: 10px;
}
.layout {
  color: white;
  text-align: center;
  height: 100%;
  overflow: hidden;
}
.layout main {
  width: 100%;
  height: 100%;
  background:darkkhaki;
  display: flex;
  justify-content: space-between;
}
.layout main .left {
  width: 200px;
  height: 30px;
  background:forestgreen;
  text-align: left;
  padding-left: 1%;
  padding-top: 15px;
}
.layout main .right {
  width: 100%;
  height: 30px;
  background:forestgreen;
  text-align: right;
  padding-right: 1%;
  padding-top: 15px;
}
.layout main .center {
  width: 200px;
  height: 30px;
  background:gold;
  text-align: left;
  padding-left: 1%;
  padding-top: 15px;
}
</style>
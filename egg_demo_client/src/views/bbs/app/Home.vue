<template>
  <div>
    <v-headerone></v-headerone>
    <v-headertwo></v-headertwo>
    <!-- 三栏布局 flex布局-->
    <div class="layout">
      <main>
        <div class="left">左边栏</div>
        <div class="center">中间栏</div>
        <div class="right">右边栏</div>
      </main>
      <footer>底部</footer>
    </div>
    <!-- 三栏布局 flex布局-->
  </div>
</template>

<script>
import headerone from "../../../components/bbs/app/public/headerone";
import headertwo from "../../../components/bbs/app/public/headertwo";

export default {
  name: "Home",
  components: {
    "v-headerone": headerone,
    "v-headertwo": headertwo
  },
  data() {
    return {};
  },
  methods: {},
  mounted: {}
};
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
.layout footer {
  width: 100%;
  height: 50px;
  background: #ca8402;
  text-align: center;
}
.layout footer {
  position: absolute;
  bottom: 0;
}
.layout main {
  width: 100%;
  height: 100%;
  background: red;
  display: flex;
  justify-content: space-between;
}
.layout main .left,
.layout main .right {
  width: 300px;
  height: 100%;
  background: #129da7;
}
.layout main .center {
  width: 100%;
  height: 100%;
  background: blue;
}
</style>
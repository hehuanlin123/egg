//upload.vue
<!--
Description 图片上传
@authors Benny
@date    2018-05-08 12:57:08
@version 1.0.0
-->
<template>
    <div id="imgUploader">
        <div class="file-list">
            <!-- <section class="file-item draggable-item" v-for="(item,index) in files" :key="index"> -->
            <div class="thumbnails my-gallery">
                <figure itemprop="associatedMedia" itemscope  class="thumbnail" v-for="(item,index) in files" :key="index">
                    <a :href="item.src" itemprop="contentUrl" data-size="400x400" class="img-wrapper">
                        <img :src="item.src" itemprop="thumbnail"  />
                        <!-- <div :style="{background:'url('+item.src+')  no-repeat',  backgroundPosition:'center center',backgroundSize:'cover'}" style="width:100%;height:110px;" itemprop="thumbnail"></div> -->
                    </a>
                    <span class="file-remove" @click="remove(index,$event)">×</span>
                </figure>
                <section class="thumbnail" v-if="this.files.length < 9">
                    <div class="add">
                        <span>+</span>
                        <!-- accept="image/jpeg,image/png" capture="camera" -->
                        <input type="file" @change="selectImgs()" multiple accept="image/*" ref="file">
                    </div>
                </section>
            </div>
            <!-- <img :src="item.src" alt="" ondragstart="return false;">
            <span class="file-remove" @click="remove(index)">×</span> -->
            <!-- </section> -->
            <!-- PhotoSwipe插件需要的元素， 一定要有类名 pswp -->
            <div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="pswp__bg"></div>
                <div class="pswp__scroll-wrap">
                    <div class="pswp__container">
                        <div class="pswp__item"></div>
                        <div class="pswp__item"></div>
                        <div class="pswp__item"></div>
                    </div>
                    <!-- 预览区域顶部的默认UI，可以修改 -->
                    <div class="pswp__ui pswp__ui--hidden">
                        <div class="pswp__top-bar">
                            <!--  与图片相关的操作 -->
                            <div class="pswp__counter"></div>
                            <button class="pswp__button pswp__button--close" title="Close (Esc)"></button>
                            <!--将分享按钮去掉 -->
                            <!-- <button class="pswp__button pswp__button--share" title="Share"></button>
                            <button class="pswp__button pswp__button--fs" title="Toggle fullscreen"></button>
                            <button class="pswp__button pswp__button--zoom" title="Zoom in/out"></button> -->
                            <div class="pswp__preloader">
                                <div class="pswp__preloader__icn">
                                    <div class="pswp__preloader__cut">
                                        <div class="pswp__preloader__donut"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
                            <div class="pswp__share-tooltip"></div>
                        </div>
                        <button class="pswp__button pswp__button--arrow--left" title="Previous (arrow left)"></button>
                        <button class="pswp__button pswp__button--arrow--right" title="Next (arrow right)"></button>
                        <div class="pswp__caption">
                            <div class="pswp__caption__center"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script src='assets/js/upload.js'/>
<style src='assets/css/upload.css' lang="css" scoped>

//父组件 create.vue
<!--
Description 发布动态
@authors Benny
@date    2018-04-23 10:31:30
@version 1.0.0
-->
<template>
    <div id="dynamic_create">
        <mt-field  v-model="dynamicContent" :placeholder="lang.dynamic_moments_thought" type="textarea" rows="4" ></mt-field>
        <uploader @getFiles='getImageList' @removeFiles='removeImage'></uploader>
        <div class="btn-wrapper">
            <!-- <mt-button class='btn-send' size="large" type="primary" @click="send">{{this.lang.dynamic_release}}</mt-button> -->
            <load-button :class="isSubmit ? 'text-666 btn-send' : 'bg-blue text-white btn-send'" :loading="isSubmit" @callback="send" :text="lang.dynamic_release"></load-button>
        </div>

    </div>
</template>

<script src='assets/js/create.js'/>
<style src='assets/css/create.css' scoped lang="css"/>
'use strict';

const Controller = require('egg').Controller;
const fs = require('fs');
const path = require('path');
// const awaitWriteStream = require('await-stream-ready').write;
const sendToWormhole = require('stream-wormhole');
const moment = require('moment');

class BBSAttachmentController extends Controller {

  // 发布图片
  async addImageList() {
    const { ctx } = this;
    const params = {
      ...ctx.request.body,
      createTime: moment().format('YYYY-MM-DD HH:mm:ss'),
    };
    const result = await ctx.service.bbsAttachment.addImageList(params);
    if (result) {
      ctx.body = {
        status: 200,
        data: result,
      };
    } else {
      ctx.body = {
        status: 500,
        errMsg: '发布图片失败',
      };
    }
  }

  // 提交图片文件：File方式
  async postImageFileList() {
    const { ctx } = this;
    console.log(ctx.request.body);
    const file1 = ctx.request.files[0];
    // 读取文件
    const file2 = fs.readFileSync(file1.filepath); // files[0]表示获取第一个文件，若前端上传多个文件则可以遍历这个数组对象
    // 将文件存到指定位置
    fs.writeFileSync(path.join('/Users/szkfzx/Desktop/nodespace/egg_demo/egg/egg_demo_server/app/', 'uploadfile/test.png'), file2);
    ctx.cleanupRequestFiles();
    ctx.body = { code: 200, message: '', data: file2.filename };
  }

  // 提交图片文件：Stream流方式（单个）
  async postImageStream() {
    const { ctx } = this;
    const stream = await ctx.getFileStream();
    const filename = new Date().getTime() + stream.filename; // stream对象也包含了文件名，大小等基本信息
    // 创建文件写入路径
    const target = path.join('/Users/szkfzx/Desktop/nodespace/egg_demo/egg/egg_demo_server/app/', `uploadfile/${filename}`);
    const result = await new Promise((resolve, reject) => {
      // 创建文件写入流
      const remoteFileStrem = fs.createWriteStream(target);
      // 以管道方式写入流
      stream.pipe(remoteFileStrem);
      let errFlag;
      // 监听error事件
      remoteFileStrem.on('error', err => {
        errFlag = true;
        // 停止写入
        sendToWormhole(stream);
        remoteFileStrem.destroy();
        console.log(err);
        reject(err);
      });
      // 监听写入完成事件
      remoteFileStrem.on('finish', () => {
        if (errFlag) return;
        resolve({ filename, name: stream.fields.name });
      });
    });
    ctx.body = { code: 200, message: '', data: result };
  }

  // 提交图片文件：Stream流方式（多个）
  async postImageStreamList() {
    const { ctx } = this;
    const parts = ctx.multipart();
    let part;
    while ((part = await parts()) != null) {
      if (part.length) {
        // 处理其他参数
        console.log('field: ' + part[0]);
        console.log('value: ' + part[1]);
        console.log('valueTruncated: ' + part[2]);
        console.log('fieldnameTruncated: ' + part[3]);
      } else {
        if (!part.filename) {
          continue;
        }
        // otherwise, it's a stream
        console.log('field: ' + part.fieldname);
        console.log('filename: ' + part.filename);
        console.log('encoding: ' + part.encoding);
        console.log('mime: ' + part.mime);
        const writePath = path.join('app/', `uploadfile/${new Date().getTime() + part.filename}`);
        const writeStrem = fs.createWriteStream(writePath);
        const result = await part.pipe(writeStrem);
        ctx.body = { code: 200, message: '', data: result };
      }
    }
  }
  // 上传图片
  async uploadImg() {
    const { ctx } = this;
    const stream = await ctx.getFileStream();
    // 文件名:随机数+时间戳+原文件后缀 path.extname(stream.filename).toLocaleLowerCase()为后缀名（.jpg,.png等）
    const filename = Math.random().toString(36).substr(2) + new Date().getTime() + path.extname(stream.filename).toLocaleLowerCase();
    // 图片存放在静态资源public/img文件夹下
    const target = path.join(this.config.baseDir, 'app/public/img', filename);
    // 生成一个文件写入文件流
    const writeStream = fs.createWriteStream(target);
    // 以管道方式写入流
    stream.pipe(writeStream);
    // 监听error事件
    writeStream.on('error', err => {
      // 停止写入
      sendToWormhole(stream);
      writeStream.destroy();
      console.log(err);
      this.ctx.body = {
        code: 500,
        data: filename,
        msg: err,
      };
    });
    // 监听写入完成事件
    writeStream.on('finish', () => {
      const params = {
        post_id: ctx.query.postid,
        uploadTitle: filename,
        uploadFile: stream,
        uploadPath: 'public/img/' + filename,
        createTime: moment().format('YYYY-MM-DD HH:mm:ss'),
      };
      // 写入成功保存文件路径到数据库
      const result = ctx.service.bbsAttachment.upload(params);
      this.ctx.body = {
        code: result.code,
        data: result.data,
        message: result.msg,
      };
    });
    // 前端使用：服务器地址+文件名
    // http://localhost:7001/public/img/filename
  }
}

module.exports = BBSAttachmentController;

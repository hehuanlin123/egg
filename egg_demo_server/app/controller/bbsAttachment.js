'use strict';

const Controller = require('egg').Controller;
const fs = require('fs');
const path = require('path');
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

  // 提交图片文件
  async postImageFileList() {
    const { ctx } = this;
    console.log(ctx.request.body);
    const file1 = ctx.request.files[0];
    // 读取文件
    const file2 = fs.readFileSync(file1.filepath); // files[0]表示获取第一个文件，若前端上传多个文件则可以遍历这个数组对象
    // 将文件存到指定位置
    fs.writeFileSync(path.join('/Users/szkfzx/Desktop/nodespace/egg_demo/egg/egg_demo_server/app/', 'uploadfile/test.png'), file2);
    ctx.cleanupRequestFiles();
  }

}

module.exports = BBSAttachmentController;

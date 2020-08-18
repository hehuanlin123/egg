'use strict';

const Service = require('egg').Service;
const fs = require('fs');
const path = require('path');
class BBSAttachmentService extends Service {

  // 发布图片
  async addImageList(params) {
    const { app } = this;
    try {
      const result = await app.mysql.insert('attachment_info', params);
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }

  // 提交图片文件
  async postImageFileList(file) {
    try {
      const file1 = file;
      // 读取文件
      const file2 = fs.readFileSync(file1.filepath); // files[0]表示获取第一个文件，若前端上传多个文件则可以遍历这个数组对象
      // 将文件存到指定位置
      fs.writeFileSync(path.join('./', 'uploadfile/test.png'), file2);
      return file2.filename;
    } catch (err) {
      console.log(err);
      return null;
    }
  }

}

module.exports = BBSAttachmentService;

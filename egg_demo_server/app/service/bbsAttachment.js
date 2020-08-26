'use strict';

const Service = require('egg').Service;

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

  // 文件上传，接收图片并插入到数据库中
  async upload(params) {
    const { app } = this;
    console.log('333', params);
    const result = await app.mysql.insert('attachment_info', params);
    if (result.affectedRows === 1) {
      const temp_img = await app.mysql.get('attachment_info', {
        id: result.insertId,
      });
      if (temp_img) {
        return result;
      }
    }
  }

}
module.exports = BBSAttachmentService;

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

  // 发布图片文件
  async addImageObjectList(params) {
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
      if (temp_img !== null) {
        this.config.back_data.code = 200;
        this.config.back_data.data = {
          id: temp_img.id,
          uploadTitle: temp_img.uploadTitle,
        };
        this.config.back_data.msg = '上传成功';
      } else {
        this.config.back_data.code = 400;
        this.config.back_data.data = {};
        this.config.back_data.msg = '失败';
      }
    } else {
      this.config.back_data.code = 10000;
      this.config.back_data.data = [];
      this.config.back_data.msg = '上传失败';
    }
    return this.config.back_data;
  }

}

module.exports = BBSAttachmentService;

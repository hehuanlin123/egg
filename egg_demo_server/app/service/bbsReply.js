'use strict';

const Service = require('egg').Service;

class BBSReplyService extends Service {
  // 插入评论信息
  async addCommentInfo(params) {
    const { app } = this;
    try {
      const result = await app.mysql.insert('reply_info', params);
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }

  // 插入回复信息
  async addReplyInfo(params) {
    const { app } = this;
    try {
      const result = await app.mysql.update('reply_info', { content: params.content, is_removed: params.is_removed,
        post_id: params.post_id, author_id: params.author_id, reply: params.reply });
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }

  // 查询回复列表
  async getReplyInfo(params) {
    const { app } = this;
    try {
      const offset = app.toInt(params.pageNum) * app.toInt(params.pageSize) - app.toInt(params.pageSize);
      const limit = app.toInt(params.pageSize);
      const result = await app.mysql.select('reply_info', { // 查询 reply_info 表
        where: { is_removed: '0', author_id: [ '1', '2' ] }, // WHERE 条件
        columns: [ 'id', 'content', 'is_removed', 'author_id', 'author_name', 'post_id', 'create_time' ], // 要查询的表字段
        orders: [[ 'create_time', 'desc' ]], // 排序方式
        limit, // 返回数据量
        offset, // 数据偏移量
      });
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }

  // 删除回复信息: is_removed 0-未删除 1-已删除
  async deleteReplyInfo(params) {
    if (!params.id) {
      console.log('id必须传递');
      return null;
    }
    const { app } = this;
    try {
      const result = await app.mysql.update('reply_info', { id: params.id, is_removed: 1 });
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }
}

module.exports = BBSReplyService;

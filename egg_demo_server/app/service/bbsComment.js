'use strict';

const Service = require('egg').Service;

class BBSCommentService extends Service {
  // 插入评论信息
  async addCommentInfo(params) {
    const { app } = this;
    try {
      const result = await app.mysql.insert('comment_info', params);
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }

  // 查询评论列表
  async getCommentInfo(params) {
    const { app } = this;
    try {
      const offset = app.toInt(params.pageNum) * app.toInt(params.pageSize) - app.toInt(params.pageSize);
      const limit = app.toInt(params.pageSize);
      const result = await app.mysql.select('comment_info', { // 查询 comment_info 表
        where: { is_removed: '0', author_id: [ '1', '2' ] }, // WHERE 条件
        columns: [ 'id', 'content', 'is_removed', 'author_id', 'post_id', 'create_time' ], // 要查询的表字段
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

  // 删除评论信息: is_removed 0-未删除 1-已删除
  async deleteCommentInfo(params) {
    if (!params.id) {
      console.log('id必须传递');
      return null;
    }
    const { app } = this;
    try {
      const result = await app.mysql.update('comment_info', { id: params.id, is_removed: 1 });
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }
}

module.exports = BBSCommentService;

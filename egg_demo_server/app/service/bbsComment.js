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
      const TABLE_NAME = 'comment_info';
      const QUERY_STR = 'id, comment_id, content, is_removed, author_id, post_id, create_time';
      const CON1 = params.post_id;
      const result = await app.mysql.query(`select ${QUERY_STR} from ${TABLE_NAME} where post_id = ${CON1}`);
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }

  // 查询评论数
  async getCommentCount(params) {
    const { app } = this;
    try {
      const TABLE_NAME = 'comment_info';
      const QUERY_STR = 'id, comment_id, content, is_removed, author_id, post_id, create_time';
      const CON1 = params.author_id;
      const result = await app.mysql.query(`select ${QUERY_STR} from ${TABLE_NAME} where author_id = ${CON1}`);
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

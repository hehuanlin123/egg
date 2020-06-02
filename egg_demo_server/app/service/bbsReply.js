'use strict';

const Service = require('egg').Service;

class BBSReplyService extends Service {

  // 插入回复信息
  async addReplyInfo(params) {
    const { app } = this;
    try {
      const result = await app.mysql.insert('reply_info', params);
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
      const TABLE_NAME = 'reply_info';
      const QUERY_STR = 'id, content, comment_id, is_removed, author_id, reviewers, responder, post_id, createTime';
      const CON1 = params.comment_id;
      const result = await app.mysql.query(`select ${QUERY_STR} from ${TABLE_NAME} where comment_id = ${CON1}`);
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }

  // 查询文章回复数
  async getPostReplyCount(params) {
    const { app } = this;
    try {
      const TABLE_NAME = 'reply_info';
      const QUERY_STR = 'id, content, comment_id, is_removed, author_id, reviewers, responder, post_id, createTime';
      const CON1 = params.post_id;
      const result = await app.mysql.query(`select ${QUERY_STR} from ${TABLE_NAME} where post_id = ${CON1}`);
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

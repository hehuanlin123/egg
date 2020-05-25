'use strict';

const Service = require('egg').Service;

class BBSPraiseService extends Service {
  // 插入点赞信息
  async addPraiseInfo(params) {
    const { app } = this;
    try {
      const result = await app.mysql.insert('praise_info', params);
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }

  // 查询是否已点赞
  async getPraiseInfo(params) {
    const { app } = this;
    try {
      const TABLE_NAME = 'praise_info';
      const QUERY_STR = 'id, is_removed, author_id, post_id, create_time';
      const CON1 = params.post_id;
      const CON2 = params.author_id;
      const result = await app.mysql.query(`select ${QUERY_STR} from ${TABLE_NAME} where post_id = ${CON1} and author_id = ${CON2}`);
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }

  // 查询文章点赞数
  async getPostPraiseInfo(params) {
    const { app } = this;
    try {
      const TABLE_NAME = 'praise_info';
      const QUERY_STR = 'id, is_removed, author_id, post_id, create_time';
      const CON1 = params.post_id;
      const result = await app.mysql.query(`select ${QUERY_STR} from ${TABLE_NAME} where post_id = ${CON1}`);
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }

  // 查询个人点赞数
  async getPersonalPraiseInfo(params) {
    const { app } = this;
    try {
      const TABLE_NAME = 'praise_info';
      const QUERY_STR = 'id, is_removed, author_id, post_id, create_time';
      const CON2 = params.author_id;
      const result = await app.mysql.query(`select ${QUERY_STR} from ${TABLE_NAME} where author_id = ${CON2}`);
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }

  // 删除点赞信息: is_removed 0-未删除 1-已删除
  async deletePraiseInfo(params) {
    if (!params.post_id || !params.author_id) {
      console.log('id必须传递');
      return null;
    }
    const { app } = this;
    try {
      const result = await app.mysql.update('praise_info', { is_removed: params.is_removed, post_id: params.post_id, author_id: params.author_id });
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }
}

module.exports = BBSPraiseService;

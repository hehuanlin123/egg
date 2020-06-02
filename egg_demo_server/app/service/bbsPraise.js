'use strict';

const Service = require('egg').Service;

class BBSPraiseService extends Service {
  // 插入点赞信息
  async addPraiseInfo(params) {
    const { app } = this;
    try {
      const TABLE_NAME = 'praise_info';
      const QUERY_STR = 'id, is_removed, author_id, post_id, createTime';
      const CON1 = params.is_removed;
      const CON2 = params.post_id;
      const CON3 = params.author_id;
      const result1 = await app.mysql.query(`select ${QUERY_STR} from ${TABLE_NAME} where post_id = ${CON2} and author_id = ${CON3}`);
      if (result1) {
        const result2 = await app.mysql.query(`update ${TABLE_NAME} set is_removed = ${CON1} where post_id = ${CON2} and author_id = ${CON3}`);
        return result2;
      }
      const result3 = await app.mysql.insert('praise_info', params);
      return result3;
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
      const QUERY_STR = 'id, is_removed, author_id, post_id, createTime';
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
      const QUERY_STR = 'id, is_removed, author_id, post_id, createTime';
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
    console.log('444444' + params.author_id);
    const { app } = this;
    try {
      const TABLE_NAME = 'praise_info';
      const QUERY_STR = 'id, is_removed, author_id, post_id, createTime';
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
      console.log('post_id和author_id必须传递');
      return null;
    }
    const { app } = this;
    try {
      const TABLE_NAME = 'praise_info';
      const CON1 = params.is_removed;
      const CON2 = params.post_id;
      const CON3 = params.author_id;
      const result = await app.mysql.query(`update ${TABLE_NAME} set is_removed = ${CON1} where post_id = ${CON2} and author_id = ${CON3}`);
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }
}

module.exports = BBSPraiseService;

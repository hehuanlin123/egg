'use strict';

const Service = require('egg').Service;

class BBSFriendsService extends Service {
  // 插入关注好友信息
  async addFriendsInfo(params) {
    const { app } = this;
    try {
      const result = await app.mysql.insert('friend_info', params);
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }

  // 查询关注好友列表
  async getFriendsInfo(params) {
    const { app } = this;
    try {
      const TABLE_NAME = 'friend_info';
      const QUERY_STR = 'id, is_removed, author_id, fans_id, createTime';
      const CON1 = params.author_id;
      const CON2 = params.fans_id;
      if (CON1) {
        const result = await app.mysql.query(`select ${QUERY_STR} from ${TABLE_NAME} where author_id = ${CON1}`);
        return result;
      }
      if (CON2) {
        const result = await app.mysql.query(`select ${QUERY_STR} from ${TABLE_NAME} where fans_id = ${CON2}`);
        return result;
      }
      if (CON1 && CON2) {
        const result = await app.mysql.query(`select ${QUERY_STR} from ${TABLE_NAME} where author_id = ${CON1} and fans_id = ${CON2}`);
        return result;
      }
    } catch (err) {
      console.log(err);
      return null;
    }
  }

  // 删除关注好友信息: is_removed 0-未删除 1-已删除
  async deleteFriendsInfo(params) {
    if (!params.fans_id || !params.author_id) {
      console.log('id必须传递');
      return null;
    }
    const { app } = this;
    try {
      const TABLE_NAME = 'friend_info';
      const CON1 = params.author_id;
      const CON2 = params.fans_id;
      const CON3 = params.is_removed;
      const result = await app.mysql.query(`update ${TABLE_NAME} set is_removed = ${CON3} where author_id = ${CON1} and fans_id = ${CON2}`);
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }
}

module.exports = BBSFriendsService;

'use strict';

const Service = require('egg').Service;

class BBSArticleService extends Service {
  // 插入帖子信息
  async addArticleInfo(params) {
    const { app } = this;
    try {
      const result = await app.mysql.insert('paper_info', params);
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }

  // 删除帖子信息: is_removed 0-未删除 1-已删除
  async deleteArticleInfo(params) {
    if (!params.id) {
      console.log('id必须传递');
      return null;
    }
    const { app } = this;
    try {
      const result = await app.mysql.update('paper_info', { id: params.id, is_removed: 1 });
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }

  // 查询帖子列表（条件）
  async getArticleInfoDetail(params) {
    const { app } = this;
    try {
      const result = await app.mysql.select('paper_info', { // 查询 paper_info 表
        // where: { id: params.id, is_removed: '0', author_id: params.author_id, plate: params.plate}, // WHERE 条件
        where: { id: params.id },
        columns: [ 'id', 'avatar', 'title', 'content', 'createTime', 'updateTime', 'read_count',  'is_removed', 
        'author_id', 'taglist', 'posttype', 'plate', 'praise_count', 'comment_count'], // 要查询的表字段
      });
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }

  // 查询帖子列表
  async getArticleInfo(params) {
    const { app } = this;
    try {
      // const offset = app.toInt(params.pageNum) * app.toInt(params.pageSize) - app.toInt(params.pageSize);
      // const limit = app.toInt(params.pageSize);
      // const result = await app.mysql.select('paper_info', { // 查询 paper_info 表
      //   where: { is_removed: '0'}, // WHERE 条件
      //   columns: [ 'id', 'title', 'content', 'read_count', 'praise_count', 'comment_count', 
      //   'is_removed', 'author_id', 'createTime', 'updateTime', 'taglist'], // 要查询的表字段
      //   orders: [[ params.ordertype, 'desc' ]], // 排序方式
      //   // limit, // 返回数据量
      //   offset, // 数据偏移量
      // });
      const TABLE_NAME = 'paper_info';
      const QUERY_STR = 'id, avatar, title, content, createTime, updateTime, read_count,  is_removed, author_id, taglist, posttype, plate, praise_count, comment_count';
      const ORDER = params.ordertype;
      const result = await app.mysql.query(`select ${QUERY_STR} from ${TABLE_NAME} order by ${ORDER} desc`);
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }

  // 搜索帖子
  async searchArticleInfo(params) {
    const { app } = this;
    try {
      const TABLE_NAME = 'paper_info';
      const QUERY_STR = 'id, avatar, title, content, createTime, updateTime, read_count,  is_removed, author_id, taglist, posttype, plate, praise_count, comment_count';
      const result = await app.mysql.query(`select ${QUERY_STR} from ${TABLE_NAME} where title like "%${params.title}%"`);
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }
}

module.exports = BBSArticleService;

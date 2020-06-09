'use strict';

const Service = require('egg').Service;

class BBSArticleService extends Service {
  // 插入资源信息
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

  // 删除资源信息: is_removed 0-未删除 1-已删除
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

  // 更新资源信息
  async updateArticleInfo(params) {
    if (!params.id) {
      console.log('id必须传递');
      return null;
    }
    const { app } = this;
    try {
      if (params.read_count) {
        const result = await app.mysql.update('paper_info', { id: params.id, read_count: params.read_count });
        return result;
      }
      if (params.praise_count) {
        const result = await app.mysql.update('paper_info', { id: params.id, praise_count: params.praise_count });
        return result;
      }
      if (params.comment_count) {
        const result = await app.mysql.update('paper_info', { id: params.id, comment_count: params.comment_count });
        return result;
      }
    } catch (err) {
      console.log(err);
      return null;
    }
  }

  // 查询资源列表（条件）
  async getArticleInfoDetail(params) {
    const { app } = this;
    try {
      const TABLE_NAME = 'paper_info';
      const QUERY_STR = 'id, avatar, title, content, createTime, updateTime, read_count,  is_removed, ' +
          'author_id, author_name, taglist, posttype, plate, praise_count, comment_count';
      const CON1 = params.id;
      const result = await app.mysql.query(`select ${QUERY_STR} from ${TABLE_NAME} where id = ${CON1}`);
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }

  // 查询资源列表
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
      const QUERY_STR = 'id, avatar, title, content, createTime, updateTime, read_count,  is_removed, ' +
          'author_id, author_name, taglist, posttype, plate, praise_count, comment_count';
      const ORDER = params.ordertype;
      const CON1 = params.author_id;
      if (CON1) {
        const result = await app.mysql.query(`select ${QUERY_STR} from ${TABLE_NAME} where author_id = ${CON1} order by ${ORDER} desc`);
        return result;
      }
      const result = await app.mysql.query(`select ${QUERY_STR} from ${TABLE_NAME} order by ${ORDER} desc`);
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }

  // 搜索资源
  async searchArticleInfo(params) {
    const { app } = this;
    try {
      const TABLE_NAME = 'paper_info';
      const QUERY_STR = 'id, avatar, title, content, createTime, updateTime, read_count,  is_removed, ' +
          'author_id, author_name,taglist, posttype, plate, praise_count, comment_count';
      const CON1 = params.title;
      const ORDER = params.ordertype;
      const result = await app.mysql.query(`select ${QUERY_STR} from ${TABLE_NAME} where title like "%${CON1}%" order by ${ORDER} desc`);
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }

  // 查询个人发布资源数
  async getPostCount(params) {
    console.log('1111111' + params.author_id);
    const { app } = this;
    try {
      const TABLE_NAME = 'paper_info';
      const QUERY_STR = 'id, avatar, title, content, createTime, updateTime, read_count, ' +
          'is_removed, author_id, author_name,taglist, posttype, plate, praise_count, comment_count';
      const WHE = params.author_id;
      const result = await app.mysql.query(`select ${QUERY_STR} from ${TABLE_NAME} where author_id = ${WHE}`);
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }

  // 查询热门帖子列表
  async getHotArticleInfo(params) {
    const { app } = this;
    try {
      const TABLE_NAME = 'paper_info';
      const QUERY_STR = 'id, avatar, title, content, createTime, updateTime, read_count,  is_removed, author_id, ' +
          'author_name, taglist, posttype, plate, praise_count, comment_count';
      const ORDER = params.ordertype;
      const result = await app.mysql.query(`select ${QUERY_STR} from ${TABLE_NAME} order by ${ORDER} desc`);
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }

  // 发布图片
  async addImageList(params) {
    const { app } = this;
    try {
      const result = await app.mysql.insert('attachement_info', params);
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }
}

module.exports = BBSArticleService;

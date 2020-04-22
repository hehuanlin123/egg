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

  // 查询帖子列表
  async getArticleInfo(params) {
    const { app } = this;
    try {
      const offset = app.toInt(params.pageNum) * app.toInt(params.pageSize) - app.toInt(params.pageSize);
      const limit = app.toInt(params.pageSize);
      const result = await app.mysql.select('paper_info', { // 查询 paper_info 表
        where: { is_removed: '0', read_count: [ '1', '2' ] }, // WHERE 条件
        columns: [ 'id', 'title', 'content', 'read_count', 'is_removed', 'author_id', 'create_time', 'update_time' ], // 要查询的表字段
        orders: [[ 'read_count', 'desc' ], [ 'create_time', 'desc' ]], // 排序方式
        limit, // 返回数据量
        offset, // 数据偏移量
      });
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
      const QUERY_STR = 'id,title, content, read_count, is_removed, author_id, create_time, update_time';
      const result = await app.mysql.query(`select ${QUERY_STR} from ${TABLE_NAME} where title like "%${params.title}%"`);
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }
}

module.exports = BBSArticleService;

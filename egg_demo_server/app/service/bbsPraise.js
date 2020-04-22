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

  // 查询点赞列表
  async getPraiseInfo(params) {
    const { app } = this;
    try {
      const offset = app.toInt(params.pageNum) * app.toInt(params.pageSize) - app.toInt(params.pageSize);
      const limit = app.toInt(params.pageSize);
      const result = await app.mysql.select('praise_info', { // 查询 praise_info 表
        where: { is_removed: '0', author_id: [ '1', '2' ] }, // WHERE 条件
        columns: [ 'id', 'is_removed', 'author_id', 'post_id', 'create_time' ], // 要查询的表字段
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

  // 删除点赞信息: is_removed 0-未删除 1-已删除
  async deletePraiseInfo(params) {
    if (!params.id) {
      console.log('id必须传递');
      return null;
    }
    const { app } = this;
    try {
      const result = await app.mysql.update('praise_info', { id: params.id, is_removed: 1 });
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }
}

module.exports = BBSPraiseService;

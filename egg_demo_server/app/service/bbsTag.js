'use strict';

const Service = require('egg').Service;

class BBSTagService extends Service {
  // 插入标签信息
  async addTagInfo(params) {
    const { app } = this;
    try {
      const result = await app.mysql.insert('tag_info', params);
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }

  // 查询标签列表
  async getTagInfo(params) {
    const { app } = this;
    try {
      const offset = app.toInt(params.pageNum) * app.toInt(params.pageSize) - app.toInt(params.pageSize);
      const limit = app.toInt(params.pageSize);
      const result = await app.mysql.select('tag_info', { // 查询 praise_info 表
        where: { is_removed: '0', tag_name: [ '1', '2' ] }, // WHERE 条件
        columns: [ 'id', 'is_removed', 'tag_name', 'create_time' ], // 要查询的表字段
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

  // 推荐标签列表
  async recomendTagInfo(params) {
    const { app } = this;
    try {
      const offset = app.toInt(params.pageNum) * app.toInt(params.pageSize) - app.toInt(params.pageSize);
      const limit = app.toInt(params.pageSize);
      const allresult = await app.mysql.select('tag_info', { // 查询 praise_info 表
        where: { is_removed: '0', tag_name: [ '1', '2' ] }, // WHERE 条件
        columns: [ 'id', 'is_removed', 'tag_name', 'create_time' ], // 要查询的表字段
        orders: [[ 'create_time', 'desc' ]], // 排序方式
        limit, // 返回数据量
        offset, // 数据偏移量
      });

      // 随机选取三个标签
      const arr = [];
      const count = 3;
      allresult.forEach(item => {
        arr.push(item.tag_name);
      });
      const shuffled = arr.slice(0);
      let i = arr.length;
      const min = i - count;
      let temp;
      let index;
      while (i-- > min) {
        index = Math.floor((i + 1) * Math.random());
        temp = shuffled[index];
        shuffled[index] = shuffled[i];
        shuffled[i] = temp;
      }
      const result = shuffled.slice(min);

      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }
}

module.exports = BBSTagService;

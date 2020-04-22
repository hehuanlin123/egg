'use strict';

const Controller = require('egg').Controller;
const moment = require('moment');

class BBSTopicsController extends Controller {
  // 关注话题
  async addTopicsInfo() {
    const { ctx } = this;
    const params = {
      ...ctx.request.body,
      createTime: moment().format('YYYY-MM-DD HH:mm:ss'),
    };
    const result = await ctx.service.bbsTopics.addTopicsInfo(params);
    if (result) {
      ctx.body = {
        status: 200,
        data: result,
      };
    } else {
      ctx.body = {
        status: 500,
        errMsg: '关注失败',
      };
    }

  }

  // 查询关注话题
  async getTopicsInfo() {
    const { ctx } = this;
    const params = {
      ...ctx.request.body,
    };
    const result = await ctx.service.bbsTopics.getTopicsInfo(params);
    if (result) {
      ctx.body = {
        status: 200,
        data: { result, count: result.length },
      };
    } else {
      ctx.body = {
        status: 500,
        errMsg: '查询关注话题失败',
      };
    }
  }

  // 删除关注话题
  async deleteTopicsInfo() {
    const { ctx } = this;
    const params = {
      ...ctx.request.body,
    };
    const result = await ctx.service.bbsTopics.deleteTopicsInfo(params);
    if (result) {
      ctx.body = {
        status: 200,
        data: result,
      };
    } else {
      ctx.body = {
        status: 500,
        errMsg: '删除关注话题失败',
      };
    }
  }
}

module.exports = BBSTopicsController;

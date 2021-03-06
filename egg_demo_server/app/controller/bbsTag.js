'use strict';

const Controller = require('egg').Controller;
const moment = require('moment');

class BBSTagController extends Controller {
  // 发布标签
  async addTagInfo() {
    const { ctx } = this;
    const params = {
      ...ctx.request.body,
      createTime: moment().format('YYYY-MM-DD HH:mm:ss'),
    };
    const result = await ctx.service.bbsTag.addTagInfo(params);
    if (result) {
      ctx.body = {
        status: 200,
        data: result,
      };
    } else {
      ctx.body = {
        status: 500,
        errMsg: '发布标签失败',
      };
    }

  }

  // 查询标签
  async getTagInfo() {
    const { ctx } = this;
    const params = {
      ...ctx.request.body,
    };
    const result = await ctx.service.bbsTag.getTagInfo(params);
    if (result) {
      ctx.body = {
        status: 200,
        data: { result, count: result.length },
      };
    } else {
      ctx.body = {
        status: 500,
        errMsg: '查询标签失败',
      };
    }
  }

  // 推荐标签
  async recomendTagInfo() {
    const { ctx } = this;
    const params = {
      ...ctx.request.body,
    };
    const result = await ctx.service.bbsPraise.getTagInfo(params);
    if (result) {
      ctx.body = {
        status: 200,
        data: { result, count: result.length },
      };
    } else {
      ctx.body = {
        status: 500,
        errMsg: '推荐标签失败',
      };
    }
  }

}

module.exports = BBSTagController;

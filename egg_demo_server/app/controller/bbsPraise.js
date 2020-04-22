'use strict';

const Controller = require('egg').Controller;
const moment = require('moment');

class BBSPraiseController extends Controller {
  // 发布点赞
  async addPraiseInfo() {
    const { ctx } = this;
    const params = {
      ...ctx.request.body,
      createTime: moment().format('YYYY-MM-DD HH:mm:ss'),
    };
    const result = await ctx.service.bbsPraise.addPraiseInfo(params);
    if (result) {
      ctx.body = {
        status: 200,
        data: result,
      };
    } else {
      ctx.body = {
        status: 500,
        errMsg: '发布点赞失败',
      };
    }

  }

  // 查询点赞(数)
  async getPraiseInfo() {
    const { ctx } = this;
    const params = {
      ...ctx.request.body,
    };
    const result = await ctx.service.bbsPraise.getPraiseInfo(params);
    if (result) {
      ctx.body = {
        status: 200,
        data: { result, count: result.length },
      };
    } else {
      ctx.body = {
        status: 500,
        errMsg: '查询点赞失败',
      };
    }
  }

  // 删除点赞
  async deletePraiseInfo() {
    const { ctx } = this;
    const params = {
      ...ctx.request.body,
    };
    const result = await ctx.service.bbsPraise.deletePraiseInfo(params);
    if (result) {
      ctx.body = {
        status: 200,
        data: result,
      };
    } else {
      ctx.body = {
        status: 500,
        errMsg: '删除点赞失败',
      };
    }
  }
}

module.exports = BBSPraiseController;

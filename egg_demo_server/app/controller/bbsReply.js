'use strict';

const Controller = require('egg').Controller;
const moment = require('moment');

class BBSReplyController extends Controller {

  // 发布回复
  async addReplyInfo() {
    const { ctx } = this;
    const params = {
      ...ctx.request.body,
      createTime: moment().format('YYYY-MM-DD HH:mm:ss'),
    };
    const result = await ctx.service.bbsReply.addReplyInfo(params);
    if (result) {
      ctx.body = {
        status: 200,
        data: result,
      };
    } else {
      ctx.body = {
        status: 500,
        errMsg: '发布回复失败',
      };
    }

  }

  // 查询回复
  async getReplyInfo() {
    const { ctx } = this;
    const params = {
      ...ctx.request.body,
    };
    const result = await ctx.service.bbsReply.getReplyInfo(params);
    if (result) {
      ctx.body = {
        status: 200,
        data: result,
      };
    } else {
      ctx.body = {
        status: 500,
        errMsg: '查询回复失败',
      };
    }
  }

  // 删除回复
  async deleteReplyInfo() {
    const { ctx } = this;
    const params = {
      ...ctx.request.body,
    };
    const result = await ctx.service.bbsReply.deleteReplyInfo(params);
    if (result) {
      ctx.body = {
        status: 200,
        data: result,
      };
    } else {
      ctx.body = {
        status: 500,
        errMsg: '删除回复失败',
      };
    }
  }
}

module.exports = BBSReplyController;

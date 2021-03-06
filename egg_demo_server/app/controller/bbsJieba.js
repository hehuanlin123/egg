'use strict';

const Controller = require('egg').Controller;

class BBSJiebaController extends Controller {
  // 关键词提取
  async extractKeywords() {
    const { ctx } = this;
    const params = {
      ...ctx.request.body,
    };
    const result = await ctx.service.bbsJieba.extractKeywords(params);
    if (result) {
      ctx.body = {
        status: 200,
        data: result,
      };
    } else {
      ctx.body = {
        status: 500,
        errMsg: '关键词抽取失败！',
      };
    }
  }

}

module.exports = BBSJiebaController;

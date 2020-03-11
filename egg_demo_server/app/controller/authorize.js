'use strict';

const Controller = require('egg').Controller;

const authorize = require('../service/authorize'); // 处理具体的验证逻辑

class WeixinController extends Controller {
  async config() {
    const { ctx } = this;
    const query = ctx.query;
    const result = await authorize._config(query);
    ctx.body = result;
  }
}

module.exports = WeixinController;

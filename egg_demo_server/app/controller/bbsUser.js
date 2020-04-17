'use strict';

const Controller = require('egg').Controller;
const moment = require('moment');

class BBSUserController extends Controller {
  async addUserInfo() {
    const { ctx } = this;
    const params = {
      ...ctx.request.body,
      createTime: moment().format('YYYY-MM-DD HH:mm:ss'),
    };
    const result = await ctx.service.bbsUser.create(params);
    if (result) {
      ctx.body = {
        status: 200,
        data: result,
      };
    } else {
      ctx.body = {
        status: 500,
        errMsg: '用户注册失败',
      };
    }

  }

  async updateUserInfo() {
    const { ctx } = this;
    const result = await ctx.service.article.lists();
    if (result) {
      ctx.body = {
        status: 200,
        data: result,
      };
    } else {
      ctx.body = {
        status: 500,
        errMsg: '更新用户信息失败',
      };
    }
  }

  async getUserInfo() {
    const { ctx } = this;
    const id = ctx.params.id;
    // const params = ctx.query.id
    const result = await ctx.service.article.detail(id);
    if (result) {
      ctx.body = {
        status: 200,
        data: result,
      };
    } else {
      ctx.body = {
        status: 500,
        errMsg: '获取用户信息（用户登录）失败',
      };
    }
  }

  async resetUserPassword() {
    const { ctx } = this;
    const id = ctx.params.id;
    // const params = ctx.query.id
    const result = await ctx.service.article.detail(id);
    if (result) {
      ctx.body = {
        status: 200,
        data: result,
      };
    } else {
      ctx.body = {
        status: 500,
        errMsg: '修改用户密码失败',
      };
    }
  }
}

module.exports = ArticleController;

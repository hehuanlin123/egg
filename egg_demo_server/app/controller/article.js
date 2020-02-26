'use strict';

const Controller = require('egg').Controller;
const moment = require('moment');

class ArticleController extends Controller {
  async create() {
    const { ctx } = this;
    const params = {
      ...ctx.request.body,
      createTime: moment().format('YYYY-MM-DD HH:mm:ss'),
    };
    const res = await ctx.service.article.create(params);
    if (res) {
      ctx.body = {
        status: 200,
        data: res,
      };
    } else {
      ctx.body = {
        status: 500,
        errMsg: '发布文章失败',
      };
    }

  }

  async lists() {
    const { ctx } = this;
    const res = await ctx.service.article.lists();
    if (res) {
      ctx.body = {
        status: 200,
        data: res,
      };
    } else {
      ctx.body = {
        status: 500,
        errMsg: '查询文章列表失败',
      };
    }
  }

  async detail() {
    const { ctx } = this;
    const id = ctx.params.id;
    // const params = ctx.query.id
    const res = await ctx.service.article.detail(id);
    if (res) {
      ctx.body = {
        status: 200,
        data: res,
      };
    } else {
      ctx.body = {
        status: 500,
        errMsg: '查询文章详情失败',
      };
    }
  }
}

module.exports = ArticleController;

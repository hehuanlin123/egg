'use strict';

const Controller = require('egg').Controller;
const moment = require('moment');

class BBSArticleController extends Controller {
  // 发布帖子
  async addArticleInfo() {
    const { ctx } = this;
    const params = {
      ...ctx.request.body,
      createTime: moment().format('YYYY-MM-DD HH:mm:ss'),
    };
    const result = await ctx.service.bbsArticle.addArticleInfo(params);
    if (result) {
      ctx.body = {
        status: 200,
        data: result,
      };
    } else {
      ctx.body = {
        status: 500,
        errMsg: '发布帖子失败',
      };
    }

  }

  // 删除帖子
  async deleteArticleInfo() {
    const { ctx } = this;
    const params = {
      ...ctx.request.body,
      createTime: moment().format('YYYY-MM-DD HH:mm:ss'),
    };
    const result = await ctx.service.bbsArticle.deleteArticleInfo(params);
    if (result) {
      ctx.body = {
        status: 200,
        data: result,
      };
    } else {
      ctx.body = {
        status: 500,
        errMsg: '删除帖子失败',
      };
    }
  }

  // 查询帖子列表（条件）
  async getArticleInfoDetail() {
    const { ctx } = this;
    const params = {
      ...ctx.request.body,
    };
    const result = await ctx.service.bbsArticle.getArticleInfoDetail(params);
    if (result) {
      ctx.body = {
        status: 200,
        data: result,
      };
    } else {
      ctx.body = {
        status: 500,
        errMsg: '查询帖子列表（条件）失败',
      };
    }
  }

  // 获取帖子列表（分页）
  async getArticleInfo() {
    const { ctx } = this;
    const params = {
      ...ctx.request.body,
    };
    const result = await ctx.service.bbsArticle.getArticleInfo(params);
    if (result) {
      ctx.body = {
        status: 200,
        data: result,
      };
    } else {
      ctx.body = {
        status: 500,
        errMsg: '获取帖子信息（分页）失败',
      };
    }
  }

  // 模糊搜索帖子列表（分页）
  async searchArticleInfo() {
    const { ctx } = this;
    const params = {
      ...ctx.request.body,
    };
    const result = await ctx.service.bbsArticle.searchArticleInfo(params);
    if (result) {
      ctx.body = {
        status: 200,
        data: result,
      };
    } else {
      ctx.body = {
        status: 500,
        errMsg: '搜索帖子信息（分页）失败',
      };
    }
  }

  // 查询个人发布帖子数
  async getPostCount() {
    const { ctx } = this;
    const params = {
      ...ctx.request.body,
    };
    const result = await ctx.service.bbsArticle.getPostCount(params);
    if (result) {
      ctx.body = {
        status: 200,
        data: result,
      };
    } else {
      ctx.body = {
        status: 500,
        errMsg: '搜索帖子信息（分页）失败',
      };
    }
  }
}

module.exports = BBSArticleController;

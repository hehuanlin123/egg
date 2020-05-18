'use strict';

const Controller = require('egg').Controller;
const moment = require('moment');

class BBSArticleController extends Controller {
  // 发布资源
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
        errMsg: '发布资源失败',
      };
    }

  }

  // 删除资源
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
        errMsg: '删除资源失败',
      };
    }
  }

  // 删除资源
  async updateArticleInfo() {
    const { ctx } = this;
    const params = {
      ...ctx.request.body,
      createTime: moment().format('YYYY-MM-DD HH:mm:ss'),
    };
    const result = await ctx.service.bbsArticle.updateArticleInfo(params);
    if (result) {
      ctx.body = {
        status: 200,
        data: result,
      };
    } else {
      ctx.body = {
        status: 500,
        errMsg: '更新资源失败',
      };
    }
  }

  // 查询资源列表（条件）
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
        errMsg: '查询资源列表（条件）失败',
      };
    }
  }

  // 获取资源列表（分页）
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
        errMsg: '获取资源信息（分页）失败',
      };
    }
  }

  // 模糊搜索资源列表（分页）
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
        errMsg: '搜索资源信息（分页）失败',
      };
    }
  }

  // 查询个人发布资源数
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
        errMsg: '查询个人发布资源数失败',
      };
    }
  }

  // 获取帖子列表（分页）
  async getHotArticleInfo() {
    const { ctx } = this;
    const params = {
      ...ctx.request.body,
    };
    const result = await ctx.service.bbsArticle.getHotArticleInfo(params);
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
}

module.exports = BBSArticleController;

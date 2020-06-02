'use strict';

const Controller = require('egg').Controller;
const moment = require('moment');

class BBSCommentController extends Controller {
  // 发布评论
  async addCommentInfo() {
    const { ctx } = this;
    const params = {
      ...ctx.request.body,
      createTime: moment().format('YYYY-MM-DD HH:mm:ss'),
    };
    const result = await ctx.service.bbsComment.addCommentInfo(params);
    if (result) {
      ctx.body = {
        status: 200,
        data: result,
      };
    } else {
      ctx.body = {
        status: 500,
        errMsg: '发布评论失败',
      };
    }

  }

  // 查询评论
  async getCommentInfo() {
    const { ctx } = this;
    const params = {
      ...ctx.request.body,
    };
    const result = await ctx.service.bbsComment.getCommentInfo(params);
    if (result) {
      ctx.body = {
        status: 200,
        data: result,
      };
    } else {
      ctx.body = {
        status: 500,
        errMsg: '查询评论失败',
      };
    }
  }

  // 查询评论数
  async getCommentCount() {
    const { ctx } = this;
    const params = {
      ...ctx.request.body,
    };
    const result = await ctx.service.bbsComment.getCommentCount(params);
    if (result) {
      ctx.body = {
        status: 200,
        data: result,
      };
    } else {
      ctx.body = {
        status: 500,
        errMsg: '查询评论数失败',
      };
    }
  }

  // 查询文章评论数
  async getPostCommentCount() {
    const { ctx } = this;
    const params = {
      ...ctx.request.body,
    };
    const result = await ctx.service.bbsComment.getPostCommentCount(params);
    if (result) {
      ctx.body = {
        status: 200,
        data: result,
      };
    } else {
      ctx.body = {
        status: 500,
        errMsg: '查询文章评论数失败',
      };
    }
  }

  // 删除评论
  async deleteCommentInfo() {
    const { ctx } = this;
    const params = {
      ...ctx.request.body,
    };
    const result = await ctx.service.bbsComment.deleteCommentInfo(params);
    if (result) {
      ctx.body = {
        status: 200,
        data: result,
      };
    } else {
      ctx.body = {
        status: 500,
        errMsg: '删除评论失败',
      };
    }
  }
}

module.exports = BBSCommentController;

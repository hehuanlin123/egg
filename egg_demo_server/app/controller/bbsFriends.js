'use strict';

const Controller = require('egg').Controller;
const moment = require('moment');

class BBSFriendsController extends Controller {
  // 关注好友
  async addFriendsInfo() {
    const { ctx } = this;
    const params = {
      ...ctx.request.body,
      createTime: moment().format('YYYY-MM-DD HH:mm:ss'),
    };
    const result = await ctx.service.bbsFriends.addFriendsInfo(params);
    if (result) {
      ctx.body = {
        status: 200,
        data: result,
      };
    } else {
      ctx.body = {
        status: 500,
        errMsg: '关注好友失败',
      };
    }

  }

  // 查询关注好友
  async getFriendsInfo() {
    const { ctx } = this;
    const params = {
      ...ctx.request.body,
    };
    const result = await ctx.service.bbsFriends.getFriendsInfo(params);
    if (result) {
      ctx.body = {
        status: 200,
        data: result,
      };
    } else {
      ctx.body = {
        status: 500,
        errMsg: '查询关注好友失败',
      };
    }
  }

  // 删除关注好友
  async deleteFriendsInfo() {
    const { ctx } = this;
    const params = {
      ...ctx.request.body,
    };
    const result = await ctx.service.bbsFriends.deleteFriendsInfo(params);
    if (result) {
      ctx.body = {
        status: 200,
        data: result,
      };
    } else {
      ctx.body = {
        status: 500,
        errMsg: '删除关注好友失败',
      };
    }
  }
}

module.exports = BBSFriendsController;

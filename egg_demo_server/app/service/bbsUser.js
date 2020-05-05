'use strict';

const Service = require('egg').Service;

class BBSUserService extends Service {
  // 插入用户信息
  async addUserInfo(params) {
    const { app } = this;
    try {
      const result = await app.mysql.insert('user_info', params);
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }

  // 更新用户信息
  async updateUserInfo(params) {
    const { app } = this;
    try {
      const result = await app.mysql.update('user_info', params);
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }

  // 查询用户信息
  async getUserInfo(params) {
    if (params.cellphone == null) {
      console.log('手机号必须传递');
      return null;
    }
    const { app } = this;
    try {
      const result = await app.mysql.get('user_info', params);
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }

  // 登录
  async login(params) {
    if (params.cellphone == null || params.password == null) {
      console.log('手机号和密码必须传递');
      return null;
    }
    const { app } = this;
    try {
      const result = await app.mysql.get('user_info', params);
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }

  // 修改密码
  async resetUserPassword(params) {
    if (params.oldpwd === params.newpwd) {
      console.log('新旧密码不能一致');
      return null;
    }
    const { app } = this;
    try {
      const result = await app.mysql.update('user_info', params);
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }
}

module.exports = BBSUserService;

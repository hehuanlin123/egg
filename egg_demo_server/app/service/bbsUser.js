'use strict';

const Service = require('egg').Service;

class BBSUserService extends Service {
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

  async updateUserInfo() {
    const { app } = this;
    try {
      const result = await app.mysql.select('user_info');
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }

  async getUserInfo(id) {
    if (!id) {
      console.log('id必须传递');
      return null;
    }
    const { app } = this;
    try {
      const result = await app.mysql.get('user_info', { id });
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }

  async resetUserPassword(oldpwd,newpwd) {
    if (oldpwd == newpwd) {
      console.log('新旧密码不能一致');
      return null;
    }
    const { app } = this;
    try {
      const result = await app.mysql.update('user_info', { newpwd });
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }
}

module.exports = BBSUserService;

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
    const { app } = this;
    try {
      const TABLE_NAME = 'user_info';
      const CON1 = params.author_id;
      const CON2 = params.cellphone;
      if (CON1) {
        const result = await app.mysql.query(`select * from ${TABLE_NAME} where id = ${CON1}`);
        return result;
      }
      if (CON2) {
        const result = await app.mysql.query(`select * from ${TABLE_NAME} where cellphone = ${CON2}`);
        return result;
      }
      const result = await app.mysql.query(`select * from ${TABLE_NAME}`);
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
    const { app } = this;
    try {
      const TABLE_NAME = 'user_info';
      const CON1 = params.id;
      const CON2 = params.password;
      const result = await app.mysql.query(`update ${TABLE_NAME} set password = ${CON2} where id = ${CON1}`);
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }
}

module.exports = BBSUserService;

'use strict';

const Service = require('egg').Service;

class HomeService extends Service {
  async index() {
    return {
      id: 100,
      name: '测试',
    };
  }
}

module.exports = HomeService;

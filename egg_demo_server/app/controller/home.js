'use strict';

const Controller = require('egg').Controller;

class HomeController extends Controller {
  // 1.GET请求
  // ctx.query  => http://localhost:80/path?id=0
  // ctx.params => http://localhost:80/path/0
  // 2.POST请求
  // ctx.request => postman发送
  async index() {
    const { ctx } = this; //this === window
    const res = await ctx.service.home.index();
    ctx.body = res;
    await ctx.render('index.html',{
      res,
      lists:['a','b','c']
    });
  }
}

module.exports = HomeController;

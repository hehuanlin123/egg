'use strict';

const Controller = require('egg').Controller;

class HomeController extends Controller {
  // 1.GET请求
  // ctx.query  => http://localhost:80/path?id=0
  // ctx.params => http://localhost:80/path/0
  // 2.POST请求
  // ctx.request => postman发送
  async index() {
    // eslint-disable-next-line no-unused-vars
    const { ctx, app } = this; // this === window
    const res = await app.mysql.select('news_detail');
    console.log(res);
    ctx.body = res;
    // const res = await ctx.service.home.index();
    // ctx.body = res;
    // await ctx.render('index.html', {
    //   res,
    //   lists: [ 'a', 'b', 'c' ],
    // });
  }
}

module.exports = HomeController;

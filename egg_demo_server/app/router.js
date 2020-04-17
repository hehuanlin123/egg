'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller } = app;
  router.get('/', controller.home.index);

  router.post('/article/create', controller.article.create);
  router.get('/article/lists', controller.article.lists);
  router.get('/article/detail/:id', controller.article.detail);

  router.get('/weixin/authorize', controller.authorize.config); // 校验token路径

  router.post('/bbs/addUserInfo', controller.bbsUser.addUserInfo); // 用户注册
  router.post('/bbs/updateUserInfo', controller.bbsUser.updateUserInfo); // 更新用户信息
  router.post('/bbs/getUserInfo', controller.bbsUser.getUserInfo); // 获取用户信息（用户登录）
  router.post('/bbs/resetUserPassword', controller.bbsUser.resetUserPassword); // 密码找回

  router.post('/bbs/addArticle', controller.bbsArticle.addArticle); // 发布帖子
  router.post('/bbs/deleteArticle', controller.bbsArticle.deleteArticle); // 删除帖子
  router.post('/bbs/getArticleList', controller.bbsArticle.getArticleList); // 获取帖子列表（分页）
  router.post('/bbs/searchArticleList', controller.bbsArticle.searchArticleList); // 模糊搜索帖子列表（分页）
  
  router.post('/bbs/addComment', controller.bbsComment.addComment); // 发布评论
  router.post('/bbs/getComment', controller.bbsComment.getComment); // 查询评论
  router.post('/bbs/deleteComment', controller.bbsComment.deleteComment); // 删除评论

  router.post('/bbs/addPraise', controller.bbsPraise.addPraise); // 点赞
  router.post('/bbs/deletePraise', controller.bbsPraise.addPraise); // 取消点赞
  router.post('/bbs/getPraiseCount', controller.bbsPraise.getPraiseCount); // 查询点赞数

  router.post('/bbs/getTagList', controller.bbsTag.getTagList); // 查询标签列表
  router.post('/bbs/getArticleTagList', controller.bbsTag.getArticleTagList); // 自动推荐帖子标签
};

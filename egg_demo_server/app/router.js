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

  router.post('/bbs/addArticle', controller.bbsArticle.addArticleInfo); // 发布帖子
  router.post('/bbs/deleteArticle', controller.bbsArticle.deleteArticleInfo); // 删除帖子
  router.post('/bbs/getArticleList', controller.bbsArticle.getArticleInfo()); // 获取帖子列表（分页）
  router.post('/bbs/searchArticleList', controller.bbsArticle.searchArticleInfo()); // 模糊搜索帖子列表（分页）

  router.post('/bbs/addComment', controller.bbsComment.addCommentInfo); // 发布评论
  router.post('/bbs/getComment', controller.bbsComment.getCommentInfo); // 查询评论
  router.post('/bbs/deleteComment', controller.bbsComment.deleteCommentInfo); // 删除评论

  router.post('/bbs/addComment', controller.bbsReply.addReplyInfo); // 发布回复
  router.post('/bbs/getComment', controller.bbsReply.getReplyInfo); // 查询回复
  router.post('/bbs/deleteComment', controller.bbsReply.deleteReplyInfo); // 删除回复

  router.post('/bbs/addPraise', controller.bbsPraise.addPraiseInfo); // 点赞
  router.post('/bbs/deletePraise', controller.bbsPraise.deletePraiseInfo()); // 取消点赞
  router.post('/bbs/getPraiseCount', controller.bbsPraise.getPraiseInfo); // 查询点赞数

  router.post('/bbs/addFriends', controller.bbsFriends.addFriendsInfo); // 关注好友
  router.post('/bbs/deleteFriends', controller.bbsFriends.deleteFriendsInfo); // 取消关注好友
  router.post('/bbs/getFriends', controller.bbsFriends.getFriendsInfo); // 查询关注好友列表

  router.post('/bbs/addTopics', controller.bbsTopics.addTopicsInfo); // 关注话题
  router.post('/bbs/deleteTopics', controller.bbsTopics.deleteTopicsInfo); // 取消关注话题
  router.post('/bbs/getTopics', controller.bbsTopics.getTopicsInfo); // 查询关注话题列表

  router.post('/bbs/addTag', controller.bbsTag.addTagInfo); // 查询标签列表
  router.post('/bbs/getTagList', controller.bbsTag.getTagInfo()); // 查询标签列表
  router.post('/bbs/getArticleTagList', controller.bbsTag.recomendTagInfo()); // 自动推荐帖子标签
};

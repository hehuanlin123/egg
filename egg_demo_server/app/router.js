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

  router.post('/bbsdev/addUserInfo', controller.bbsUser.addUserInfo); // 用户注册
  router.post('/bbsdev/updateUserInfo', controller.bbsUser.updateUserInfo); // 更新用户信息
  router.post('/bbsdev/getUserInfo', controller.bbsUser.getUserInfo); // 获取用户信息
  router.post('/bbsdev/login', controller.bbsUser.login); // 用户登录
  router.post('/bbsdev/resetUserPassword', controller.bbsUser.resetUserPassword); // 密码找回

  router.post('/bbsdev/addArticle', controller.bbsArticle.addArticleInfo); // 发布资源
  router.post('/bbsdev/deleteArticle', controller.bbsArticle.deleteArticleInfo); // 删除资源
  router.post('/bbsdev/updateArticle', controller.bbsArticle.updateArticleInfo); // 更新资源
  router.post('/bbsdev/getArticleListDetail', controller.bbsArticle.getArticleInfoDetail); // 获取资源列表（条件）
  router.post('/bbsdev/getArticleList', controller.bbsArticle.getArticleInfo); // 获取资源列表（分页）
  router.post('/bbsdev/searchArticleList', controller.bbsArticle.searchArticleInfo); // 模糊搜索资源列表（分页）
  router.post('/bbsdev/getPostCount', controller.bbsArticle.getPostCount); // 查询个人发布资源数
  router.post('/bbsdev/getHotArticleList', controller.bbsArticle.getHotArticleInfo); // 查询个人发布资源数

  router.post('/bbsdev/addImageList', controller.bbsAttachment.addImageList); // 发布图片列表
  router.post('/bbsdev/postImageFileList', controller.bbsAttachment.postImageFileList); // 提交图片文件

  router.post('/bbsdev/addComment', controller.bbsComment.addCommentInfo); // 发布评论
  router.post('/bbsdev/getComment', controller.bbsComment.getCommentInfo); // 查询评论
  router.post('/bbsdev/getCommentCount', controller.bbsComment.getCommentCount); // 查询评论数
  router.post('/bbsdev/getPostCommentCount', controller.bbsComment.getPostCommentCount); // 查询评论数
  router.post('/bbsdev/deleteComment', controller.bbsComment.deleteCommentInfo); // 删除评论

  router.post('/bbsdev/addReply', controller.bbsReply.addReplyInfo); // 发布回复
  router.post('/bbsdev/getReply', controller.bbsReply.getReplyInfo); // 查询回复
  router.post('/bbsdev/getPostReplyCount', controller.bbsReply.getPostReplyCount); // 查询文章回复数
  router.post('/bbsdev/deleteReply', controller.bbsReply.deleteReplyInfo); // 删除回复

  router.post('/bbsdev/addPraise', controller.bbsPraise.addPraiseInfo); // 点赞
  router.post('/bbsdev/deletePraise', controller.bbsPraise.deletePraiseInfo); // 取消点赞
  router.post('/bbsdev/getPraise', controller.bbsPraise.getPraiseInfo); // 查询点赞数
  router.post('/bbsdev/getPostPraise', controller.bbsPraise.getPostPraiseInfo); // 查询文章点赞数
  router.post('/bbsdev/getPersonalPraise', controller.bbsPraise.getPersonalPraiseInfo); // 查询个人点赞数

  router.post('/bbsdev/addFriends', controller.bbsFriends.addFriendsInfo); // 添加关注好友
  router.post('/bbsdev/deleteFriends', controller.bbsFriends.deleteFriendsInfo); // 取消关注好友
  router.post('/bbsdev/getFriends', controller.bbsFriends.getFriendsInfo); // 查询关注好友列表
  router.post('/bbsdev/updateFriends', controller.bbsFriends.updateFriendsInfo); // 更新关注好友

  router.post('/bbsdev/addTopics', controller.bbsTopics.addTopicsInfo); // 关注话题
  router.post('/bbsdev/deleteTopics', controller.bbsTopics.deleteTopicsInfo); // 取消关注话题
  router.post('/bbsdev/getTopics', controller.bbsTopics.getTopicsInfo); // 查询关注话题列表

  router.post('/bbsdev/addTag', controller.bbsTag.addTagInfo); // 查询标签列表
  router.post('/bbsdev/getTagList', controller.bbsTag.getTagInfo); // 查询标签列表
  router.post('/bbsdev/getArticleTagList', controller.bbsTag.recomendTagInfo); // 自动推荐资源标签

  router.post('/bbsdev/extractKeywords', controller.bbsJieba.extractKeywords); // 关键词抽取
};

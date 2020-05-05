'use strict';

const Service = require('egg').Service;

const nodejieba = require("nodejieba");

class BBSJiebaService extends Service {
  // 关键词提取
  async extractKeywords(params) {
    const { app } = this;
    try {
      var text = "南京市长江大桥，位于中国江苏省南京市，是一座著名的桥梁";
      var topN = 2;
      var result = nodejieba.extract(text, topN);
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }
}

module.exports = BBSJiebaService;

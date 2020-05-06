'use strict';

const Service = require('egg').Service;

const nodejieba = require('nodejieba');

class BBSJiebaService extends Service {
  // 关键词提取
  async extractKeywords(params) {
    try {
      const text = params.text;
      const topN = params.topN;
      const result = nodejieba.extract(text, topN);
      return result;
    } catch (err) {
      console.log(err);
      return null;
    }
  }
}

module.exports = BBSJiebaService;

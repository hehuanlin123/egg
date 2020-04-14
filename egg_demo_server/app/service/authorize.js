'use strict';

const Service = require('egg').Service;

const config = require('../../config/config.default');
const crypto = require('crypto');

class ArticleService extends Service {
  async _config(params) {
    try {
      const signature = params.signature;
      const timestamp = params.timestamp;
      const echostr = params.echostr;
      const nonce = params.nonce;
      // g
      const arr = [ config.token, timestamp, nonce ].sort();
      // sha1加密
      const str = arr.join('');
      const hashCode = crypto.createHash('sha1');
      const result = hashCode.update(str).digest('hex');
      // 对比后返回结果
      if (result === signature) {
        return echostr;
      }
      return '';
    } catch (err) {
      console.log(err);
      return null;
    }
  }
}

module.exports = ArticleService;

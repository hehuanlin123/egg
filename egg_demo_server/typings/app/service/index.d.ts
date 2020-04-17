// This file is created by egg-ts-helper@1.25.6
// Do not modify this file!!!!!!!!!

import 'egg';
import ExportArticle = require('../../../app/service/article');
import ExportAuthorize = require('../../../app/service/authorize');
import ExportBbsArticle = require('../../../app/service/bbsArticle');
import ExportBbsTag = require('../../../app/service/bbsTag');
import ExportBbsUser = require('../../../app/service/bbsUser');
import ExportHome = require('../../../app/service/home');

declare module 'egg' {
  interface IService {
    article: ExportArticle;
    authorize: ExportAuthorize;
    bbsArticle: ExportBbsArticle;
    bbsTag: ExportBbsTag;
    bbsUser: ExportBbsUser;
    home: ExportHome;
  }
}

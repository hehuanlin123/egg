// This file is created by egg-ts-helper@1.25.6
// Do not modify this file!!!!!!!!!

import 'egg';
import ExportArticle = require('../../../app/controller/article');
import ExportAuthorize = require('../../../app/controller/authorize');
import ExportBbsArticle = require('../../../app/controller/bbsArticle');
import ExportBbsComment = require('../../../app/controller/bbsComment');
import ExportBbsPraise = require('../../../app/controller/bbsPraise');
import ExportBbsTag = require('../../../app/controller/bbsTag');
import ExportBbsUser = require('../../../app/controller/bbsUser');
import ExportHome = require('../../../app/controller/home');

declare module 'egg' {
  interface IController {
    article: ExportArticle;
    authorize: ExportAuthorize;
    bbsArticle: ExportBbsArticle;
    bbsComment: ExportBbsComment;
    bbsPraise: ExportBbsPraise;
    bbsTag: ExportBbsTag;
    bbsUser: ExportBbsUser;
    home: ExportHome;
  }
}

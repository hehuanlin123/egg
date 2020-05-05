// This file is created by egg-ts-helper@1.25.6
// Do not modify this file!!!!!!!!!

import 'egg';
import ExportArticle = require('../../../app/controller/article');
import ExportAuthorize = require('../../../app/controller/authorize');
import ExportBbsArticle = require('../../../app/controller/bbsArticle');
import ExportBbsComment = require('../../../app/controller/bbsComment');
import ExportBbsFriends = require('../../../app/controller/bbsFriends');
import ExportBbsJieba = require('../../../app/controller/bbsJieba');
import ExportBbsPraise = require('../../../app/controller/bbsPraise');
import ExportBbsReply = require('../../../app/controller/bbsReply');
import ExportBbsTag = require('../../../app/controller/bbsTag');
import ExportBbsTopics = require('../../../app/controller/bbsTopics');
import ExportBbsUser = require('../../../app/controller/bbsUser');
import ExportHome = require('../../../app/controller/home');

declare module 'egg' {
  interface IController {
    article: ExportArticle;
    authorize: ExportAuthorize;
    bbsArticle: ExportBbsArticle;
    bbsComment: ExportBbsComment;
    bbsFriends: ExportBbsFriends;
    bbsJieba: ExportBbsJieba;
    bbsPraise: ExportBbsPraise;
    bbsReply: ExportBbsReply;
    bbsTag: ExportBbsTag;
    bbsTopics: ExportBbsTopics;
    bbsUser: ExportBbsUser;
    home: ExportHome;
  }
}

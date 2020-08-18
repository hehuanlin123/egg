// This file is created by egg-ts-helper@1.25.6
// Do not modify this file!!!!!!!!!

import 'egg';
import ExportArticle = require('../../../app/service/article');
import ExportAuthorize = require('../../../app/service/authorize');
import ExportBbsArticle = require('../../../app/service/bbsArticle');
import ExportBbsAttachment = require('../../../app/service/bbsAttachment');
import ExportBbsComment = require('../../../app/service/bbsComment');
import ExportBbsFriends = require('../../../app/service/bbsFriends');
import ExportBbsJieba = require('../../../app/service/bbsJieba');
import ExportBbsPraise = require('../../../app/service/bbsPraise');
import ExportBbsReply = require('../../../app/service/bbsReply');
import ExportBbsTag = require('../../../app/service/bbsTag');
import ExportBbsTopics = require('../../../app/service/bbsTopics');
import ExportBbsUser = require('../../../app/service/bbsUser');
import ExportHome = require('../../../app/service/home');

declare module 'egg' {
  interface IService {
    article: ExportArticle;
    authorize: ExportAuthorize;
    bbsArticle: ExportBbsArticle;
    bbsAttachment: ExportBbsAttachment;
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

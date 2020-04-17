// This file is created by egg-ts-helper@1.25.6
// Do not modify this file!!!!!!!!!

import 'egg';
import ExportArticle = require('../../../app/service/article');
import ExportAuthorize = require('../../../app/service/authorize');
import ExportHome = require('../../../app/service/home');

declare module 'egg' {
  interface IService {
    article: ExportArticle;
    authorize: ExportAuthorize;
    home: ExportHome;
  }
}
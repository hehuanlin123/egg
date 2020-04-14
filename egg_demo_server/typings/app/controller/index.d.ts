// This file is created by egg-ts-helper@1.25.6
// Do not modify this file!!!!!!!!!

import 'egg';
import ExportArticle = require('../../../app/controller/article');
import ExportAuthorize = require('../../../app/controller/authorize');
import ExportHome = require('../../../app/controller/home');

declare module 'egg' {
  interface IController {
    article: ExportArticle;
    authorize: ExportAuthorize;
    home: ExportHome;
  }
}

/* eslint valid-jsdoc: "off" */

'use strict';

/**
 * @param {Egg.EggAppInfo} appInfo app info
 */
module.exports = appInfo => {
  /**
   * built-in config
   * @type {Egg.EggAppConfig}
   **/
  const config = exports = {};

  // use for cookie sign key, should change to your own and keep security
  config.keys = appInfo.name + '_1582372204382_8462';

  // add your middleware config here
  config.middleware = [];

  config.security = {
    // 跨域请求伪造
    csrf: {
      enable: false,
    },
  };

  config.view = {
    mapping: {
      '.html': 'ejs',
    },
  };

  config.mysql = {
    client: {
      host: 'localhost',
      port: '3306',
      user: 'root',
      password: '131414he',
      database: 'egg_demo',
    },
    app: true,
    agent: false,
  };

  // 微信token
  config.token = '';

  // static files and cache files
  // config.static = {
  //   // 静态化访问前缀,如：`http://127.0.0.1:7001/static/images/logo.png`
  //   prefix: '/assets',
  //   dir: path.join(appInfo.baseDir, 'app/public'), // `String` or `Array:[dir1, dir2, ...]` 静态化目录,可以设置多个静态化目录
  //   dynamic: true, // 如果当前访问的静态资源没有缓存，则缓存静态文件，和`preload`配合使用；
  //   preload: false,
  //   maxAge: 31536000, // in prod env, 0 in other envs
  //   buffer: true, // in prod env, false in other envs
  // };

  // add your user config here
  const userConfig = {
    // myAppName: 'egg',
  };

  return {
    ...config,
    ...userConfig,
  };
};

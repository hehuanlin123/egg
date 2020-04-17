const path = require('path');
const MiniCssExtractPlugin = require("mini-css-extract-plugin");        //提取成单个css文件
const OptimizeCssAssetsPlugin = require('optimize-css-assets-webpack-plugin');      //压缩css插件
const HtmlWebpackPlugin = require('html-webpack-plugin');       //html文件打包，压缩
const CleanWebpackPlugin = require("clean-webpack-plugin");     //删除原来的打包文件
const copyWebpackPlugin = require("copy-webpack-plugin");     //复制静态文件

module.exports = {
    mode: 'development',
    entry: {        //入口文件
        index: './src/js/index.js',
    },
    output: {       //出口文件
        publicPath: '',     //模板、样式、脚本、图片等资源的路径中统一会加上额外的路径
        path: path.resolve(__dirname, 'dist'),
        filename: './js/[name].[hash:8].js'
    },
    module: {
        rules: [
            {
                test: /\.html$/,
                use: {
                    loader: 'html-loader',
                    options: {

                    }
                }
            },
            {
                test: /\.js$/,
                // exclude: /node_modules/,
                exclude: path.resolve(__dirname, 'node_modules'), //编译时，不需要编译哪些文件
                //include: path.resolve(__dirname, 'src'),//在config中查看 编译时，需要包含哪些文件
                loader: 'babel-loader',
                query: {
                    presets: ['latest'] //按照最新的ES6语法规则去转换
                }
            },
            {
                test: /\.css$/,
                use: [
                    // {loader: "style-loader"},        //在页面内嵌入css
                    {
                        loader: MiniCssExtractPlugin.loader,
                        options: {
                            // 这里可以指定一个 publicPath
                            // 默认使用 webpackOptions.output中的publicPath
                            publicPath: '../'
                        }
                    },      //单独抽离css
                    {loader: "css-loader"},
                    {       //自动添加前缀
                        loader: "postcss-loader",
                        options: {
                            plugins: [
                                require("autoprefixer")
                            ]
                        }
                    }
                ]
            },
            {
                test: /\.(png|jpe?g|gif|svg)(\?.*)?$/,
                loader: 'url-loader',
                options: {
                    limit: 100,
                    name: './img/[name].[hash:7].[ext]',
                }
            },
        ]
    },
    plugins: [
        new CleanWebpackPlugin(),       //删除上次打包文件，默认目录'./dist'
        new copyWebpackPlugin([{        //静态资源输出,将src目录下的assets文件夹复制到dist目录下
            from: path.join(__dirname, "./src/assets"),
            to: path.join(__dirname, "./dist/assets"),
        }]),
        new MiniCssExtractPlugin({
            filename: "./css/[name].[hash:8].css"
        }),
        new OptimizeCssAssetsPlugin(),      //压缩css文件
        new HtmlWebpackPlugin({
            favicon: './src/img/favicon.ico',      //图标
            template: './src/index.html',      //指定要打包的html
            filename:'index.html',       //指定输出路径和文件名
            minify: {       //压缩
                removeComments: true,       //移除HTML中的注释
                collapseWhitespace:true,        //删除空白符与换行符
                removeAttributeQuotes: true        //去除属性引用
            }
        }),
        // new HtmlWebpackPlugin(//打包第二个页面
        //     {
        //         template: './app/src/page/index2.html',
        //         filename:'./page/index2.html'
        //     }
        // )
    ]
};
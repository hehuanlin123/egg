module.exports = {
    devServer:{
        proxy:{
            '/bbsdev':{
                target:'http://localhost:7001',
                ws:true, //开启websocket服务
                changeOrigin: true //开启虚拟服务请求代理服务器
            },
            '/article':{
                target:'http://localhost:7001',
                ws:true, //开启websocket服务
                changeOrigin: true //开启虚拟服务请求代理服务器
            }
        }
    },
    
};
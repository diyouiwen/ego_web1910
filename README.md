依赖：
    axios、element-ui
同时执行与服务器自动更新： 
    npm install -g concurrently  nodemon
百度UEditor参考地址：https://github.com/HaoChuan9421/vue-ueditor-wrap


联调(对接口):
    联合调试，前台和后台一起联合调试接口
    可能出现的问题：
        1.路劲不同
        2.字段不同
        3.由于业务导致的字段缺少或者冗余
        4.由于测试数据不够真实化导致的UI格式变形等
    注意：与后台积极沟通

真实开发场景：
    1.全新的项目
        前台和后台都是从零开的开发，所以此时我们需要自己模拟数据做处理，为了数据的真实性，大部分的情况就如我们之前所写一样进行数据的数据
        前期准备：
            1.前后台沟通：确定数据格式
            2.确定路径格式：/backend/item/selectTbItemAllByPage(数据字典)
    2.老项目的维护
        前台的重构：我们不需要自己处理数据，后台数据时已经准备好的，可以直接使用

    // http://mockjs.com/ 
    React Dva -> 数据模拟方式  mock.js

    修改
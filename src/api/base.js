const base = {
    // baseUrl:"/api", // 本地测试地址
    baseUrl:"/iwen_api", // 服务器地址
    login:"/login",
    selectTbItemAllByPage:"/backend/item/selectTbItemAllByPage", // 商品查询地址
    total:"/total", // product总条数
    selectItemCategoryByParentId:"/backend/itemCategory/selectItemCategoryByParentId", // 类目查询接
    insertTbItem:"/backend/item/insertTbItem", // 添加产品
    deleteItemById:"/backend/item/deleteItemById", // 删除产品
    preUpdateItem:"/backend/item/preUpdateItem", // 预更新
    updateTbItem:"/backend/item/updateTbItem", // 更新产品
    selectItemParamAll:"/backend/itemParam/selectItemParamAll", // 规格参数查询
    insertItemParam:"/backend/itemParam/insertItemParam", // 规格参数添加
    deleteItemParamById:"/backend/itemParam/deleteItemParamById", // 规格参数删除
    selectContentCategoryByParentId:"/content/selectContentCategoryByParentId", // 内容分类管理查询
    insertContentCategory:"/content/insertContentCategory", // 内容分类管理的导航添加
    deleteContentCategoryById:"/content/deleteContentCategoryById", //内容分类管理导航删除
    updateContentCategory:"/content/updateContentCategory", // 内容分类管理导航修改
    selectTbContentAllByCategoryId:"/content/selectTbContentAllByCategoryId", // 内容分类管理内容查询
    insertTbContent:"/content/insertTbContent", // 内容分类管理 内容添加
    deleteContentByIds:"/content/deleteContentByIds" // 内容分类管理 内容删除
} 

export default base;
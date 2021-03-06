import axios from "../utils/request"
import base from "./base"

const api = {
    /**
     * 登陆接口
     */
    getLogin(params) {
        return axios.post(base.baseUrl + base.login, params);
    },
    /**
     * 商品查询接口
     */
    getSelectTbItemAllByPage(params) {
        return axios.get(base.baseUrl + base.selectTbItemAllByPage, {
            params: params
        })
    },
    /**
     * 商品总条数
     */
    getTotal() {
        return axios.get(base.baseUrl + base.total);
    },
    /**
     * 类目查询接口
     */
    getSelectItemCategoryByParentId(params) {
        return axios.get(base.baseUrl + base.selectItemCategoryByParentId, {
            params: params
        })
    },
    /**
     * 添加产品接口
     */
    getInsertTbItem(params) {
        return axios.get(base.baseUrl + base.insertTbItem, {
            params
        })
    },
    /**
     * 删除产品接口
     */
    getDeleteItemById(params) {
        return axios.get(base.baseUrl + base.deleteItemById, {
            params
        })
    },
    /**
     * 预更新接口
     */
    getPreUpdateItem(params){
        return axios.get(base.baseUrl + base.preUpdateItem, {
            params
        })
    },
    /**
     * 更新产品
     */
    getUpdateTbItem(params){
        return axios.get(base.baseUrl + base.updateTbItem, {
            params
        })
    },
    /**
     * selectItemParamAll
     */
    getSelectItemParamAll(data){
        return axios.get(base.baseUrl + base.selectItemParamAll,{
            params:data
        })
    },
    /**
     * 规格参数添加接口
     */
    getInsertItemParam(params){
        return axios.get(base.baseUrl + base.insertItemParam,{
            params
        })
    },
    /**
     * 规格参数删除
     */
    getDeleteItemParamById(params){
        return axios.get(base.baseUrl + base.deleteItemParamById,{
            params
        })
    },
    /**
     * 内容分类管理查询接口
     */
    getSelectContentCategoryByParentId(params){
        return axios.get(base.baseUrl + base.selectContentCategoryByParentId,{
            params
        })
    },
    /**
     * 内容分类管理导航添加接口
     */
    getInsertContentCategory(params){
        return axios.get(base.baseUrl + base.insertContentCategory,{
            params
        })
    },
    /**
     * 内容分类管理导航删除接口
     */
    getDeleteContentCategoryById(params){
        return axios.get(base.baseUrl + base.deleteContentCategoryById,{
            params
        })
    },
    /**
     * 内容分类管理导航修改接口
     */
    getUpdateContentCategory(params){
        return axios.get(base.baseUrl + base.updateContentCategory,{
            params
        })
    },
    /**
     * 内容分类管理接口
     */
    getSelectTbContentAllByCategoryId(params){
        return axios.get(base.baseUrl + base.selectTbContentAllByCategoryId,{
            params
        })
    },
    /**
     * 内容分类管理 内容添加
     */
    getInsertTbContent(params){
        return axios.get(base.baseUrl + base.insertTbContent,{
            params
        })
    },
    /**
     * 内容分类管理 内容删除
     */
    getDeleteContentByIds(params){
        return axios.get(base.baseUrl + base.deleteContentByIds,{
            params
        })
    }
}

export default api
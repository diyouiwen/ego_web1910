<template>
    <div class="product-list">
        <div>
            <el-button type="primary" @click="addProduct">添加商品</el-button>
        </div>
        <element-table :tableData="tableData">
            <el-table-column show-overflow-tooltip prop="id" label="商品id"></el-table-column>
            <el-table-column show-overflow-tooltip prop="title" label="商品名称"></el-table-column>
            <el-table-column show-overflow-tooltip prop="image" label="商品图片"></el-table-column>
            <el-table-column show-overflow-tooltip prop="sellPoint" label="商品卖点"></el-table-column>
            <el-table-column show-overflow-tooltip prop="price" label="商品价格"></el-table-column>
            <el-table-column show-overflow-tooltip prop="num" label="商品数量"></el-table-column>
            <el-table-column show-overflow-tooltip width="300px" prop="descs" label="商品描述"></el-table-column>
            <el-table-column label="操作" width="150px">
                <template slot-scope="scope">
                    <el-button size="mini" @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
                    <el-button
                        size="mini"
                        type="danger"
                        @click="handleDelete(scope.$index, scope.row)"
                    >删除</el-button>
                </template>
            </el-table-column>
        </element-table>
        <!-- 分页 -->
        <ProductPagination @currentPageEvent="getCurrentPageData" />
        <!-- 添加产品对话框 -->
        <el-dialog title="添加产品" append-to-body :visible.sync="dialogAddProductVisible" width="80%">
            <!-- 商品类目选择 -->
            <el-dialog
                width="60%"
                title="商品类目"
                :visible.sync="dialogProductCategoryVisible"
                append-to-body
            >
                <ProductTree @onTreeData="getTreeData" />
                <span>
                    <el-button type="primary" @click="dialogProductCategoryVisible = false">确定</el-button>
                </span>
            </el-dialog>

            <el-form ref="form" :model="product" label-width="80px">
                <el-form-item label="商品类目">
                    <el-button style="float:left" type="primary" @click="productTreeHandle">选择类目</el-button>
                    <span style="float:left;margin-left:20px;">{{ treeData.name }}</span>
                </el-form-item>
                <el-form-item label="商品标题">
                    <el-input v-model="product.title"></el-input>
                </el-form-item>
                <el-form-item label="商品买点">
                    <el-input v-model="product.sellPoint"></el-input>
                </el-form-item>
                <el-form-item label="商品价格">
                    <el-input v-model="product.price"></el-input>
                </el-form-item>
                <el-form-item label="库存数量">
                    <el-input v-model="product.num"></el-input>
                </el-form-item>
                <el-form-item label="上传图片">
                    <el-button @click="uploadHandle" style="float:left" type="primary">上传图片</el-button>
                    <span>{{ uploadImg.url }}</span>
                    <el-dialog
                        title="上传图片"
                        :visible.sync="dialogUploadImgVisible"
                        width="40%"
                        append-to-body
                        :before-close="handleClose"
                    >
                        <ProductUpLoad @onUpload="getUpload" />
                        <span slot="footer" class="dialog-footer">
                            <el-button @click="dialogUploadImgVisible = false">取 消</el-button>
                            <el-button type="primary" @click="dialogUploadImgVisible = false">确 定</el-button>
                        </span>
                    </el-dialog>
                </el-form-item>
                <el-form-item label="商品描述">
                    <ProductUEditor @onProductDesc="getProductDesc" />
                </el-form-item>
            </el-form>
            <el-button @click="dialogAddProductVisible = false">取 消</el-button>
            <el-button type="primary" @click="submitProductHandle">提 交</el-button>
        </el-dialog>

        <!-- 修改产品 -->
        <el-dialog
            title="更新产品"
            append-to-body
            :visible.sync="dialogUpdateProductVisible"
            width="80%"
        >
            <!-- 商品类目选择 -->
            <el-dialog
                width="60%"
                title="商品类目"
                :visible.sync="dialogProductCategoryVisible"
                append-to-body
            >
                <ProductTree @onTreeData="getTreeData" />
                <span>
                    <el-button type="primary" @click="dialogProductCategoryVisible = false">确定</el-button>
                </span>
            </el-dialog>

            <el-form ref="form" :model="updateProduct" label-width="80px">
                <el-form-item label="商品类目">
                    <el-button style="float:left" type="primary" @click="productTreeHandle">选择类目</el-button>
                    <span style="float:left;margin-left:20px;">{{ treeData.name }}</span>
                </el-form-item>
                <el-form-item label="商品标题">
                    <el-input v-model="updateProduct.title"></el-input>
                </el-form-item>
                <el-form-item label="商品买点">
                    <el-input v-model="updateProduct.sellPoint"></el-input>
                </el-form-item>
                <el-form-item label="商品价格">
                    <el-input v-model="updateProduct.price"></el-input>
                </el-form-item>
                <el-form-item label="库存数量">
                    <el-input v-model="updateProduct.num"></el-input>
                </el-form-item>
                <el-form-item label="上传图片">
                    <el-button @click="uploadHandle" style="float:left" type="primary">上传图片</el-button>
                    <span>{{ uploadImg.url }}</span>
                    <el-dialog
                        title="上传图片"
                        :visible.sync="dialogUploadImgVisible"
                        width="40%"
                        append-to-body
                        :before-close="handleClose"
                    >
                        <ProductUpLoad @onUpload="getUpload" />
                        <span slot="footer" class="dialog-footer">
                            <el-button @click="dialogUploadImgVisible = false">取 消</el-button>
                            <el-button type="primary" @click="dialogUploadImgVisible = false">确 定</el-button>
                        </span>
                    </el-dialog>
                </el-form-item>
                <el-form-item label="商品描述">
                    <ProductUEditor
                        @onProductDesc="getProductDesc"
                        :updateProdcutDesc="updateProdcutDesc"
                    />
                </el-form-item>
            </el-form>
            <el-button @click="dialogUpdateProductVisible = false">取 消</el-button>
            <el-button type="primary" @click="updateProductHandle">更 新</el-button>
        </el-dialog>
    </div>
</template>
<script>
import ElementTable from "../../../components/element-table";
import ProductPagination from "../ProductPagination";
import ProductUEditor from "../ProductUEditor";
import ProductUpLoad from "../ProductUpload";
import ProductTree from "../ProductTree";

export default {
    name: "ProductList",
    data() {
        return {
            tableData: [],
            page: 1,
            dialogAddProductVisible: false,
            dialogUploadImgVisible: false,
            dialogProductCategoryVisible: false,
            product: {},
            uploadImg: {},
            treeData: {},
            productDesc: "",
            // 修改数据
            updateProduct: {},
            dialogUpdateProductVisible: false,
            updateProdcutDesc: "",
            updateId: 0
        };
    },
    components: {
        ElementTable,
        ProductPagination,
        ProductUEditor,
        ProductUpLoad,
        ProductTree
    },
    mounted() {
        this.http(this.page);
    },
    methods: {
        http(page) {
            this.$api
                .getSelectTbItemAllByPage({
                    page: page
                })
                .then(res => {
                    if (res.data.status == 200) {
                        this.tableData = res.data.data.result;
                    } else {
                        console.log("暂无数据");
                    }
                });
        },
        /**
         * 分页
         */
        getCurrentPageData(page) {
            this.http(page);
        },
        /**
         * 添加商品
         */
        addProduct() {
            this.dialogAddProductVisible = true;
        },
        /**
         * 商品描述
         */
        getProductDesc(desc) {
            this.productDesc = desc;
        },
        /**
         * 上传图片
         */
        uploadHandle() {
            this.dialogUploadImgVisible = true;
        },
        handleClose() {
            this.dialogUploadImgVisible = false;
        },
        /**
         * 获取上传图片资源
         */
        getUpload(data) {
            this.uploadImg = data;
        },
        /**
            类目选择事件
         */
        productTreeHandle() {
            this.dialogProductCategoryVisible = true;
        },
        /**
         * 获取tree数据
         */
        getTreeData(data) {
            this.treeData = data;
        },
        /**
         * 添加产品事件
         */
        submitProductHandle() {
            this.$api
                .getInsertTbItem({
                    title: this.product.title,
                    cid: this.treeData.cid,
                    sellPoint: this.product.sellPoint,
                    price: this.product.price,
                    num: this.product.num,
                    desc: this.productDesc,
                    image: this.uploadImg.url
                })
                .then(res => {
                    if (res.data.status === 200) {
                        this.http(this.page);
                        this.dialogAddProductVisible = false;
                    } else {
                        alert("添加失败");
                    }
                });
        },
        /**
         * 商品编辑
         *  后台系统应该是有很多人都在用，可能会出现一种情况
         *      多人同时修改同一条数据,为了避免多此修改的误操作
         *      我们需要在修改之前查看数据是被否发生变化
         *
         */
        handleEdit(index, row) {
            // 重新获取本条数据，将重新获取的数据放入到修改框中
            this.dialogUpdateProductVisible = true;
            this.updateId = row.id;
            this.$api
                .getPreUpdateItem({
                    id: row.id
                })
                .then(res => {
                    if (res.data.status === 200) {
                        this.updateProduct = {
                            title: res.data.data.title,
                            num: res.data.data.num,
                            price: res.data.data.price,
                            sellPoint: res.data.data.sellPoint
                        };
                        this.uploadImg.url = res.data.data.image;
                        this.treeData.name = res.data.data.cid;
                        this.updateProdcutDesc = res.data.data.descs;
                    }
                });
        },
        /**
         * 产品删除
         */
        handleDelete(index, row) {
            this.$confirm("此操作将永久删除该文件, 是否继续?", "提示", {
                confirmButtonText: "确定",
                cancelButtonText: "取消",
                type: "warning"
            })
                .then(() => {
                    this.$api
                        .getDeleteItemById({
                            id: row.id
                        })
                        .then(res => {
                            if (res.data.status === 200) {
                                this.http(this.page);
                                this.$message({
                                    type: "success",
                                    message: "删除成功!"
                                });
                            } else {
                                this.$message({
                                    type: "info",
                                    message: "删除失败"
                                });
                            }
                        });
                })
                .catch(() => {
                    this.$message({
                        type: "info",
                        message: "已取消删除"
                    });
                });
        },
        /**
         * 更新数据事件
         */
        updateProductHandle() {
            this.$api
                .getUpdateTbItem({
                    id: this.updateId,
                    title: this.updateProduct.title,
                    cid: this.treeData.cid,
                    sellPoint: this.updateProduct.sellPoint,
                    price: this.updateProduct.price,
                    num: this.updateProduct.num,
                    desc: this.productDesc,
                    image: this.uploadImg.url
                })
                .then(res => {
                    if(res.data.status === 200){
                        this.http(this.page);
                        this.dialogUpdateProductVisible = false;
                    }else{
                        alert("修改失败")
                    }
                });
        }
    }
};
</script>
<style scoped>
.product-list {
    width: 1200px;
    margin: 0 auto;
    margin-top: 10px;
}
.upload-img {
    width: 200px;
    float: left;
    margin-left: 10px;
}
</style>
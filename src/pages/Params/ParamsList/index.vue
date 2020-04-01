<template>
    <div class="params">
        <div>
            <el-button type="primary" @click="addParamsHandle">添加规格参数</el-button>
        </div>
        <ElementTable :tableData="paramsData">
            <el-table-column show-overflow-tooltip prop="id" label="规格参数ID"></el-table-column>
            <el-table-column show-overflow-tooltip prop="itemCatId" label="分类ID"></el-table-column>
            <el-table-column show-overflow-tooltip width="800px" prop="paramData" label="规格参数结构"></el-table-column>
            <el-table-column label="操作" width="120" fiexd="right">
                <template slot-scope="scope">
                    <el-button
                        size="mini"
                        type="danger"
                        @click="handleDelete(scope.$index, scope.row)"
                    >删除</el-button>
                </template>
            </el-table-column>
        </ElementTable>
        <!-- 添加规格参数 -->
        <el-dialog width="50%" title="商品类目选择" :visible.sync="paramsVisible">
            <ParamsTree @onTreeData="getTreeData" />
            <el-dialog append-to-body width="50%" title="添加分组" :visible.sync="groupVisible">
                <ParamsAdd @onParamsAdd="getParamsAdd" />
            </el-dialog>
            <div slot="footer" class="dialog-footer">
                <el-button @click="paramsVisible = false">取 消</el-button>
                <el-button type="primary" @click="groupVisibleHandle">确定并添加分组</el-button>
            </div>
        </el-dialog>
    </div>
</template>
<script>
import ElementTable from "@/components/element-table";
import ParamsTree from "../ParamsTree";
import ParamsAdd from "../ParamsAdd";

/**
 * 作业：给规格参数增加一个分页处理
 *  1.后天要有分页总数接口
 *  2.每页显示10条数据
 *  3.如果用户每次添加完数据，判断当页面所在页码，不修改页码
 */

export default {
    name: "ParamsList",
    data() {
        return {
            paramsData: [],
            currentPage: 1,
            paramsVisible: false,
            groupVisible: false,
            itemCatId: {}
        };
    },
    components: {
        ElementTable,
        ParamsTree,
        ParamsAdd
    },
    mounted() {
        this.http();
    },
    methods: {
        http() {
            this.$api
                .getSelectItemParamAll({
                    page: this.currentPage
                })
                .then(res => {
                    if (res.data.status == 200) {
                        this.paramsData = res.data.data.result;
                    } else {
                        alert(res.data.msg);
                    }
                });
        },
        /**
         * 添加规格参数
         */
        addParamsHandle() {
            this.paramsVisible = true;
        },
        /**
         * tree回传数据
         */
        getTreeData(data) {
            this.itemCatId = data;
        },
        /**
         * 添加分组事件
         */
        groupVisibleHandle() {
            this.groupVisible = true;
        },
        /**
         * 获取表单数据
         */
        getParamsAdd(data) {
            /**
             * 提交数据
             */
            this.$api
                .getInsertItemParam({
                    itemCatId: this.itemCatId.id,
                    paramData: data
                })
                .then(res => {
                    if (res.data.status === 200) {
                        /**
                         * 关闭弹出框
                         * 刷新页面
                         */
                        this.paramsVisible = false;
                        this.groupVisible = false;
                        this.http();
                    } else {
                        console.log(res.data.msg);
                    }
                });
        },
        handleDelete(index, row) {
            this.$confirm("此操作将永久删除该文件, 是否继续?", "提示", {
                confirmButtonText: "确定",
                cancelButtonText: "取消",
                type: "warning"
            })
                .then(() => {
                    this.$api
                        .getDeleteItemParamById({
                            id: row.id
                        })
                        .then(res => {
                            if (res.data.status === 200) {
                                this.$message({
                                    type: "success",
                                    message: "删除成功!"
                                });
                                this.http();
                            } else {
                                this.$message({
                                    type: "error",
                                    message: res.data.msg
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
        }
    }
};
</script>
<style scoped>
.params {
    width: 1200px;
    margin: 0 auto;
    margin-top: 10px;
}
</style>
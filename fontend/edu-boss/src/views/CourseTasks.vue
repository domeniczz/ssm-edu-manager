<template>
  <section class="course-tasks">
    <!-- 头部 -->
    <div class="header">
      <!-- 显示当前课程的名称 -->
      <el-page-header
        @back="() => this.$router.back()"
        :content="addSectionForm.course_name"
      />

      <!-- 添加章节按钮 -->
      <el-button
        type="primary"
        icon="el-icon-plus"
        @click="handleShowAddSection"
        >添加章节</el-button
      >
    </div>

    <!-- 树形控件,展示课程对应的章节信息 -->
    <el-tree
      :data="sections"
      :props="treeProps"
      v-loading="loading"
      element-loading-text="数据加载中..."
    >
      <!-- slot-scope:代表当前树节点内容,有两个参数 data表示当前树节点, node表示当前节点状态 -->
      <div class="inner" slot-scope="{ data, node }">
        <span>{{ data.section_name || data.theme }}</span>

        <!-- 操作按钮 -->
        <span class="actions">
          <!-- 编辑章节  @click.stop 阻止事件冒泡 -->
          <el-button
            v-if="node.level == 1"
            size="small"
            @click.stop="handleEditSection(data)"
            >编辑</el-button
          >

          <!-- 修改章节状态 -->
          <el-button
            v-if="node.level == 1"
            size="small"
            @click.stop="showStatus(data)"
            >{{ statusMapping[data.status] }}</el-button
          >
        </span>
      </div>
    </el-tree>
    <!-- 树形控件,展示课程对应的章节信息 -->

    <!-- 修改章节状态-对话框 -->
    <el-dialog
      class="toggle-dialog"
      title="提示"
      :visible.sync="showStatusForm"
      width="30%"
    >
      <header class="toggle-header">
        <i class="el-icon-info"></i>
        <span>
          当前状态：{{
            statusForm.data && statusMapping[statusForm.data.status]
          }}
        </span>
      </header>
      <br />
      <el-form label-position="right" label-width="110px" :model="statusForm">
        <el-form-item label="状态变更为：">
          <el-select
            @change="$forceUpdate()"
            v-model="statusForm.status"
            style="width: 100%"
          >
            <el-option
              v-for="(item, index) in Object.keys(statusMapping)"
              :key="index"
              :label="statusMapping[item]"
              :value="item"
            ></el-option>
          </el-select>
        </el-form-item>
      </el-form>

      <span slot="footer" class="dialog-footer">
        <el-button @click="showStatusForm = false">取 消</el-button>
        <el-button type="primary" @click="updateStatus">确 定</el-button>
      </span>
    </el-dialog>
    <!-- 修改章节状态 -->

    <!-- 添加或修改章节 -->
    <el-dialog
      class="add-dialog"
      title="章节信息"
      :visible.sync="showAddSection"
    >
      <el-form
        label-position="right"
        label-width="80px"
        ref="addSectionForm"
        :model="addSectionForm"
      >
        <el-form-item label="课程名称" prop="course_name">
          <el-input
            v-model.trim="addSectionForm.course_name"
            disabled
          ></el-input>
        </el-form-item>
        <el-form-item label="章节名称" prop="section_name">
          <el-input v-model.trim="addSectionForm.section_name"></el-input>
        </el-form-item>
        <el-form-item label.trim="章节描述" prop="description">
          <el-input
            type="textarea"
            v-model="addSectionForm.description"
          ></el-input>
        </el-form-item>
        <el-form-item label="章节排序" prop="order_num">
          <el-input v-model.number="addSectionForm.order_num" type="number">
            <template slot="append">数字越大，排序越靠后</template>
          </el-input>
        </el-form-item>
      </el-form>

      <span slot="footer" class="dialog-footer">
        <el-button @click="showAddSection = false">取 消</el-button>
        <el-button type="primary" @click="handleAddSection">确 定</el-button>
      </span>
    </el-dialog>
    <!-- 添加或修改章节 -->
  </section>
</template>

<script>
//引入axios
import { axios } from "../utils";

export default {
  name: "CourseTasks",
  title: "课程结构",
  data() {
    //定义章节信息
    const addSectionForm = {
      course_id: undefined,
      course_name: "",
      section_name: "",
      description: "",
      order_num: 0
    };

    //章节与课时信息,树形结构
    const treeProps = {
      label: item => {
        return item.section_name || item.theme;
      },
      children: "lessonList"
    };

    //定义章节状态信息
    const statusMapping = {
      0: "已隐藏",
      1: "待更新",
      2: "已更新"
    };

    const statusForm = {
      id: undefined,
      status: 0,
      data: {}
    };

    return {
      addSectionForm,
      treeProps,
      sections: [],
      statusForm, //状态表单
      statusMapping,

      loading: false, //树形控件
      showAddSection: false, //添加或修改章节
      showStatusForm: false //状态修改
    };
  },
  created() {
    //1.显示当前页面在网站中的位置
    this.$breadcrumbs = [
      { name: "Courses", text: "课程管理" },
      { text: "课程结构" }
    ];

    //2. 从路由中获取传递的参数, 课程id
    const id = this.$route.params.courseId;
    if (!id) return this.redirectToError();

    //3.加载课程信息
    this.loadCourse(id);

    //4.加载课程对应的章节与课时
    this.loadChildren(id);
  },
  methods: {
    //方法1: 加载课程信息
    loadCourse(id) {
      axios
        .get("/courseContent", {
          params: {
            methodName: "findCourseById",
            course_id: id
          }
        })
        .then(res => {
          //把数据保存到表单对象中
          this.addSectionForm.course_id = res.data.id;
          this.addSectionForm.course_name = res.data.course_name;
        })
        .catch(error => {
          this.$message.error("课程名称获取失败！");
        });
    },

    //方法2: 加载树(章节与课时)
    loadChildren(id) {
      axios
        .get("/courseContent", {
          params: {
            methodName: "findSectionAndLessonByCourseId",
            course_id: id
          }
        })
        .then(res => {
          this.sections = res.data;
        })
        .catch(error => {
          this.$message.error("章节和课时信息获取失败！");
        });
    },

    //方法3: 显示添加章节表单,回显课程信息
    handleShowAddSection() {
      this.showAddSection = true;
    },

    //方法4: 添加&修改章节操作
    handleAddSection() {
      let form = this.addSectionForm;
      axios
        .post("/courseContent", {
          methodName: "saveOrUpdateSection",
          // section: this.addSectionForm
          id: form.id,
          course_id: form.course_id,
          section_name: form.section_name,
          description: form.description,
          order_num: form.order_num
        })
        .then(res => {
          if (0 === res.data.status) {
            this.$message.success("操作成功！");
          } else if (1 === res.data.status) {
            this.$message.error("操作失败！");
          }
          this.showAddSection = false;
          return this.loadChildren(this.addSectionForm.course_id);
        })
        .then(() => {
          form.section_name = "";
          form.description = "";
          form.order_id = 0;
        })
        .catch(error => {
          this.$message.error("出现异常！");
          this.showAddSection = false;
        });
    },

    //方法5: 修改章节回显方法
    handleEditSection(section) {
      // console.log(section);
      Object.assign(this.addSectionForm, section);
      this.showAddSection = true;
    },

    //方法6: 显示章节状态
    showStatus(data) {
      this.statusForm.id = data.id;
      this.statusForm.status = data.status.toString();
      this.statusForm.data = data;
      this.showStatusForm = true;
      console.log(this.statusForm);
    },

    //方法7: 修改章节状态
    updateStatus() {
      axios
        .get("/courseContent", {
          params: {
            methodName: "updateSectionStatus",
            id: this.statusForm.id,
            status: this.statusForm.status
          }
        })
        .then(res => {
          // this.statusForm.status;
          this.statusForm.data.status = this.statusForm.status;
          this.statusForm = {};
          this.showStatusForm = false;
        })
        .catch(err => {
          this.$message.error("状态修改失败！");
        });
    },

    //跳转到错误页面
    redirectToError() {
      this.$router.replace({ path: "/not-found" });
    }
  }
};
</script>

<style lang="scss">
.course-tasks {
  .header {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  .el-tree {
    margin-top: 20px;
  }

  .el-tree,
  .el-tree__empty-block {
    min-height: 200px;
  }

  .el-tree-node__content {
    height: auto;
  }

  .inner {
    display: flex;
    flex: 1 0 0;
    align-items: center;
    padding: 10px;
    border-bottom: 1px solid rgba(0, 0, 0, 0.05);
  }

  .actions {
    margin-left: auto;
  }
}
</style>

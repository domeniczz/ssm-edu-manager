package com.domenic.domain.permission;

/**
 * @author Domenic
 * @Description Resource 相关操作参数的封装类
 * @Date 10/1/2022 4:19 PM
 */
public class ResourceVo {

    // 当前的页码
    private Integer currentPage;

    // 每页显示记录条数
    private Integer pageSize;

    // 资源名称
    private String name;

    // 资源分类 id
    private Integer categoryId;

    // 资源路径
    private String url;

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "ResourceVo{" +
                "currentPage=" + currentPage +
                ", pageSize=" + pageSize +
                ", name='" + name + '\'' +
                ", categoryId=" + categoryId +
                ", url='" + url + '\'' +
                '}';
    }
}

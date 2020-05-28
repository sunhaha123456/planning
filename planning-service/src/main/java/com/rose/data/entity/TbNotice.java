package com.rose.data.entity;

import com.rose.common.data.base.BaseDataIdLong;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@lombok.Data
@Entity
@Table(name = "tb_notice")
public class TbNotice extends BaseDataIdLong {

    @Column(name = "title", columnDefinition = "VARCHAR(500) COMMENT '标题'")
    private String title;

    @Column(name = "content", columnDefinition = "text COMMENT '内容'")
    private String content;

    // 公告状态 0下架 1上架
    @Column(name = "status", columnDefinition = "TINYINT DEFAULT 0 COMMENT '公告状态'")
    private Integer status;

    @Column(name = "sort", columnDefinition = "BIGINT COMMENT '排序'")
    private Long sort;

    @Override
    public String toString() {
        return "TbNotice{" +
                "status=" + status +
                ", sort=" + sort +
                ", title='" + title + '\'' +
                '}';
    }
}
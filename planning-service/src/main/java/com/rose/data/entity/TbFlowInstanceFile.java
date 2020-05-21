package com.rose.data.entity;

import com.rose.common.data.base.BaseDataIdLong;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 描述：流程文件信息
 * @author sunpeng
 */
@ToString(callSuper = true)
@lombok.Data
@Entity
@Table(name = "tb_flow_instance_file")
public class TbFlowInstanceFile extends BaseDataIdLong {

    @Column(name = "instance_id", columnDefinition = "BIGINT COMMENT '实例id'")
    private Long instanceId;

    @Column(name = "old_file_name", columnDefinition = "VARCHAR(255) COMMENT '文件原名称'")
    private String oldFileName;

    @Column(name = "new_file_name", columnDefinition = "VARCHAR(255) COMMENT '文件新名称'")
    private String newFileName;

    @Column(name = "file_size", columnDefinition = "BIGINT COMMENT '文件大小，单位B'")
    private Long fileSize;
}
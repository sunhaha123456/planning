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

    @Column(name = "file_id", columnDefinition = "BIGINT COMMENT '文件id'")
    private Long fileId;
}
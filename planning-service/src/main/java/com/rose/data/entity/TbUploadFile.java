package com.rose.data.entity;

import com.rose.common.data.base.BaseDataIdLong;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@ToString(callSuper = true)
@lombok.Data
@Entity
@Table(name = "tb_upload_file")
public class TbUploadFile extends BaseDataIdLong {

    @Column(name = "upload_user_id", columnDefinition = "BIGINT COMMENT '上传文件用户id'")
    private Long uploadUserId;

    @Column(name = "old_file_name", columnDefinition = "VARCHAR(255) COMMENT '文件原名称'")
    private String oldFileName;

    @Column(name = "new_file_name", columnDefinition = "VARCHAR(255) COMMENT '文件新名称'")
    private String newFileName;
}
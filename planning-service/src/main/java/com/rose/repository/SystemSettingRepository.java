package com.rose.repository;

import com.rose.data.entity.TbFlowTemplate;
import com.rose.data.entity.TbSystemSetting;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface SystemSettingRepository extends CrudRepository<TbSystemSetting, Long> {

    @Query(value = "select * from tb_system_setting where system_key = :systemKey", nativeQuery = true)
    TbSystemSetting findBySystemKey(@Param(value = "systemKey") String systemKey);

    @Modifying
    @Query(value = "update tb_system_setting set system_value = :systemValue where system_key = :systemKey", nativeQuery = true)
    int updateBySystemKey(@Param(value = "systemKey") String systemKey, @Param(value = "systemValue") String systemValue);
}
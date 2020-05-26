package com.rose.repository;

import com.rose.data.entity.TbFlowInstanceNodeUserTask;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface FlowInstanceNodeUserTaskRepository extends CrudRepository<TbFlowInstanceNodeUserTask, Long> {
    @Modifying
    @Query(value = "delete from tb_flow_instance_node_user_task where instance_id = :instanceId", nativeQuery = true)
    int deleteByInstanceId(@Param(value = "instanceId") Long instanceId);

    @Query(value = "select * from tb_flow_instance_node_user_task where instance_id = :instanceId and instance_node_id in :nodeIdList order by id asc", nativeQuery = true)
    List<TbFlowInstanceNodeUserTask> listByInstanceIdAndNodeIdList(@Param(value = "instanceId") Long instanceId, @Param(value = "nodeIdList") List<Long> nodeIdList);

    @Query(value = "select * from tb_flow_instance_node_user_task where instance_id = :instanceId and instance_node_id = :nodeId order by id asc", nativeQuery = true)
    List<TbFlowInstanceNodeUserTask> listByInstanceIdAndNodeId(@Param(value = "instanceId") Long instanceId, @Param(value = "nodeId") Long nodeId);

    @Modifying
    @Query(value = "update tb_flow_instance_node_user_task set approval_type = :approvalType, approval_content = :approvalContent, state = :newState where id = :id and state = :oldState", nativeQuery = true)
    int updateUserTask(@Param(value = "id") Long id, @Param(value = "approvalType") Integer approvalType, @Param(value = "approvalContent") String approvalContent, @Param(value = "newState") Integer newState, @Param(value = "oldState") Integer oldState);

    @Modifying
    @Query(value = "update tb_flow_instance_node_user_task set state = :newState where id in :idList and state = :oldState", nativeQuery = true)
    int updateUserTaskStateByIdList(@Param(value = "idList") List<Long> idList, @Param(value = "newState") Integer newState, @Param(value = "oldState") Integer oldState);
}
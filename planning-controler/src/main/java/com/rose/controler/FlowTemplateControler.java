package com.rose.controler;

import com.rose.data.entity.TbFlowTemplate;
import com.rose.data.entity.TbFlowTemplateNode;
import com.rose.data.entity.TbSysUser;
import com.rose.data.to.response.FlowChartResponse;
import com.rose.service.FlowTemplateService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import java.util.List;

/**
 * 描述：流程模板 controler
 * @author sunpeng
 */
@Slf4j
@RestController
@RequestMapping("/user/flowTemplate")
public class FlowTemplateControler {

    @Inject
	private FlowTemplateService flowTemplateService;

    @GetMapping(value= "/getTemplateTree")
    public List<TbFlowTemplate> getTemplateTree() {
        return flowTemplateService.getTemplateTree();
    }

    /**
     * 功能：获取指定模板的节点下的子节点tree
     * @param templateId
     * @param nodePid
     * @return
     */
    @GetMapping(value= "/getTemplateNodeTree")
    public TbFlowTemplate getTemplateNodeTree(@RequestParam Long templateId, @RequestParam Long nodePid) {
        return flowTemplateService.getTemplateNodeTree(templateId, nodePid);
    }

    @PostMapping(value= "/saveTemplate")
    public TbFlowTemplate save(@RequestBody TbFlowTemplate param) {
        return flowTemplateService.save(param);
    }

    /**
     * 功能：对模板状态操作
     * @param id
     * @param type 0启用 1停用 2删除
     */
    @PostMapping(value= "/operateTemplateState")
    public void operateTemplateState(@RequestParam Long id, @RequestParam Integer type) {
        flowTemplateService.operateTemplateState(id, type);
    }

    @PostMapping(value= "/saveTemplateNode")
    public TbFlowTemplateNode saveTemplateNode(@RequestBody TbFlowTemplateNode param) {
        return flowTemplateService.saveTemplateNode(param);
    }

    @GetMapping(value= "/getTemplateNodeDetail")
    public TbFlowTemplateNode getTemplateNodeDetail(@RequestParam Long id) {
        return flowTemplateService.getTemplateNodeDetail(id);
    }

    @PostMapping(value= "/deleteTemplateNodeAndReturnParentNode")
    public TbFlowTemplateNode deleteTemplateNodeAndReturnParentNode(@RequestParam Long nodeId, @RequestParam Long templateId) {
        return flowTemplateService.deleteTemplateNodeAndReturnParentNode(nodeId, templateId);
    }

//    @PostMapping(value= "/deleteTemplateNodeUser")
//    public void deleteTemplateNodeUser(@RequestParam Long id, @RequestParam Long templateId, @RequestParam Long nodeId) {
//        flowTemplateService.deleteTemplateNodeUser(id, templateId, nodeId);
//    }

//    @PostMapping(value= "/addTemplateNodeUser")
//    public TbFlowTemplateNodeUserTask addTemplateNodeUser(@RequestBody TbFlowTemplateNodeUserTask param) {
//        return flowTemplateService.addTemplateNodeUser(param);
//    }

    @GetMapping(value= "/getTemplateFlowChart")
    public FlowChartResponse getTemplateFlowChart(@RequestParam Long id) {
        return flowTemplateService.getTemplateFlowChart(id);
    }

    @GetMapping(value= "/getUserInfo")
    public TbSysUser getUserInfo(@RequestParam String loginName) {
        return flowTemplateService.getUserInfo(loginName);
    }
}
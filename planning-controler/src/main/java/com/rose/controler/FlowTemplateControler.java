package com.rose.controler;

import com.rose.data.entity.TbFlowTemplate;
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

    @GetMapping(value= "/getTemplateNodeTree")
    public TbFlowTemplate getTemplateNodeTree(@RequestParam Long id, @RequestParam Long pid) {
        return flowTemplateService.getTemplateNodeTree(id, pid);
    }

    @PostMapping(value= "/save")
    public TbFlowTemplate save(@RequestBody TbFlowTemplate param) {
        return flowTemplateService.save(param);
    }

    @PostMapping(value= "/operateTemplateState")
    public void operateTemplateState(@RequestParam Long id, @RequestParam Integer type) {
        flowTemplateService.operateTemplateState(id, type);
    }
}
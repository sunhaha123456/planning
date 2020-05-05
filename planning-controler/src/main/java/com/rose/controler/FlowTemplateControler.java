package com.rose.controler;

import com.rose.data.entity.TbFlowInstanceNode;
import com.rose.data.entity.TbFlowTemplate;
import com.rose.service.FlowTemplateService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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
    public TbFlowTemplate getTemplateNodeTree(@RequestParam Long id) {
        return flowTemplateService.getTemplateNodeTree(id);
    }
}
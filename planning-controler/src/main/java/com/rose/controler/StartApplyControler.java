package com.rose.controler;

import com.rose.common.data.base.PageList;
import com.rose.common.data.response.ResponseResultCode;
import com.rose.common.exception.BusinessException;
import com.rose.common.util.FileUtil;
import com.rose.common.util.StringUtil;
import com.rose.data.entity.TbFlowTemplate;
import com.rose.data.to.request.FlowTemplateRequest;
import com.rose.data.to.response.FlowChartResponse;
import com.rose.service.FlowInstanceService;
import com.rose.service.FlowTemplateService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.inject.Inject;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

/**
 * 描述：发起申请 controller
 * @author sunpeng
 */
@Slf4j
@RestController
@RequestMapping("/user/startApply")
public class StartApplyControler {

    @Inject
    private FlowTemplateService flowTemplateService;
    @Inject
    private FlowInstanceService flowInstanceService;

    @Value("${file.upload.path}")
    private String uploadPath;

    @Value("${file.upload.maxSize}")
    private Long fileMaxSize;

    @PostMapping(value= "/searchTemplate")
    public PageList<TbFlowTemplate> searchTemplate(@RequestBody FlowTemplateRequest param) throws Exception {
        param.setStatus(0);
        return flowTemplateService.searchTemplate(param);
    }

    /**
     * 功能：发起申请
     * @param startApplyFile0
     * @param startApplyFile1
     * @param startApplyFile2
     * @param startApplyFile3
     * @param startApplyFile4
     * @param startApplyFile5
     * @param templateId
     * @param instanceName
     * @param applyContent
     */
    @PostMapping("/startApply")
    public synchronized void startApply(@RequestParam(value = "startApplyFile0", required = false) MultipartFile startApplyFile0,
                           @RequestParam(value = "startApplyFile1", required = false) MultipartFile startApplyFile1,
                           @RequestParam(value = "startApplyFile2", required = false) MultipartFile startApplyFile2,
                           @RequestParam(value = "startApplyFile3", required = false) MultipartFile startApplyFile3,
                           @RequestParam(value = "startApplyFile4", required = false) MultipartFile startApplyFile4,
                           @RequestParam(value = "startApplyFile5", required = false) MultipartFile startApplyFile5,
                           @RequestParam(value = "templateId", required = true) Long templateId,
                           @RequestParam(value = "instanceName", required = true) String instanceName,
                           @RequestParam(value = "applyContent", required = false) String applyContent) throws IOException {
        if (StringUtil.isEmpty(instanceName)) {
            throw new BusinessException(ResponseResultCode.PARAM_ERROR);
        }
        List<MultipartFile> fileList = Arrays.asList(startApplyFile0, startApplyFile1, startApplyFile2, startApplyFile3, startApplyFile4, startApplyFile5);
        FileUtil.fileValidate(fileList, fileMaxSize);

        flowInstanceService.startApply(templateId, instanceName, applyContent, fileList);
    }

    @GetMapping(value= "/getTemplateFlowChart")
    public FlowChartResponse getTemplateFlowChart(@RequestParam Long id) {
        return flowTemplateService.getTemplateFlowChart(id);
    }
}
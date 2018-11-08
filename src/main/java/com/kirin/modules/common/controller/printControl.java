package com.kirin.modules.common.controller;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.ui.ModelMap;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/common/printControl")
public class printControl {


    @RequestMapping("/SLB")
    public void SLB(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map<String, Object> map = new HashMap<>();
        map.put("Field_1","1");
        map.put("Field_2","2");
        map.put("Field_3","3");
        map.put("Field_4","4");
        map.put("Field_5","5");
        map.put("Field_6","");
        map.put("Field_7","");
        map.put("Field_8","");
        List<Map> dataList = new ArrayList<>();
        dataList.add(map);

        Resource jrxmlResource = new ClassPathResource("template/SLB.jrxml");
        Resource jasperResource = new ClassPathResource("template/SLB.jasper");


//        File jrxmlFile = ResourceUtils.getFile("classpath:template/SLB.jrxml");
//        File jasperFile = ResourceUtils.getFile("classpath:template/SLB.jasper");

////        String jrxmlPath = jrxmlFile.getPath();
        String jrxmlPath = jrxmlResource.getFile().getPath();
//        //由jrxml文件编译后生产jasper文件的路径
////        String jasperPath = jasperFile.getPath();
        String jasperPath = jasperResource.getFile().getPath();
//
        FileInputStream isRef = null;
        OutputStream sosRef = null;
//
        try {
            //编译jrxml生产jasper文件
            JasperCompileManager.compileReportToFile(jrxmlPath, jasperPath);

            isRef = new FileInputStream(new File(jasperPath));
            sosRef = response.getOutputStream();

            response.setContentType("application/pdf");

            Map<String,Object> parameters = new HashMap<String,Object>(16);

            JasperRunManager.runReportToPdfStream(isRef, sosRef, parameters, new JRBeanCollectionDataSource(dataList));


        }catch (JRException e) {
            e.printStackTrace();
        }finally {
//            sosRef.flush();
            sosRef.close();
        }



//        modelMap.put("tableData", new JRBeanCollectionDataSource(dataList));
//        modelMap.put("xqrq", "2018-09-12");
//        return new ModelAndView("SLB",modelMap);
    }

}

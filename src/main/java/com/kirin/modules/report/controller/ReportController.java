package com.kirin.modules.report.controller;

import com.kirin.modules.api.annotation.AuthIgnore;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author: BeauFang
 * @Date: 2018/5/1 9:38
 * @Description:
 **/
@Controller
@RequestMapping("/report")
public class ReportController {

    @RequestMapping("/order")
    @AuthIgnore
    public String getOrderReport() {
        return "/modules/reportlet/order.html";
    }
}

package com.kirin.modules.common.utils;

import com.kirin.common.utils.DateUtils;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class CommonUtils {

    public String createNoByDate(Long currentNumber){
        if(currentNumber == null){
            currentNumber = 1L;
        }
        String id = String.format("%04d",currentNumber);
        String str = DateUtils.format(new Date(),"yyyyMMdd");
        return str+id;
    }

    public static void main(String[] args){
        CommonUtils c = new CommonUtils();
        System.out.println(c.createNoByDate(20L));
    }


}

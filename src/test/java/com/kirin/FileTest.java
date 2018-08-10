package com.kirin;

import java.io.*;

public class FileTest {


    public static void main(String[] args) throws IOException
    {
        String filepath = "D:\\lily\\Order_201803\\Order_201803.txt";
        File file = new File(filepath);
        BufferedInputStream fis = new BufferedInputStream(new FileInputStream(file));
        BufferedReader reader = new BufferedReader(new InputStreamReader(fis,"utf-8"),5*1024*1024);// 用5M的缓冲读取文本文件

        String line = "";
        int count = 0;
        while((line = reader.readLine()) != null){
            System.out.println(line.toString());
            for(int i=line.length();i>-1;i--){
                if(line.lastIndexOf("OrderHeader") == i){
                    line = line.substring(0,i);
                    count++;
                }
            }

        }
        System.out.println(count);
    }

}

package com.lmg.sniper.common.util;

import com.miz.mekansm.dist.api.pojo.instance.BaseEntity;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;

import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Excel导出工具类
 * Created by Zzzz on 2016/12/13.
 * Copyright © mizlicai
 */
public class ExcelExportUtils {

    public static boolean exportWithLinkedHashMap(String sheetName,
                                                  String fileName, String[] head,
                                                  List<LinkedHashMap<String, Object>> list,
                                                  HttpServletResponse response) {
        if (head == null || head.length < 1 || list == null || list.size() < 1) {
            return false;
        }
        Workbook workbook = new SXSSFWorkbook();
        Sheet sheet = workbook.createSheet(sheetName == null ? "Sheet1"
                : sheetName);
        Row currentRow = sheet.createRow(0);

        for (int i = 0; i < head.length; ++i) {
            Cell currentCell = currentRow.createCell(i);
            currentCell.setCellValue(head[i]);
        }

        for (int i = 0; i < list.size(); ++i) {
            Map<String, Object> map = list.get(i);
            currentRow = sheet.createRow(i + 1);
            int index = 0;
            if (map != null) {
                for (Object v : map.values()) {
                    currentRow.createCell(index).setCellValue(
                            (v != null) ? v.toString() : null);
                    index++;
                }
            }
        }
        if (StringUtils.isBlank(fileName)) {
            fileName = new Date().toString();
        }
        return handleResponse(response, workbook, fileName);
    }

    public static boolean exportWithMap(String sheetName, String fileName,
                                        String[] head, String[] fields, List<Map<String, Object>> list,
                                        HttpServletResponse response) {
        if (head == null || head.length < 1 || list == null || list.size() < 1) {
            return false;
        }
        Workbook workbook = new SXSSFWorkbook();
        Sheet sheet = workbook.createSheet(sheetName == null ? "Sheet1"
                : sheetName);
        Row currentRow = sheet.createRow(0);

        for (int i = 0; i < head.length; ++i) {
            Cell currentCell = currentRow.createCell(i);
            currentCell.setCellValue(head[i]);
        }

        for (int i = 0; i < list.size(); ++i) {
            Map<String, Object> map = list.get(i);
            currentRow = sheet.createRow(i + 1);
            int index = 0;
            if (map != null) {
                for (String field : fields) {
                    Object fieldValue = map.get(field);
                    String cellValue = fieldValue == null ? "" : fieldValue
                            .toString();
                    currentRow.createCell(index).setCellValue(cellValue);
                    index++;
                }
            }
        }
        if (StringUtils.isBlank(fileName)) {
            fileName = new Date().toString();
        }
        return handleResponse(response, workbook, fileName);
    }

    /**
     * @param sheetName sheetName
     * @param fileName  fileName
     * @param head      head
     * @param list      实体列表
     * @param paramList 实体对应的属性
     * @param response  response
     * @return
     * @throws NoSuchFieldException
     * @throws IllegalAccessException
     */
    public static boolean exportWithEntry(String sheetName, String fileName,
                                          String[] head, List<? extends BaseEntity> list,
                                          List<String> paramList, HttpServletResponse response)
            throws NoSuchFieldException, IllegalAccessException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        if (list == null || list.size() <= 0 || paramList == null
                || paramList.size() <= 0) {
            return false;
        }
        List<LinkedHashMap<String, Object>> result = new ArrayList<>();
        Class clazz = list.get(0).getClass();
        Field privateField;
        LinkedHashMap<String, Object> map;
        for (BaseEntity entity : list) {
            map = new LinkedHashMap<>();
            for (String s : paramList) {
                try {
                    privateField = clazz.getDeclaredField(s);
                } catch (NoSuchFieldException e) {
                    clazz = clazz.getSuperclass();
                    privateField = clazz.getDeclaredField(s);
                }
                privateField.setAccessible(true);
                if (privateField.get(entity) instanceof Date) {
                    map.put(s, sdf.format(privateField.get(entity)));
                } else {
                    map.put(s, privateField.get(entity));
                }
            }
            result.add(map);
        }
        return exportWithLinkedHashMap(sheetName, fileName, head, result,
                response);
    }

    public static boolean handleResponse(HttpServletResponse response,
                                         Workbook workbook, String fileName) {
        try {
            response.setContentType("application/vnd.ms-excel");
            response.addHeader("Content-Disposition", "attachment; filename="
                    + new String(fileName.getBytes("gbk"), "iso8859-1")
                    + ".xlsx");
            response.setDateHeader("Expires", 0);
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Pragma", "no-cache");

            OutputStream outputStream = response.getOutputStream();
            workbook.write(outputStream);

            outputStream.close();
            response.flushBuffer();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static void main(String args[]) throws NoSuchFieldException,
            IllegalAccessException {
//        Order order = new Order();
//        order.setCreateDate(new Date());
//        Class clazz = order.getClass();
//        Field privateField = null;
//        try {
//            privateField = clazz.getDeclaredField("createDate");
//        } catch (NoSuchFieldException e) {
//            clazz = clazz.getSuperclass();
//            privateField = clazz.getDeclaredField("createDate");
//        }
//        privateField.setAccessible(true);
//        System.out.println(privateField.get(order));
    }
}

package com.lmg.sniper.practice.designpattern;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.InputStream;

/**
 * Created by Zzzz on 2016/12/12.
 * Copyright © mizlicai
 */
public class XMLUtil {

    /**
     * 该方法用于从XML配置文件中提取具体类类名，并返回一个实例对象
     *
     * @param item        item
     * @param patternName patternName
     * @return Object
     */
    public static Object getBean(int item, String patternName) {
        try {
            //创建文档对象
            DocumentBuilderFactory dFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = dFactory.newDocumentBuilder();
            Document doc;

            final InputStream is = XMLUtil.class
                    .getResourceAsStream("/config/config.xml");
            doc = builder.parse(is);

            //获取包含类名的文本节点
            NodeList nl = doc.getElementsByTagName("className");
            Node classNode = nl.item(item).getFirstChild();
            String cName = classNode.getNodeValue();

            //通过类名生成实例对象并将其返回
            Class c = Class.forName("com.lmg.sniper.practice.designpattern." + patternName + "." + cName);
            return c.newInstance();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}

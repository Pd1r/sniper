package com.lmg.sniper.common.util;

import com.swetake.util.Qrcode;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;

/**
 * 二维码生成工具类
 * QRCodeHandler.java
 *
 * @author lmg
 * @since 2015年12月4日
 * Copyright © mizhuanglicai
 */
public class QRCodeHandler {

    /**
     * 生成二维码(QRCode)图片
     *
     * @param content 二维码图片的内容
     * @param imgType 图片类型
     * @param size    二维码尺寸
     */
    public void encoderQRCoder(String content, String imgType, int size, HttpServletResponse response) {
        try {
            Qrcode handler = new Qrcode();
            //设置二维码排错率，可选L(7%)、M(15%)、Q(25%)、H(30%)，排错率越高可存储的信息越少，但对二维码清晰度的要求越小
            handler.setQrcodeErrorCorrect('M');
            //N代表数字,A代表字符a-Z,B代表其他字符
            handler.setQrcodeEncodeMode('B');

            //设置设置二维码版本，取值范围1-40，值越大尺寸越大，可存储的信息越大
            //也象征着二维码的信息容量；二维码可以看成一个黑白方格矩阵，版本不同，矩阵长宽
            //方向方格的总数量分别不同，版本1为21*21矩阵，版本每增1，二维码的两个边长都增4；所以版本
            //7为45*45的矩阵；最高版本为是40，是177*177的矩阵；
            handler.setQrcodeVersion(size);

            // 获得内容的字节数组，设置编码格式
            byte[] contentBytes = content.getBytes("UTF-8");

            // 图片尺寸
            int imgSize = 67 + 12 * (size - 1);
            BufferedImage bufImg = new BufferedImage(imgSize, imgSize, BufferedImage.TYPE_INT_RGB);

            Graphics2D gs = bufImg.createGraphics();
            gs.setBackground(Color.WHITE);
            gs.clearRect(0, 0, imgSize, imgSize);

            //设定图像颜色：BLACK
            gs.setColor(Color.BLACK);

            //设置偏移量  不设置肯能导致解析出错
            int pixoff = 2;
            //输出内容：二维码
            if (contentBytes.length > 0 && contentBytes.length < 800) {
                boolean[][] codeOut = handler.calQrcode(contentBytes);
                for (int i = 0; i < codeOut.length; i++) {
                    for (int j = 0; j < codeOut.length; j++) {
                        if (codeOut[j][i]) {
                            gs.fillRect(j * 3 + pixoff, i * 3 + pixoff, 3, 3);
                        }
                    }
                }
            } else {
                System.err.println("QRCode content bytes length = " + contentBytes.length + " not in [ 0,800 ]. ");
            }

            gs.dispose();
            bufImg.flush();
            //生成二维码QRCode图片
            ImageIO.write(bufImg, imgType, response.getOutputStream());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

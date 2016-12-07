package com.lmg.sniper.common.util;

import java.awt.*;
import java.awt.geom.AffineTransform;
import java.util.Random;

/**
 * 随机码图片生成帮助类
 *
 * @author lmg
 */
public class IdentifyingCodeHelper {
    /**
     * 验证码图片的高度。
     */
    private int height = 40;
    /**
     * 验证码的数量。
     */
    private final Random random = new Random();
    /**
     * 验证码图片的宽度。
     */
    private int width = 80;

    public IdentifyingCodeHelper() {

    }

    /**
     * 绘制干扰线
     *
     * @param g    Graphics2D对象，用来绘制图像
     * @param nums 干扰线的条数
     */
    public void drawRandomLines(final Graphics2D g, final int nums) {
        g.setColor(this.getRandomColor(160, 200));
        for (int i = 0; i < nums; i++) {
            final int x1 = random.nextInt(width);
            final int y1 = random.nextInt(height);
            final int x2 = random.nextInt(12);
            final int y2 = random.nextInt(12);
            g.drawLine(x1, y1, x2, y2);
        }
    }

    /**
     * 获取随机字符串， 此函数可以产生由大小写字母，数字组成的字符串
     *
     * @param length 随机字符串的长度
     * @return 随机字符串
     */
    public String drawRandomString(final int length, final Graphics2D g) {
        final StringBuffer strbuf = new StringBuffer();
        String temp = "";
        int itmp = 0;
        for (int i = 0; i < length; i++) {
            switch (random.nextInt(5)) {
                case 1:
                case 2:
                    itmp = random.nextInt(26) + 65;
                    temp = String.valueOf((char) itmp);
                    break;
                case 3:
                    itmp = random.nextInt(26) + 97;
                    temp = String.valueOf((char) itmp);
                default:
                    itmp = random.nextInt(10) + 48;
                    temp = String.valueOf((char) itmp);
                    break;
            }
            final Color color = new Color(20 + random.nextInt(20),
                    20 + random.nextInt(20), 20 + random.nextInt(20));
            g.setColor(color);

            // 旋转一定的角度
            final AffineTransform trans = new AffineTransform();
            trans.rotate(random.nextInt(45) * 3.14 / 180, 15 * i + 8, 7);
            // 缩放
            float scaleSize = random.nextFloat() + 0.8f;
            if (scaleSize > 1f) {
                scaleSize = 1f;
            }
            trans.scale(scaleSize, scaleSize);
            g.setTransform(trans);
            g.drawString(temp, 15 * i + 14, 22);

            strbuf.append(temp);
        }
        g.dispose();
        return strbuf.toString();
    }

    public int getHeight() {
        return height;
    }

    /**
     * 生成随机颜色
     *
     * @param fc 前景色
     * @param bc 背景色
     * @return Color对象，此Color对象是RGB形式的。
     */
    public Color getRandomColor(int fc, int bc) {
        if (fc > 255) {
            fc = 200;
        }
        if (bc > 255) {
            bc = 255;
        }
        final int r = fc + random.nextInt(bc - fc);
        final int g = fc + random.nextInt(bc - fc);
        final int b = fc + random.nextInt(bc - fc);
        return new Color(r, g, b);
    }

    public int getWidth() {
        return width;
    }

    public void setHeight(final int height) {
        this.height = height;
    }

    public void setWidth(final int width) {
        this.width = width;
    }

}

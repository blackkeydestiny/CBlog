/**
 * MIT License
 * Copyright (c) 2018 chuming.chen
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
package com.ccm.blog.util;

import org.junit.Test;

/**
 * 密码加密测试工具类
 *
 * @author chuming.chen
 * @version 1.0
 * @website https://www.chuming.online
 * @date 2018/4/18 11:48
 * @since 1.0
 */
public class PasswordUtilTest {

    private final int FLAG_SPECIAL_GAME = 1 << 3;
    private int status = 0;

    @Test
    public void passwordTest() throws Exception {
        encryptTest("123456", "root");
    }

    private void encryptTest(String password, String salt) throws Exception {
        System.out.println("加密前密文 : " + password);
        String encrypt = PasswordUtil.encrypt(password, salt);
        System.out.println("加密后密文 : " + encrypt);
    }

    @Test
    public void passwordTest1() throws Exception {
        decryptTest("2c2PDqFGORl0+CJ8j90vgQ==", "root");
    }

    private void decryptTest(String encrypt, String salt) throws Exception {
        System.out.println("解密前密文 " + encrypt);
        String decrypt = PasswordUtil.decrypt(encrypt, salt);
        System.out.println("解密后密文  " + decrypt);
    }

    @Test
    public void testJava() throws Exception {
        System.out.println(FLAG_SPECIAL_GAME);
        setFlag(FLAG_SPECIAL_GAME);
        clearFlag(FLAG_SPECIAL_GAME);
    }

    /**
     * 0与任何数进行|运算得到任何数
     * @param flag
     */
    private void setFlag(int flag) {
        status = status | flag;
        System.out.println(status);
    }

    /**
     * 取反后，进行&运算
     * @param flag
     */
    private void clearFlag(int flag) {
        System.out.println(~flag);
        status = status & ~flag;
        System.out.println(status);
    }

    private boolean hasFlag(int flags) {
        return (status & flags) != 0;
    }
}
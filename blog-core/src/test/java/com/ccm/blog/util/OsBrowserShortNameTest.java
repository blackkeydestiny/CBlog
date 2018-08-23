/*
 * MIT License
 *
 * Copyright (c) 2018 chuming.chen.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
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
 * @author chuming.chen
 * @date 8/22/2018 10:29 PM
 */
public class OsBrowserShortNameTest {

    @Test
    public void test(){
        System.out.println("=================Windows================");
        System.out.println(OsBrowserShortNameUtil.getOsShortName("Windows 8"));
        System.out.println(OsBrowserShortNameUtil.getBrowserShortName("Internet Explorer 11"));

        System.out.println("=================MAC================");
        System.out.println(OsBrowserShortNameUtil.getOsShortName("iOS 8.3 (iPhone)"));
        System.out.println(OsBrowserShortNameUtil.getOsShortName("Mac OS X (iPad)"));
        System.out.println(OsBrowserShortNameUtil.getOsShortName("iOS 8.1 (iPad)"));
        System.out.println(OsBrowserShortNameUtil.getOsShortName("Mac OS X (iPhone)"));
        System.out.println(OsBrowserShortNameUtil.getOsShortName("Mac OS X"));
        System.out.println(OsBrowserShortNameUtil.getOsShortName("iOS"));
        System.out.println(OsBrowserShortNameUtil.getBrowserShortName("Microsoft Edge 12"));

        System.out.println("=================Linux================");
        System.out.println(OsBrowserShortNameUtil.getOsShortName("Linux (Kindle)"));
        System.out.println(OsBrowserShortNameUtil.getOsShortName("Linux"));
//        System.out.println(OsBrowserShortNameUtil.getOsShortName("iOS 8.1 (iPad)"));
//        System.out.println(OsBrowserShortNameUtil.getOsShortName("Mac OS X (iPhone)"));
//        System.out.println(OsBrowserShortNameUtil.getOsShortName("Mac OS X"));
//        System.out.println(OsBrowserShortNameUtil.getBrowserShortName("Microsoft Edge 12"));
    }
}

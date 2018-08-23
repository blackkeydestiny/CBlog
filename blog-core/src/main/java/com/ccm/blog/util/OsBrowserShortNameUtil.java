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

/**
 * @author chuming.chen
 * @date 8/22/2018 10:29 PM
 */
public class OsBrowserShortNameUtil {

    /**
     *  getOsShortName
     * @param os
     * @return
     */
    public static String getOsShortName(String os){
        String osShortName = "";
        String osLower = os.toLowerCase();

        // windows
        if(osLower.indexOf("windows") != -1){
            if(osLower.indexOf("7") != -1){
                osShortName = "win1";
            }else if (osLower.indexOf("10") != -1){
                osShortName = "win2";
            }else {
                osShortName = "win1";
            }
        }

        // mac
        if(osLower.indexOf("mac") != -1 || osLower.indexOf("ios") != -1){
            if(osLower.indexOf("iphone") != -1){
                osShortName = "iphone";
            }else if(osLower.indexOf("ipad") != -1){
                osShortName = "ipad";
            }else {
                osShortName = "mac";
            }
        }

        // android
        if(osLower.indexOf("android") != -1){
            osShortName = "android";
        }

        // ubuntu
        if(osLower.indexOf("ubuntu") != -1){
            osShortName = "ubuntu";
        }

        // linux
        if(osLower.indexOf("linux") != -1){
            if(osLower.indexOf("kindle") != -1){
                osShortName = "kindle";
            }else {
                osShortName = "linux";
            }
        }

        // huawei
        if(osLower.indexOf("huawei") != -1){
            osShortName = "huawei";
        }

        // kindle
//        if(osLower.indexOf("kindle") != -1){
//            osShortName = "kindle";
//        }

        // lenovo
        if(osLower.indexOf("lenovo") != -1){
            osShortName = "lenovo";
        }

        // nokia
        if(osLower.indexOf("nokia") != -1){
            osShortName = "nokia";
        }

        // vivo
        if(osLower.indexOf("vivo") != -1){
            osShortName = "vivo";
        }

        // mi
//        if(osLower.indexOf("mi") != -1){
//            osShortName = "mi";
//        }

        return osShortName;
    }

    /**
     *  getBrowserShortName
     * @param browser
     * @return
     */
    public static String getBrowserShortName(String browser){
        String browserShortName = "";
        String browserLower = browser.toLowerCase();

        // 360
        if(browserLower.indexOf("360") != -1){
            browserShortName = "360";
        }

        // baidu
        if(browserLower.indexOf("baidu") != -1){
            browserShortName = "baidu";
        }

        // chrome
        if(browserLower.indexOf("chrome") != -1){
            browserShortName = "chrome";
        }

        // edge
        if(browserLower.indexOf("edge") != -1){
            browserShortName = "edge";
        }

        // firefox
        if(browserLower.indexOf("firefox") != -1){
            browserShortName = "firefox";
        }

        // ie
        if(browserLower.indexOf("ie") != -1 || browserLower.indexOf("internet explorer") != -1){
            browserShortName = "ie";
        }

        // maxthon
        if(browserLower.indexOf("maxthon") != -1){
            browserShortName = "maxthon";
        }

        // opera
        if(browserLower.indexOf("opera") != -1){
            browserShortName = "opera";
        }

        // mi
//        if(browserLower.indexOf("mi") != -1){
//            browserShortName = "mi";
//        }

        // qq
        if(browserLower.indexOf("qq") != -1){
            browserShortName = "qq";
        }

        // safari
        if(browserLower.indexOf("safari") != -1){
            browserShortName = "safari";
        }

        // sogou
        if(browserLower.indexOf("sogou") != -1){
            browserShortName = "sogou";
        }

        // tt
        if(browserLower.indexOf("tt") != -1){
            browserShortName = "tt";
        }

        // uc
        if(browserLower.indexOf("uc") != -1){
            browserShortName = "uc";
        }

        // other
//        if(browserLower.indexOf("other") != -1){
//            browserShortName = "other";
//        }
        return browserShortName;
    }
}

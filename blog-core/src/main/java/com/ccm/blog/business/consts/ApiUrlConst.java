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
package com.ccm.blog.business.consts;

/**
 * 各api需要的url常量类
 *
 * @author chuming.chen
 * @website https://www.chuming.online
 * @version 1.0
 * @date 2018/4/16 16:26
 * @since 1.0
 */
public class ApiUrlConst {

    /**
     * 通过百度API 根据ip获取定位的接口
     */
    public static final String BAIDU_API_GET_LOCATION_BY_IP = "https://api.map.baidu.com/location/ip";

    /**
     * 百度提交链接时的Url
     */
    public static final String BAIDU_PUSH_URL = "http://data.zz.baidu.com/";

    /**
     * 码云资源仓库url
     */
    public static final String MAYUN_ASSET_URL = "https://gitee.com/blackkeydestiny/blogAssets/raw/master/";

}

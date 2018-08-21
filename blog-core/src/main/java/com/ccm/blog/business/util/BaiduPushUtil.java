/**
 * MIT License
 *
 * Copyright (c) 2018 chuming.chen
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
package com.ccm.blog.business.util;

import com.ccm.blog.framework.exception.CcmCommentException;
import com.ccm.blog.util.RestClientUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.StringUtils;

import javax.net.ssl.HttpsURLConnection;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.util.Date;

/**
 * 百度站长推送工具类
 *
 * @author chuming.chen
 * @version 1.0
 * @website https://www.chuming.online
 * @date 2018/4/16 16:26
 * @since 1.0
 */
@Slf4j
public class BaiduPushUtil extends RestClientUtil {
    /**
     * 自行登录百度站长平台后获取响应的cookie
     */
    private static final String COOKIE = "BAIDUID=534DCD09E0EDC498B5AA59A053C6047E:FG=1; BIDUPSID=534DCD09E0EDC498B5AA59A053C6047E; PSTM=1534741317; BDORZ=B490B5EBF6F3CD402E515D22BCDA1598; BDSFRCVID=8I8sJeC62ijh-Xn7f1Ush-bTMNpn72JTH6ao7r9HVz3ZDzsAo62UEG0PDU8g0Ku-JKUnogKK3gOTH4nP; H_BDCLCKID_SF=tbktoIt-JDvDDPPkh-o_hnKeqxby26POWRbeaJ5nJDoEjRPzW-Ibb6_AKUAL5q3uBjRX_KoFQpP-HJA6K6r13RTyW4OEbMoyJJrPKl0MLpblbb0xyn_VyxPAhxnMBMPe52OnaIb8LIcjqR8Zj5_Wjx5; PSINO=7; BDUSS=XE3VVlnRXFWVVNkanpvSDdOWkxCVn5DVFVmYW5MRUV0M0JlRVN1c1hlWEtVYU5iQVFBQUFBJCQAAAAAAAAAAAEAAAAsa2V4Q19CbGFja19rZXkAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMrEe1vKxHtbd; SITEMAPSESSID=glivvoq5o6k7dvgk46ukm3nd21; lastIdentity=PassUserIdentity; H_PS_PSSID=1426_21085_20697_26350_26921_22158; __cas__st__=NLI; __cas__id__=0; Hm_lvt_6f6d5bc386878a651cb8c9e1b4a3379a=1534839994,1534840086,1534840206,1534840236; Hm_lpvt_6f6d5bc386878a651cb8c9e1b4a3379a=1534840236; PMS_JT=%28%7B%22s%22%3A1534840295845%2C%22r%22%3A%22https%3A//ziyuan.baidu.com/linksubmit/index%22%7D%29";

    /**
     * 推送链接到百度站长平台
     *
     * @param urlString
     *         百度站长平台地址
     * @param params
     *         待推送的链接
     * @return api接口响应内容
     */
    public static String doPush(String urlString, String params) {
        if (StringUtils.isEmpty(COOKIE)) {
            throw new CcmCommentException("尚未设置百度站长平台的Cookie信息，该功能不可用！");
        }
        log.info("{} REST url: {}", new Date(), urlString);
        HttpURLConnection connection = null;
        try {
            connection = openConnection(urlString);
            connection.setRequestMethod("POST");
            // (如果不设此项,json数据 ,当WEB服务默认的不是这种类型时可能抛java.io.EOFException)
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
            connection.setRequestProperty("Action", "1000");
            connection.setRequestProperty("User-Agent", USER_AGENT);
            connection.setRequestProperty("Connection", "keep-alive");
            connection.setRequestProperty("Cookie", COOKIE);
            connection.setDoOutput(true);
            connection.setDoInput(true);
            // 设置连接超时时间，单位毫秒
            connection.setConnectTimeout(10000);
            // 设置读取数据超时时间，单位毫秒
            connection.setReadTimeout(10000);
            // Post 请求不能使用缓存
            connection.setUseCaches(false);
            if (params != null) {
                final OutputStream outputStream = connection.getOutputStream();
                writeOutput(outputStream, params);
                outputStream.close();
            }
            log.info("RestClientUtil response: {} : {}", connection.getResponseCode(), connection.getResponseMessage());
            if (connection.getResponseCode() == HttpsURLConnection.HTTP_OK) {
                return readInput(connection.getInputStream(), "UTF-8");
            } else {
                return readInput(connection.getErrorStream(), "UTF-8");
            }
        } catch (Exception e) {
            log.error("推送到百度站长平台发生异常！", e);
            return "";
        } finally {
            if (null != connection) {
                connection.disconnect();
            }
        }
    }
}

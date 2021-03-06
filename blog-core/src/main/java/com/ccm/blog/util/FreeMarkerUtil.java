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

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.StringUtils;

import java.io.IOException;
import java.io.StringReader;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import static freemarker.template.Configuration.DEFAULT_INCOMPATIBLE_IMPROVEMENTS;

/**
 * Freemarker模板操作工具类
 *
 * @author chuming.chen
 * @version 1.0
 * @website https://www.chuming.online
 * @date 2018/4/18 11:48
 * @since 1.0
 */
@Slf4j
public class FreeMarkerUtil {

    private static final String LT = "<";
    private static final String LT_CHAR = "&lt;";
    private static final String GT = ">";
    private static final String GT_CHAR = "&gt;";
    private static final String AMP = "&";
    private static final String AMP_CHAR = "&amp;";
    private static final String APOS = "'";
    private static final String APOS_CHAR = "&apos;";
    private static final String QUOT = "&quot;";
    private static final String QUOT_CHAR = "\"";

    /**
     * Template to String Method Note
     *
     * @param templateContent
     *         template content
     * @param map
     *         tempate data map
     * @return
     */
    public static String template2String(String templateContent, Map<String, Object> map,
                                         boolean isNeedFilter) {
        if (StringUtils.isEmpty(templateContent)) {
            return null;
        }
        if (map == null) {
            map = new HashMap<>();
        }
        Map<String, Object> newMap = new HashMap<>(1);

        Set<String> keySet = map.keySet();
        if (keySet.size() > 0) {
            for (String key : keySet) {
                Object o = map.get(key);
                if (o != null) {
                    if (o instanceof String) {
                        String value = o.toString();
                        if (value != null) {
                            value = value.trim();
                        }
                        if (isNeedFilter) {
                            value = filterXmlString(value);
                        }
                        newMap.put(key, value);
                    } else {
                        newMap.put(key, o);
                    }
                }
            }
        }
        Template t = null;
        try {
            t = new Template("", new StringReader(templateContent), new Configuration(DEFAULT_INCOMPATIBLE_IMPROVEMENTS));
            StringWriter writer = new StringWriter();
            t.process(newMap, writer);
            return writer.toString();
        } catch (IOException e) {
            log.error("TemplateUtil -> template2String IOException.", e);
        } catch (TemplateException e) {
            log.error("TemplateUtil -> template2String TemplateException.", e);
        } finally {
            if (newMap != null) {
                newMap.clear();
                newMap = null;
            }
        }
        return null;
    }

    private static String filterXmlString(String str) {
        str = str.replaceAll(LT, LT_CHAR);
        str = str.replaceAll(GT, GT_CHAR);
        str = str.replaceAll(AMP, AMP_CHAR);
        str = str.replaceAll(APOS, APOS_CHAR);
        str = str.replaceAll(QUOT, QUOT_CHAR);
        return str;
    }
}

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
package com.ccm.blog.plugin;

import com.ccm.blog.business.consts.CommonConst;
import com.ccm.blog.business.consts.DateConst;
import com.ccm.blog.business.entity.Config;
import com.ccm.blog.business.enums.QiniuUploadType;
import com.ccm.blog.business.service.SysConfigService;
import com.ccm.blog.framework.holder.SpringContextHolder;
import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.FileInfo;
import com.qiniu.util.Auth;
import com.qiniu.util.StringMap;
import com.ccm.blog.business.consts.CommonConst;
import com.ccm.blog.business.consts.DateConst;
import com.ccm.blog.business.entity.Config;
import com.ccm.blog.business.enums.QiniuUploadType;
import com.ccm.blog.business.service.SysConfigService;
import com.ccm.blog.framework.holder.SpringContextHolder;
import com.ccm.blog.util.DateUtil;
import com.ccm.blog.util.FileUtil;
import lombok.extern.slf4j.Slf4j;

import java.io.File;
import java.io.IOException;
import java.util.Date;

/**
 * Qiniu云操作文件的api
 *
 * @author chuming.chen
 * @version 1.0
 * @website https://www.chuming.online
 * @date 2018/4/16 16:26
 * @since 1.0
 */
@Slf4j
public class QiniuApi {
    private static final Object LOCK = new Object();
    private Config config;
    private String key;
    private Auth auth;
    private UploadManager uploadManager;

    private QiniuApi() {
        SysConfigService configService = SpringContextHolder.getBean(SysConfigService.class);
        this.config = configService.get();
        auth = Auth.create(config.getQiniuAccessKey(), config.getQiniuSecretKey());
        uploadManager = new UploadManager();
    }

    public static QiniuApi getInstance() {
        synchronized (LOCK) {
            return new QiniuApi();
        }
    }

    public QiniuApi withFileName(String key, QiniuUploadType type) {
        return withFileName(key, type.getPath());
    }

    public QiniuApi withFileName(String key, String path) {
        String suffix = FileUtil.getSuffix(key);
        // 不用时间戳命名文件，改为具体的直观的日期命名文件
        String fileName = DateUtil.date2Str(new Date(), DateConst.MILLISECOND);
        this.key = path + (fileName + suffix);
        return this;
    }

    public String getUpToken() {
        return this.auth.uploadToken(config.getQiniuBucketName(), this.key, 3600L, new StringMap().put("insertOnly", Integer.valueOf(1)));
    }

    public String upload(File fileByte) throws IOException {
        Response res = this.uploadManager.put(fileByte, this.key, getUpToken());
        upload(res);
        return key;
    }

    public String upload(byte[] byteArr) throws IOException {
        Response res = this.uploadManager.put(byteArr, this.key, getUpToken());
        upload(res);
        return key;
    }

    private String upload(Response res) throws IOException {
        try {
            int status = res.statusCode;
            if (status == CommonConst.DEFAULT_SUCCESS_CODE) {
                StringMap map = res.jsonToMap();
                return String.valueOf(map.get("key"));
            }
        } catch (QiniuException e) {
            Response r = e.response;
            log.error(r.toString(), e);
        }
        return null;
    }

    public boolean delete(String fileName) {
        BucketManager bucketManager = new BucketManager(this.auth);
        try {
            bucketManager.delete(config.getQiniuBucketName(), fileName);
            return true;
        } catch (QiniuException e) {
            Response r = e.response;
            log.error(r.toString(), e);
        }
        return false;
    }

    public FileInfo getFileInfo(String fileName) {
        BucketManager bucketManager = new BucketManager(this.auth);

        FileInfo info = null;
        try {
            info = bucketManager.stat(config.getQiniuBucketName(), fileName);
            log.info(info.hash);
            log.info(info.key);
        } catch (QiniuException e) {
            Response r = e.response;
            log.error(r.toString(), e);
        }
        return info;
    }

    public String download(String fileUrl) {
        return this.auth.privateDownloadUrl(fileUrl, 3600L);
    }

}

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

import com.ccm.blog.business.consts.ApiUrlConst;
import com.ccm.blog.business.enums.QiniuUploadType;
import com.ccm.blog.framework.exception.CcmFileException;
import com.ccm.blog.plugin.QiniuApi;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

/**
 * 文件操作工具类
 *
 * @author yadong.zhang email:yadong.zhang0415(a)gmail.com
 * @version 1.0
 * @website https://www.chuming.online
 * @date 2018/01/09 17:40
 * @since 1.0
 */
@Slf4j
public class FileUtil {
    private static final String[] PICTURE_SUFFIXS = {".jpg", ".jpeg", ".png", ".gif", ".bmp"};

    /**
     * 删除目录，返回删除的文件数
     *
     * @param rootPath
     *         待删除的目录
     * @param fileNum
     *         已删除的文件个数
     * @return 已删除的文件个数
     */
    public static int deleteFiles(String rootPath, int fileNum) {
        File file = new File(rootPath);
        if (!file.exists()) {
            return -1;
        }
        if (file.isDirectory()) {
            File[] sonFiles = file.listFiles();
            if (sonFiles != null && sonFiles.length > 0) {
                for (File sonFile : sonFiles) {
                    if (sonFile.isDirectory()) {
                        fileNum = deleteFiles(sonFile.getAbsolutePath(), fileNum);
                    } else {
                        sonFile.delete();
                        fileNum++;
                    }
                }
            }
        } else {
            file.delete();
        }
        return fileNum;
    }


    public static String getPrefix(File file) {
        return getPrefix(file.getName());
    }

    public static String getPrefix(String fileName) {
        int idx = fileName.lastIndexOf(".");
        int xie = fileName.lastIndexOf("/");
        idx = idx == -1 ? fileName.length() : idx;
        xie = xie == -1 ? 0 : xie + 1;
        return fileName.substring(xie, idx);
    }

    public static String getSuffix(File file) {
        return getSuffix(file.getName());
    }

    /**
     * 获取文件的后缀
     * @param fileName
     * @return
     */
    public static String getSuffix(String fileName) {
        int idx = fileName.lastIndexOf(".");
        idx = idx == -1 ? fileName.length() : idx;
        return fileName.substring(idx);
    }

    public static boolean isPicture(String suffix) {
        return !StringUtils.isEmpty(suffix) && Arrays.asList(PICTURE_SUFFIXS).contains(suffix.toLowerCase());
    }

    public static void mkdirs(String filePath) {
        File file = new File(filePath);
        mkdirs(file);
    }

    public static void mkdirs(File file) {
        if (!file.exists()) {
            if (file.isDirectory()) {
                file.mkdirs();
            } else {
                file.getParentFile().mkdirs();
            }
        }
    }

    /**
     * 上传文件到七牛云
     * @param file
     * @param uploadType
     * @param canBeNull
     * @return
     */
    public static String uploadToQiniu(MultipartFile file, QiniuUploadType uploadType, boolean canBeNull) {
        // 不可为空并且file为空，抛出异常
        if (!canBeNull && null == file) {
            throw new CcmFileException("请选择图片");
        }
        // 可为空并且file为空，忽略后边的代码，返回null
        if (canBeNull && null == file) {
            return null;
        }
        try {
            String filePath = "";
            boolean isPicture = FileUtil.isPicture(FileUtil.getSuffix(file.getOriginalFilename()));
            if (isPicture) {
                filePath = QiniuApi.getInstance()
                        .withFileName(file.getOriginalFilename(), uploadType)
                        .upload(file.getBytes());
//                return UrlCodeUtil.encode(filePath);
                return filePath;
            } else {
                throw new CcmFileException("只支持图片");
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new CcmFileException("上传图片到七牛云发生异常，请检查七牛配置是否正常", e);
        }
    }

    /**
     * 删除七牛上的文件
     *
     * @param keys
     *         七牛云文件的key（上传成功时返回的文件路径）
     * @return
     */
    public static int removeQiniu(String... keys) {
        if (null == keys || keys.length == 0) {
            return 0;
        }
        int count = 0;
        for (String key : keys) {
            // 不可为空并且file为空，抛出异常
            if (StringUtils.isEmpty(key)) {
                log.error("删除七牛文件失败:文件key为空");
                continue;
            }
            try {
                boolean result = QiniuApi.getInstance().delete(key);
                if (result) {
                    count++;
                }
            } catch (Exception e) {
                log.error("删除七牛云文件发生异常", e);
            }
        }
        return count;
    }


    /**
     * 上传文件到码云(注意：此方法只是存储码云资源的URL，并不是真正的将文件存储到码云上)
     * @param file
     * @param uploadType
     * @param canBeNull
     * @return
     */
    public static Map<String, String> uploadToMayun(MultipartFile file, QiniuUploadType uploadType, boolean canBeNull) {
        // 不可为空并且file为空，抛出异常
        if (!canBeNull && null == file) {
            throw new CcmFileException("请选择图片");
        }
        // 可为空并且file为空，忽略后边的代码，返回null
        if (canBeNull && null == file) {
            return null;
        }
        try {
            Map<String, String> filePaths = new HashMap<String, String>();
            String coverImage = "";
            String coverImage150 = "";
            String suffixName150 = "";
            int coverImage150Int = 0;
            boolean isPicture = FileUtil.isPicture(FileUtil.getSuffix(file.getOriginalFilename()));
            if (isPicture) {
                String fileName = file.getOriginalFilename().trim();
                coverImage150Int = Integer.parseInt(fileName.substring(0, fileName.indexOf("."))) + 1;
                suffixName150 = fileName.substring(fileName.indexOf("."));
                coverImage150 = ApiUrlConst.MAYUN_ASSET_URL + uploadType.getPath() + coverImage150Int + suffixName150;
                coverImage = ApiUrlConst.MAYUN_ASSET_URL + uploadType.getPath() + fileName;

                filePaths.put("coverImage150", coverImage150);
                filePaths.put("coverImage", coverImage);
                return filePaths;
            } else {
                throw new CcmFileException("只支持图片");
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new CcmFileException("上传图片到码云发生异常", e);
        }
    }
}

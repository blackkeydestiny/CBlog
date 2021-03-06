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
package com.ccm.blog.business.service.impl;

import com.ccm.blog.persistence.beans.BizArticleLook;
import com.ccm.blog.persistence.mapper.BizArticleLookMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ccm.blog.business.entity.ArticleLook;
import com.ccm.blog.business.service.BizArticleLookService;
import com.ccm.blog.business.vo.ArticleLookConditionVO;
import com.ccm.blog.persistence.beans.BizArticleLook;
import com.ccm.blog.persistence.mapper.BizArticleLookMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 文章浏览记录
 *
 * @author chuming.chen
 * @version 1.0
 * @website https://www.chuming.online
 * @date 2018/4/16 16:26
 * @since 1.0
 */
@Service
public class BizArticleLookServiceImpl implements BizArticleLookService {

//    @Autowired
//    private BizArticleLookMapper bizArticleLookMapper;

    private final BizArticleLookMapper bizArticleLookMapper;
    @Autowired
    public BizArticleLookServiceImpl(BizArticleLookMapper bizArticleLookMapper){
        this.bizArticleLookMapper = bizArticleLookMapper;
    }

    /**
     * 分页查询
     *
     * @param vo ArticleLookConditionVO
     * @return ArticleLook's PageInfo
     */
    @Override
    public PageInfo<ArticleLook> findPageBreakByCondition(ArticleLookConditionVO vo) {
        PageHelper.startPage(vo.getPageNumber(), vo.getPageSize());
        List<BizArticleLook> list = bizArticleLookMapper.findPageBreakByCondition(vo);
        if (CollectionUtils.isEmpty(list)) {
            return null;
        }
        List<ArticleLook> boList = new ArrayList<>();
        for (BizArticleLook bizArticleLook : list) {
            boList.add(new ArticleLook(bizArticleLook));
        }
        PageInfo bean = new PageInfo<BizArticleLook>(list);
        bean.setList(boList);
        return bean;
    }

    /**
     * 保存一个实体，null的属性不会保存，会使用数据库默认值
     *
     * @param entity ArticleLook
     * @return ArticleLook
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ArticleLook insert(ArticleLook entity) {
        Assert.notNull(entity, "ArticleLook不可为空！");
        entity.setUpdateTime(new Date());
        entity.setCreateTime(new Date());
        bizArticleLookMapper.insertSelective(entity.getBizArticleLook());
        return entity;
    }

    /**
     * 批量插入，支持批量插入的数据库可以使用，例如MySQL,H2等，另外该接口限制实体包含id属性并且必须为自增列
     *
     * @param entities ArticleLook's List
     */
    @Override
    public void insertList(List<ArticleLook> entities) {
        Assert.notNull(entities, "ArticleLooks不可为空！");
        List<BizArticleLook> list = new ArrayList<>();
        for (ArticleLook entity : entities) {
            entity.setUpdateTime(new Date());
            entity.setCreateTime(new Date());
            list.add(entity.getBizArticleLook());
        }
        bizArticleLookMapper.insertList(list);
    }

    /**
     * 根据主键字段进行删除，方法参数必须包含完整的主键属性
     *
     * @param primaryKey primary Key
     * @return false or true
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean removeByPrimaryKey(Integer primaryKey) {
        return bizArticleLookMapper.deleteByPrimaryKey(primaryKey) > 0;
    }

    /**
     * 根据主键更新实体全部字段，null值会被更新
     *
     * @param entity ArticleLook
     * @return false or true
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean update(ArticleLook entity) {
        Assert.notNull(entity, "ArticleLook不可为空！");
        entity.setUpdateTime(new Date());
        return bizArticleLookMapper.updateByPrimaryKey(entity.getBizArticleLook()) > 0;
    }

    /**
     * 根据主键更新属性不为null的值
     *
     * @param entity ArticleLook
     * @return false or true
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateSelective(ArticleLook entity) {
        Assert.notNull(entity, "ArticleLook不可为空！");
        entity.setUpdateTime(new Date());
        return bizArticleLookMapper.updateByPrimaryKeySelective(entity.getBizArticleLook()) > 0;
    }

    /**
     * 根据主键字段进行查询，方法参数必须包含完整的主键属性，查询条件使用等号
     *
     * @param primaryKey primary Key
     * @return ArticleLook
     */
    @Override
    public ArticleLook getByPrimaryKey(Integer primaryKey) {
        Assert.notNull(primaryKey, "PrimaryKey不可为空！");
        BizArticleLook entity = bizArticleLookMapper.selectByPrimaryKey(primaryKey);
        return null == entity ? null : new ArticleLook(entity);
    }

    /**
     * 根据实体中的属性进行查询，只能有一个返回值，有多个结果时抛出异常，查询条件使用等号
     *
     * @param entity ArticleLook
     * @return ArticleLook
     */
    @Override
    public ArticleLook getOneByEntity(ArticleLook entity) {
        Assert.notNull(entity, "ArticleLook不可为空！");
        BizArticleLook bo = bizArticleLookMapper.selectOne(entity.getBizArticleLook());
        return null == bo ? null : new ArticleLook(bo);
    }

    /**
     * 查询全部结果，listByEntity(null)方法能达到同样的效果
     *
     * @return ArticleLook's list
     */
    @Override
    public List<ArticleLook> listAll() {
        List<BizArticleLook> entityList = bizArticleLookMapper.selectAll();

        if (CollectionUtils.isEmpty(entityList)) {
            return null;
        }
        List<ArticleLook> list = new ArrayList<>();
        for (BizArticleLook entity : entityList) {
            list.add(new ArticleLook(entity));
        }
        return list;
    }

    /**
     * 根据实体中的属性值进行查询，查询条件使用等号
     *
     * @param entity ArticleLook
     * @return ArticleLook's list
     */
    @Override
    public List<ArticleLook> listByEntity(ArticleLook entity) {
        Assert.notNull(entity, "ArticleLook不可为空！");
        List<BizArticleLook> entityList = bizArticleLookMapper.select(entity.getBizArticleLook());
        if (CollectionUtils.isEmpty(entityList)) {
            return null;
        }
        List<ArticleLook> list = new ArrayList<>();
        for (BizArticleLook po : entityList) {
            list.add(new ArticleLook(po));
        }
        return list;
    }
}

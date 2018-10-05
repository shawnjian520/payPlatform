<%@ page language="java" pageEncoding="utf-8" %>
<h1 id="list" class="page-header">
    增/删/改/查
</h1>

<h2 id="list-explanation">说明</h2>
<p>
    用于 新增 修改 查询 删除 数据

    <%--用于以列表的方式显示数据,并提供 <code>查询条件</code> <code>分页</code> <code>排序</code> 等功能--%>
</p>

<h2 id="list-specification">创建过程</h2>
<p>
    以下为所需文件路径及命名示例<br/>
<div class="table-responsive">
    <table class="table table-bordered table-striped">
        <thead>
        <tr>
            <th>所需文件</th>
            <th>
                创建的路径及示例
            </th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th class="text-nowrap" scope="row">entity</th>
            <td>
                <a href="#list-entity">project/src/com/apexedu/biz/entity/Sample.java</a>
            </td>
        </tr>
        <tr>
            <th class="text-nowrap" scope="row">service</th>
            <td>
                <a href="#list-service">project/src/com/apexedu/biz/service/impl/SampleService.java</a>
            </td>
        </tr>
        <tr>
            <th class="text-nowrap" scope="row">controller</th>
            <td>
                <a href="#list-controller">project/src/com/apexedu/biz/controller/SampleController.java</a>
            </td>
        </tr>
        <tr>
            <th class="text-nowrap" scope="row">page</th>
            <td>
                <a href="#list-page">project/WebRoot/WEB-INF/view/jsp/business/sample/list.jsp</a><br />
                <a href="#list-page-input">project/WebRoot/WEB-INF/view/jsp/business/sample/input.jsp</a>
            </td>
        </tr>
        </tbody>
    </table>
</div>
</p>

<h2 id="list-example">示例</h2>

<p>
    <h4 id="list-entity">1.创建实体类</h4>
    <pre class="syntax brush-java">
package com.jd.system.entity;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by tengchong on 15/7/30.
 */
@Entity
@Table(name = "T_BIZ_SAMPLE")
public class TBizSample {
    private String wid;
    private String name;

    @Id
    @Column(name = "WID")
    public String getWid() {
        return wid;
    }
    public void setWid(String wid) {
        this.wid = wid;
    }
    @Basic
    @Column(name = "NAME")
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
}</pre>
<h4 id="list-service">2.创建service</h4>
    <pre class="syntax brush-java">
package com.jd.system.service.impl;

import com.jd.system.entity.TBizSample;
import com.jd.framework.util.DBUtil;
import com.jd.framework.util.Pager;
import com.jd.framework.util.SeqFactory;
import com.jd.sys.action.ExcelUserImportAction;
import com.jd.sys.service.ExcelImportCustomService;
import com.jd.sys.service.impl.BaseAbstractService;
import com.jd.util.DateUtil;
import com.jd.util.StringUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import java.util.ArrayList;
import java.util.List;

@Service(value = "sampleServiceImpl")
public class SampleServiceImpl extends BaseAbstractService implements ExcelImportCustomService {
    //查询
    public List list(Object mode, Pager pager) throws Exception {
        ModelMap modelMap = (ModelMap) mode;
        //参数
        List&lt;Object&gt; params = new ArrayList();
        //查询条件
        TBizSample object = (TBizSample) modelMap.get("object");
        //查询语句
        String sql = "select t.wid,t.name from t_biz_sample t where 1=1 ";
        //拼接条件
        if (StringUtils.isNotBlank(object.getName())) {
            sql += "and t.name like ?";
            params.add("%" + object.getName() + "%");
        }
        //查询总数
        int count = DBUtil.count("select count(1) from (" + sql + ")", params.toArray());
        //设置分页
        pager.setTotalRows(count);
        //查询数据
        List&lt;TBizSample&gt; list = DBUtil.queryPageBeanList(pager, sql, TBizSample.class, params.toArray());
        return list;
    }
    //查询单个实体数据
    public void load(Object mode) throws Exception {
        ModelMap modelMap = (ModelMap) mode;
        String wid = (String) modelMap.get("wid");
        TBizSample object = DBUtil.queryBean("select * from t_biz_sample where wid=?", TBizSample.class, wid);
        modelMap.put("object", object);
    }
    //保存
    public Object saveOrUpdateData(Object arg0) throws Exception {
        ModelMap modelMap = (ModelMap) arg0;
        TBizSample object = (TBizSample) modelMap.get("object");
        if (StringUtil.isBlank(object.getWid())) {
            object.setWid(SeqFactory.getNewSequenceAlone());
            getBaseDao().save(object);
        } else {
            getBaseDao().update(object);
        }
        return object;
    }
    //删除
    public boolean remove(Object arg0) throws Exception {
        ModelMap modelMap = (ModelMap) arg0;
        String wid = (String) modelMap.get("wid");
        boolean deleteSuccess = getBaseDao().deleteAll("TBizSample", "wid", "=", wid);
        return deleteSuccess;
    }
}</pre>

    <h4 id="list-controller">3.创建controller</h4>
    <pre class="syntax brush-java">
package com.jd.system.controller;

import com.jd.system.entity.TBizSample;
import com.jd.system.service.impl.SampleServiceImpl;
import com.jd.system.util.CommonQuery;
import com.jd.framework.util.Pager;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/biz/sample")  //用来处理请求地址映射的注解，可用于类或方法上。用于类上，表示类中的所有响应请求的方法都是以该地址作为父路径
public class SampleController {
    @Autowired
    private SampleServiceImpl service;

    //列表查询
    @RequestMapping("/list")
    public String List(@ModelAttribute("object")TBizSample object,
                       @ModelAttribute("pager")Pager pager, ModelMap modelmap,
                       HttpServletRequest request, HttpServletResponse response) throws Exception{
        modelmap.addAttribute("resultData", getService().list(modelmap, pager));
        return "sample/list.jsp";
    }
    //新增
    @RequestMapping("/openCreate")
    public String openCreate(ModelMap modelmap, HttpServletResponse response,
                             HttpServletRequest request) {
        return "sample/table/input.jsp";
    }
    //修改
    @RequestMapping("/input/{wid}")
    public String input(@PathVariable("wid") String wid, ModelMap modelmap,
                        HttpServletResponse response, HttpServletRequest request) {
        modelmap.put("wid", wid);
        try {
            getService().load(modelmap);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "sample/table/input.jsp";
    }
    //删除
    @RequestMapping("/remove")
    public void remove(String wid, ModelMap modelmap,
                       HttpServletResponse response, HttpServletRequest request) throws Exception{
        try {
            modelmap.put("wid", wid);
            boolean flag = getService().remove(modelmap);
            response.setContentType("application/json;charset=UTF-8");
            if (flag){
                CommonQuery.print(response, "{\"res\":true,\"msg\":\"删除成功!\",\"data\":{}}");
            }else{
                CommonQuery.print(response, "{\"res\":false,\"msg\":\"删除失败!\",\"data\":{}}");
            }
        } catch (Throwable var2) {
            CommonQuery.print(response, "{\"res\":false,\"msg\":\""+var2.getMessage()+"\",\"data\":{}}");
        }
    }
    //保存
    @RequestMapping(value = "/save", produces = {"application/json;charset=UTF-8"})
    public @ResponseBody
    void save(TBizSample object, ModelMap modelMap,
              HttpServletResponse response, HttpServletRequest request) throws  IOException{
        modelMap.put("object", object);
        try {
            Object obj = getService().saveOrUpdateData(modelMap);
            CommonQuery.print(response, "{\"res\":\"success\",\"msg\":\"保存成功!\",\"data\":" + JSONObject.fromObject(obj) + "}");
        } catch (Exception e) {
            CommonQuery.print(response, "{\"res\":\"danger\",\"msg\":\"保存失败!\",\"data\":{}}");
        }
    }
    public SampleServiceImpl getService() {
        return service;
    }
    private void setService(SampleServiceImpl service) {
        this.service = service;
    }
}</pre>
<h4 id="list-page">4.创建列表页面(list.jsp)</h4>
    <pre class="syntax brush-html">
&lt;%@ page language="java" pageEncoding="utf-8" %&gt;
&lt;%@ taglib prefix="jd" uri="/WEB-INF/TLD/custom.tld" %&gt;
&lt;%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %&gt;
&lt;%@include file="../../../common/list-header.jsp" %&gt;
&lt;div class="row"&gt;
    &lt;jd:lable id="studentName" col="3" lable="学生姓名"&gt;
        &lt;input type="text" id="studentName" name="studentName" class="form-control" value="${object.studentName}"/"&gt;
    &lt;/jd:lable&gt;
    &lt;div class="col-sm-12 searchbtn-group"&gt;
        &lt;a class="btn btn-sm btn-primary" onclick="tool.doSearch(this)"&gt;
            查询 &lt;i class="fa fa-search"&gt;&lt;/i&gt;
        &lt;/a&gt;
        &lt;a class="btn btn-sm btn-primary btn-reset" onclick="tool.resetForm(this)"&gt;
            重置 &lt;i class="fa fa-mail-reply-all"&gt;&lt;/i&gt;
        &lt;/a&gt;
    &lt;/div&gt;
&lt;/div&gt;
&lt;hr class="dividing-line mb10"/&gt;
&lt;div class="row"&gt;
    &lt;div class="col-md-12 space20"&gt;
        &lt;a class="btn btn-success btn-sm" data-startFrom="top" onclick="tool.addData(this)"&gt;新增 &lt;i class="fa fa-plus"&gt;&lt;/i&gt;&lt;/a&gt;
        &lt;a class="btn btn-success btn-sm" onclick="tool.doRemove(this)"&gt;删除 &lt;i class="fa fa-times"&gt;&lt;/i&gt;&lt;/a&gt;
        &lt;a class="btn btn-success btn-sm" data-startFrom="top" onclick="tool.editData(this)"&gt;修改 &lt;i class="fa fa-edit"&gt;&lt;/i&gt;&lt;/a&gt;
        &lt;div class="btn-group pull-right"&gt;
            &lt;%@include file="../../../common/other/page-size.jsp" %&gt;
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;
&lt;div class="dataTables_wrapper form-inline"&gt;
    &lt;table class="table table-striped table-hover dataTable table-bordered "&gt;
        &lt;thead&gt;
        &lt;tr&gt;
            &lt;th class="center w20"&gt;
                &lt;label&gt;
                    &lt;input type="checkbox" class="mgc selectall"&gt;
                &lt;/label&gt;
            &lt;/th&gt;
            &lt;th&gt;姓名&lt;/th&gt;
        &lt;/tr&gt;
        &lt;/thead&gt;
        &lt;tbody&gt;
        &lt;c:forEach items="${resultData}" var="obj"&gt;
            &lt;tr id="tr_${obj.wid}"&gt;
                &lt;td class="center w20"&gt;
                    &lt;label&gt;
                        &lt;input type="checkbox" name="selectNode" class="mgc foocheck" id="${obj.wid}" value="${obj.wid}"&gt;
                    &lt;/label&gt;
                &lt;/td&gt;
                &lt;td&gt;
                    &lt;a onclick="tool.editDataById(this,'${obj.wid}')" href="javascript:void(0)"&gt;${obj.name}&lt;/a&gt;
                &lt;/td&gt;
            &lt;/tr&gt;
        &lt;/c:forEach&gt;
        &lt;/tbody&gt;
    &lt;/table&gt;
&lt;/div&gt;
&lt;%@include file="../../../common/list-bottom.jsp" %&gt;
    </pre>
<h4 id="list-page-input">5.创建列表页面(input.jsp)</h4>
    <pre class="syntax brush-html">
&lt;%@ page language="java" pageEncoding="UTF-8" %"&gt;
&lt;%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %"&gt;
&lt;!-- 如需使用jd:*标签,必须引入 --!&gt;
&lt;%@ taglib prefix="jd" uri="/WEB-INF/TLD/custom.tld" %&gt;
&lt;%@include file="../../common/input-header.jsp" %&gt;
&lt;div class="col-md-10 col-md-offset-1""&gt;
    &lt;h3"&gt;示例新增&lt;/h3"&gt;
    &lt;hr"&gt;
    &lt;form role="form" class="form-horizontal""&gt;
        &lt;input type="hidden" name="wid" id="wid" value="${object.wid}""&gt;

        &lt;jd:lable id="studentName" col="3" lable="学生姓名"&gt;
            &lt;input type="text" id="studentName" name="studentName" class="validate[required,maxSize[15]] form-control" value="${object.studentName}"/"&gt;
        &lt;/jd:lable&gt;
        &lt;div class="col-md-offset-2 col-sm-9""&gt;
            &lt;button class="btn btn-success" type="button" onclick="tool.saveData(this)""&gt;
                保存 &lt;i class="fa fa-check""&gt;&lt;/i"&gt;
            &lt;/button"&gt;
        &lt;/div&gt;
    &lt;/form&gt;
&lt;/div"&gt;
&lt;%@include file="../../common/input-bottom.jsp" %&gt;
&lt;!-- 注:如有页面内js,必须在引入input-bottom.jsp之后 --!&gt;</pre>
</p>
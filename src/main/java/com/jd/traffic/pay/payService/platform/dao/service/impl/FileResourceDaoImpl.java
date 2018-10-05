package com.jd.traffic.pay.payService.platform.dao.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.jd.framework.util.DBUtil;
import com.jd.system.service.BaseAbstractService;
import com.jd.traffic.pay.payService.platform.dao.service.FileResourceDao;
import com.jd.traffic.pay.payService.platform.model.FileResource;

@Repository
public class FileResourceDaoImpl  extends BaseAbstractService implements FileResourceDao{

	@Override
	public void insert(FileResource fileResource) {
		getBaseDao().save(fileResource);
	}

	@Override
	public FileResource selectById(String id) {
		FileResource fileResource = new FileResource();
		fileResource.setId(id);
		return getBaseDao().findById(fileResource.getClass(), fileResource);
	}

	@Override
	public FileResource selectByFileId(String fieldId) {
		StringBuffer sb = new StringBuffer();
		sb.append("select * from FILE_RESOURCE where 1=1  and FILE_ID=?");
		List<Object> params = new ArrayList<Object>();
		params.add(fieldId);
		FileResource  fileResource = DBUtil.queryBean(sb.toString(),FileResource.class,params.toArray());
		return fileResource;
	}
}

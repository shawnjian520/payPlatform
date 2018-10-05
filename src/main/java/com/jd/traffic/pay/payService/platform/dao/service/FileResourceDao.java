package com.jd.traffic.pay.payService.platform.dao.service;

import com.jd.traffic.pay.payService.platform.model.FileResource;

public interface FileResourceDao {
	 void insert(FileResource fileResource);
	 FileResource selectById(String id);
	 FileResource selectByFileId(String fieldId);
	 
}

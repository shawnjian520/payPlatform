package com.jd.traffic.pay.payService.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jd.system.service.BaseAbstractService;
import com.jd.traffic.pay.payService.platform.dao.service.FileResourceDao;
import com.jd.traffic.pay.payService.platform.model.FileResource;
import com.jd.traffic.pay.payService.platform.service.FileResourceService;

@Service
public class FileResourceServiceImpl extends BaseAbstractService implements FileResourceService{
    @Autowired
    private FileResourceDao fileResourceDao;

    public void createFileResource(FileResource fileResource) {
        if (fileResource == null) {
            throw new IllegalArgumentException();
        }

        fileResourceDao.insert(fileResource);
    }

    public FileResource getFileResourceByPrimarykey(String id) {
        return fileResourceDao.selectById(id);
    }

    public FileResource getFileResource(String fileId) {
        return fileResourceDao.selectByFileId(fileId);
    }

}

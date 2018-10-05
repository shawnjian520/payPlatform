package com.jd.traffic.pay.payService.platform.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

/**
 * @ClassName: FileResource
 * @Description:存储文件， 如微信退款的凭证文件
 * @author: zhangjian
 * @date: 2018年4月27日 下午5:27:54
 */
@Entity
@Table(name = "FILE_RESOURCE")
public class FileResource implements java.io.Serializable {
	/**主键**/
	private String id;
	/**文件唯一标识**/
	private String fileId;
	/**文件内容**/
	private byte[] fileData;
	/**文件名称**/
	private String fileName;
	/**文件大小**/
	private Integer fileSize;
	/**文件类型**/
	private String fileType;


	/** default constructor */
	public FileResource() {
	}

	/** minimal constructor */
	public FileResource(String id, byte[] fileData, Integer fileSize,
	        String fileType) {
		this.id = id;
		this.fileData = fileData;
		this.fileSize = fileSize;
		this.fileType = fileType;
	}

	/** full constructor */
	public FileResource(String id, String fileId, byte[] fileData,
	        String fileName, Integer fileSize, String fileType) {
		this.id = id;
		this.fileId = fileId;
		this.fileData = fileData;
		this.fileName = fileName;
		this.fileSize = fileSize;
		this.fileType = fileType;
	}

	// Property accessors
	@Id

	@Column(name = "ID", unique = true, nullable = false, length = 32)

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "FILE_ID", length = 32)

	public String getFileId() {
		return this.fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	@Lob
	@Column(name = "FILE_DATA", nullable = false)

	public byte[] getFileData() {
		return this.fileData;
	}

	public void setFileData(byte[] fileData) {
		this.fileData = fileData;
	}

	@Column(name = "FILE_NAME", length = 100)

	public String getFileName() {
		return this.fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Column(name = "FILE_SIZE", nullable = false, precision = 0)

	public Integer getFileSize() {
		return this.fileSize;
	}

	public void setFileSize(Integer fileSize) {
		this.fileSize = fileSize;
	}

	@Column(name = "FILE_TYPE", nullable = false, length = 50)

	public String getFileType() {
		return this.fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

}
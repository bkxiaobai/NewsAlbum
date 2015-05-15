package com.kinthtime.venue.form;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;
import com.kinthtime.venue.action.UploadFileVenScanPapers;

public class VenueForm extends ActionForm{
	

	
	private List<UploadFileVenScanPapers> filevenScanPapersList;  //证件及批文的扫描件

	//初始化集合
	public VenueForm(){
		filevenScanPapersList=new ArrayList<UploadFileVenScanPapers>();
	
	}


	public List<UploadFileVenScanPapers> getFilevenScanPapersList() {
		return filevenScanPapersList;
	}


	public void setFilevenScanPapersList(List<UploadFileVenScanPapers> filevenScanPapersList) {
		this.filevenScanPapersList = filevenScanPapersList;
	}

    /**
     * 这个是用来到界面上获取多个file文件的
     * 
     * @param index
     * @return
     */
	public UploadFileVenScanPapers getUploadFileVenScanPapers(int index){
		int size=this.filevenScanPapersList.size();
		if(index>size-1){
	    	this.filevenScanPapersList.add(new UploadFileVenScanPapers());
		}
		return this.filevenScanPapersList.get(index);
	}

}

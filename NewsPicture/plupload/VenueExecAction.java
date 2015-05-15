package com.kinthtime.venue.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;
import org.apache.struts.upload.MultipartRequestHandler;
import org.apache.struts.upload.MultipartRequestWrapper;


import com.kinthtime.frame.action.BaseAction;


public class VenueExecAction extends BaseAction {

	SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
    String inputDate=format.format(new Date());
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
			
			}

	/**
	 * 保存上传文件
	 * @param formFile
	 * @throws IOException
	 */
	private String saveFile(FormFile formFile,String filePath) throws IOException{
		String fileNameFalse="";
		try {
			// TODO Auto-generated method stub
			String fileName = formFile.getFileName();
			/* Save file on the server */
			long random = System.currentTimeMillis();
			String prefix = String.valueOf(random);
			// 得到文件的扩展名(无扩展名时将得到全名)
			String t_ext = fileName.substring(fileName.lastIndexOf("."));
			//虚名
		    fileNameFalse= prefix+t_ext;
			if (!fileName.equals("")) {
				//Create file
				File fileToCreate = new File(filePath,fileNameFalse);
				//If file does not exists create file                      
				if (!fileToCreate.exists()) {
					FileOutputStream fileOutStream = new FileOutputStream(
							fileToCreate);
					fileOutStream.write(formFile.getFileData());
					fileOutStream.flush();
					fileOutStream.close();
				}
			}
		
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		return fileNameFalse;
	}


}

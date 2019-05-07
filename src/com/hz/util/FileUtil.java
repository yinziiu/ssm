package com.hz.util;

import java.io.File;
import java.io.IOException;
import java.util.*;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.multipart.MultipartFile;

/**
 * 
  * @ClassName FileUtil
  * @Description 一些公共的文件操作方法，包括增删改
  * @date 2018-1-25
 */

public class FileUtil {

	private static Map<String, String> resourceMap = PropertiesUtils.getProperties("resource.properties");

	/**
	 * 
	* @Description: 保存文件到服务器的方法
	* @return List<String> 返回list,第一元素为文件的服务器存储路径
	* 						第二个元素（若有）为该图片的拍摄日期
	 */
	public static List<String> saveFile(MultipartFile uploadFile,HttpServletRequest request,String serverUrl) throws IllegalStateException, IOException{
		List<String> strList=new ArrayList<String>();
		//保存头像资源到服务器
		ServletContext servletContext = request.getSession().getServletContext();
		//upload文件夹的绝对路径
		//String realpath = servletContext.getRealPath("/images/img");
		
		String realpath = resourceMap.get("SERVER_URL_LOCAL") + resourceMap.get("SERVER_URL");
		
		//判断此文件夹是否存在，不存在的话，创建一个
		File dirFile=new File(realpath);
		if(!dirFile.exists()){
			//创建文件夹
			dirFile.mkdirs();
		}
		  
		// 检查扩展名
		String fileExt = uploadFile.getOriginalFilename().substring(uploadFile.getOriginalFilename().lastIndexOf(".") + 1).toLowerCase();
		  
		//保存的头像名字：上传当前时间的毫秒值+原来的名字+后缀
		String fileName = System.currentTimeMillis() + "_" + new Random().nextInt(1000) + "." + fileExt;

		  //服务器访问的相对路径，保存在数据库中
		  String fileUrl=serverUrl+fileName;
		  strList.add(fileUrl);
		  //保存文件的完整的绝对路径
		  String path = realpath + File.separator + fileName;
		  File file=new File(path);
		  //写到次磁盘中
		  uploadFile.transferTo(file);
		  //把访问的路径设置到bean中，保存到数据库中
		 return strList;
	}
	/**
	 * 
	* @Description: 删除一个文件的方法，传入参数为数据库保存的文件相对服务器访问路径
	* @return void
	 */
	public static void deleteFile(String fileUrl,HttpServletRequest request){
		int index=fileUrl.lastIndexOf("/");//得到最后一个要切割的索引
		String fileName=fileUrl.substring(index+1, fileUrl.length());//切割得到头像文件的文件名
		ServletContext servletContext = request.getSession().getServletContext();
		// String realPath=servletContext.getRealPath("/assets/upload");//得到磁盘保存头像的绝对路径
		String realPath = resourceMap.get("SERVER_URL_LOCAL") + resourceMap.get("SERVER_URL");
		//拼接得到文件的磁盘绝对路
		String path=realPath+"\\"+fileName;//头像的磁盘全路径
		//直接删除头像文件
		File file=new File(path);
		if(file.exists()){
			file.delete();
		}
	}
	/*
	 * 判断文件是否是图片
	 */
	public static boolean checkPic(String suffix) {
		 //声明图片后缀名数组  
		 String imgeArray [] = 
		   {"bmp","dib", "gif",  
			"jfif", "jpe", "jpeg", 
			"jpg", "png", "tif",  
		   "tiff", "ico"  
		   };  
		 for (String string : imgeArray) {
			if(string.equals(suffix.toLowerCase()))
				return true;
		}
		
		return false;
		
	}
	/**
	 * 判断文件是否是视频
	 */
	public static boolean checkVideo(String suffix) {
		 //声明图片后缀名数组  
		 String videoArray [] = 
		   {"swf","flv","mp3","wav",
			"wma","wmv","mid","avi",
			"mpg","asf","rm","rmvb",
			"mp4","m4a"}
		   ;
		 for (String string : videoArray) {
			if(string.equals(suffix.toLowerCase()))
				return true;
		}
		
		return false;
		
	}
	
	/**
	 * 判断文件是否是Excel
	 */
	public static boolean checkExcel(String suffix) {
		 //声明图片后缀名数组  
		 String excelArray [] = 
		   {"xls","xlsx","xlsb","txt",
			"doc","docx","ppt","html",
			"zip","rar"
		   };  
		 for (String string : excelArray) {
			if(string.equals(suffix.toLowerCase()))
				return true;
		}
		
		return false;
		
	}
	
}

package com.hz.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.hz.model.Notes;
import com.hz.model.Strategy;
import com.hz.service.INotesService;
import com.hz.service.IStrategyService;
import com.hz.util.FileUtil;

@Controller
public class WebNotesController {
	
	@Autowired
	private INotesService notesService;
	@Autowired
	private IStrategyService strategyService;
	@Value("${SERVER_URL}")
    private String SERVER_URL;
	
	
	@ResponseBody
	@RequestMapping("web/notes")
	public ModelAndView toNotes(HttpServletRequest request,@RequestParam(value = "currentPage",required=false,defaultValue="1")Integer currentPage)throws Exception{
		ModelAndView mav = new ModelAndView();
		
		List<Notes> notesList = notesService.getNotesList1(currentPage);
		PageInfo<Notes> page = new PageInfo<Notes>(notesList);
		Long notesTotal = notesService.getNotesListTotal();
		mav.addObject("notesList", notesList);
		mav.addObject("page", page);
		mav.addObject("notesTotal", notesTotal);
		
        
		List<Notes> notesList1 = notesService.getNotesList2();
		mav.addObject("notesList1", notesList1);
		
		List<Strategy> list = strategyService.getStrategyList4();
		mav.addObject("list", list);
		
		mav.setViewName("views/notes/notes");
		return mav;
	}
	
	/**
	 * 游记详情页
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("web/notes_detail")
	public ModelAndView toNotes_detail(@RequestParam int id )throws Exception{
		ModelAndView mav = new ModelAndView();
		
		List<Notes> notes = notesService.getNotesListById(id);
		mav.addObject("notes", notes);
		List<Notes> notes2 = notesService.getNotesList2();
		mav.addObject("notes2", notes2);
		
		mav.setViewName("views/notes/notes_detail");
		return mav;
	}
	
	/**
	 * 写游记
	 * @return
	 */
	@RequestMapping("web/writenotes")
	public ModelAndView WriteNotes() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("views/notes/write_notes");
		return mav;
	}
	
	@RequestMapping("web/savenotes")
	public ModelAndView savenotes(Notes notes,HttpServletRequest request,
			@RequestParam(value = "nphoto", required = false) MultipartFile uploadFile) {
		ModelAndView mav = new ModelAndView();
		try {
			if (uploadFile != null) {
				String fileName = uploadFile.getOriginalFilename();
				String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
				if (StringUtils.isNotBlank(fileName) && FileUtil.checkPic(suffix)) {
					List<String> strList = FileUtil.saveFile(uploadFile, request, SERVER_URL);
					notes.setNotesphoto(strList.get(0));
				}
			}
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
	        String timeStr = df.format(new Date());// new Date()为获取当前系统时间
	        notes.setNotestime(timeStr);
	        notesService.saveNotes(notes);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		mav.setViewName("forward:/web/notes");
		return mav;
	}
	
	/**
	 * 写游记
	 * @return
	 */
	@RequestMapping("web/updatenotes")
	public ModelAndView WriteNotes(@RequestParam int id) {
		ModelAndView mav = new ModelAndView();
		Notes notes = notesService.getNotesListById2(id);
		mav.addObject("notes", notes);
		mav.setViewName("views/notes/update_notes");
		return mav;
	}
	
	@RequestMapping("web/update_notes")
	public ModelAndView updatenotes(Notes notes,HttpServletRequest request,
			@RequestParam(value = "nphoto", required = false) MultipartFile uploadFile,@RequestParam int id) {
		ModelAndView mav = new ModelAndView();
		try {
			if (uploadFile != null) {
				String fileName = uploadFile.getOriginalFilename();
				String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
				if (StringUtils.isNotBlank(fileName) && FileUtil.checkPic(suffix)) {
					Notes notes2 = notesService.getNotesListById2(notes.getId());
					if (null != notes2.getNotesphoto() && "" !=  notes2.getNotesphoto()) {
						FileUtil.deleteFile(notes2.getNotesphoto(),request);
					}
					List<String> strList = FileUtil.saveFile(uploadFile, request, SERVER_URL);
					notes.setNotesphoto(strList.get(0));
				}
			}
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
	        String timeStr = df.format(new Date());// new Date()为获取当前系统时间
	        notes.setNotestime(timeStr);
	        id = notes.getId();
	        notesService.updateNotes(notes);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		mav.setViewName("forward:/web/notes_detail");
		return mav;
	}
	
	/**
	 * 写游记
	 * @return
	 */
	@RequestMapping("web/deletenotes")
	public ModelAndView deletenotes(@RequestParam int id,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Notes notes2 = notesService.getNotesListById2(id);
		if (null != notes2.getNotesphoto() && "" !=  notes2.getNotesphoto()) {
			FileUtil.deleteFile(notes2.getNotesphoto(),request);
		}
		notesService.deleteNotes(id);
		mav.setViewName("forward:/web/notes");
		return mav;
	}
	
	

}

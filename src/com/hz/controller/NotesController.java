package com.hz.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hz.model.Notes;
import com.hz.model.layer.Json;
import com.hz.service.INotesService;

@Controller
public class NotesController {
	
	@Autowired
	private INotesService notesService;
	
	/**
	 * 游记列表
	 * @return
	 */
	@RequestMapping("getNotesList")
	public ModelAndView listUser() {
		ModelAndView mav = new ModelAndView();
		List<Notes> notesList = notesService.getNotesList();
		Long totalList = notesService.getNotesListTotal();
		// 放入转发参数
		mav.addObject("notesList", notesList);
		mav.addObject("totalList", totalList);
		// 放入jsp路径
		mav.setViewName("admin/notes/notes-list");
		return mav;
	}
	
	/**
    * 删除游记
    */
   @ResponseBody
   @RequestMapping(value = "deleteNotes",method = RequestMethod.POST)
   public Json deleteNotes(int id,HttpServletRequest request){
	   Json j = new Json();
		try {
			notesService.deleteNotes(id);
			j.setSuccess(true);
			j.setMsg("删除成功！");
		} catch (Exception e) {
			j.setMsg("操作失败！");
			e.printStackTrace();
		}
		return j;
   }

}

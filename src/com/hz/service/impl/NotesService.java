package com.hz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.hz.dao.NotesMapper;
import com.hz.model.Notes;
import com.hz.service.INotesService;
import com.sun.xml.internal.ws.policy.privateutil.PolicyUtils.Commons;

@Service
public class NotesService implements INotesService {
	
	@Autowired
	private NotesMapper notesMapper;

	@Override
	public List<Notes> getNotesList() {
		return notesMapper.getNotesList();
	}

	@Override
	public Long getNotesListTotal() {
		return notesMapper.getNotesListTotal();
	}
	
	@Override
	public List<Notes> getNotesList1(Integer currentPage) {
		PageHelper.startPage(currentPage, 10);
		return notesMapper.getNotesList1();
	}
	
	@Override
	public List<Notes> getNotesList2() {
		return notesMapper.getNotesList2();
	}

	@Override
	public List<Notes> getNotesListById(int id) {
		return notesMapper.getNotesListById(id);
	}

	@Override
	public List<Notes> getNotesByUId(int id) {
		return notesMapper.getNotesByUId(id);
	}

	@Override
	public Long getNotesTotalByUId(int id) {
		return notesMapper.getNotesTotalByUId(id);
	}
	@Override
	public List<Notes> getNotes2ByUId(int id,Integer currentPage) {
		PageHelper.startPage(currentPage, 5);
		return notesMapper.getNotes2ByUId(id);
	}

	@Override
	public void deleteNotes(int id) {
		notesMapper.deleteNotes(id);
	}

	@Override
	public void saveNotes(Notes notes) {
		notesMapper.saveNotes(notes);
	}

	@Override
	public Notes getNotesListById2(int id) {
		return notesMapper.getNotesListById2(id);
	}

	@Override
	public void updateNotes(Notes notes) {
		notesMapper.updateNotes(notes);
	}
	

}

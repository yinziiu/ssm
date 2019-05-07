package com.hz.service;

import java.util.List;

import com.hz.model.Notes;

public interface INotesService {
	
	public List<Notes> getNotesList();
	
	public Long getNotesListTotal();
	
	public List<Notes> getNotesList1(Integer currentPage);
	
	public List<Notes> getNotesList2();
	
	public List<Notes> getNotesListById(int id);
	
	public List<Notes> getNotesByUId(int id);
	
	public Long getNotesTotalByUId(int id);
	
	public List<Notes> getNotes2ByUId(int id,Integer currentPage);
	
	public void deleteNotes(int id);
	
	public void saveNotes(Notes notes);
	
	public Notes getNotesListById2(int id);
	
	public void updateNotes(Notes notes);
	

}

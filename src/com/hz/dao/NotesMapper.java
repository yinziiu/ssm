package com.hz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hz.model.Notes;

public interface NotesMapper {
	
	public List<Notes> getNotesList();
	
	public Long getNotesListTotal();
	
	public List<Notes> getNotesList1();
	
	public List<Notes> getNotesList2();
	
	public List<Notes> getNotesListById(@Param("id")int id);
	
	public List<Notes> getNotesByUId(@Param("id")int id);
	
	public Long getNotesTotalByUId(@Param("id")int id);
	
	public List<Notes> getNotes2ByUId(@Param("id")int id);
	
	public void deleteNotes(@Param("id")int id);
	
	public void saveNotes(@Param("notes")Notes notes);
	
	public Notes getNotesListById2(@Param("id")int id);
	
	public void updateNotes(@Param("notes")Notes notes);

}

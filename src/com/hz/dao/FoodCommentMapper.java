package com.hz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hz.model.FoodComment;

public interface FoodCommentMapper {
	
	public List<FoodComment> getFoodCommentList();
	
	public Long getFoodCommentListtotal();
	
	public List<FoodComment> getFoodCommentList2();
	
	public List<FoodComment> getFoodCommentListByFID(@Param("id") int id);
	
	public Long getFoodCommentListTotalByFID(@Param("id") int id);
	
	public Long getFoodCommentTotalByUId(@Param("id") int id);
	
	public List<FoodComment> getFoodCommentByUId(@Param("id") int id);

	public List<FoodComment> getFoodComment2ByUId(@Param("id") int id);
	
	public void deleteFComment(@Param("id") int id);
	
	public void saveFoodComment(@Param("foodComment") FoodComment foodComment);
	
	public void updateFoodComment(@Param("foodComment") FoodComment foodComment);
	
	public void updateFoodCommentPhoto(@Param("foodComment") FoodComment foodComment);
}

package com.hz.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hz.model.FoodComment;

public interface IFoodCommentService {
	
	public List<FoodComment> getFoodCommentList();
	
	public Long getFoodCommentListtotal();
	
	public List<FoodComment> getFoodCommentList2();
	
	public List<FoodComment> getFoodCommentListByFID(int id,Integer currentPage);
	
	public Long getFoodCommentListTotalByFID(int id);
	
	public Long getFoodCommentTotalByUId(int id);
	
	public List<FoodComment> getFoodCommentByUId(int id);

	public List<FoodComment> getFoodComment2ByUId(int id);
	
	public void deleteFComment(int id);
	
	public void saveFoodComment(FoodComment foodComment);
	
	public void updateFoodComment( FoodComment foodComment);
	
	public void updateFoodCommentPhoto(FoodComment foodComment);
}

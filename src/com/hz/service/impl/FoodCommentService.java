package com.hz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.github.pagehelper.PageHelper;
import com.hz.dao.FoodCommentMapper;
import com.hz.model.FoodComment;
import com.hz.service.IFoodCommentService;

@Controller
public class FoodCommentService implements IFoodCommentService {
	
	@Autowired
	private FoodCommentMapper foodCommentMapper;

	@Override
	public List<FoodComment> getFoodCommentList() {
		return foodCommentMapper.getFoodCommentList();
	}

	@Override
	public Long getFoodCommentListtotal() {
		return foodCommentMapper.getFoodCommentListtotal();
	}
	
	@Override
	public List<FoodComment> getFoodCommentList2() {
		return foodCommentMapper.getFoodCommentList2();
	}
	
	public List<FoodComment> getFoodCommentListByFID(int id,Integer currentPage){
		PageHelper.startPage(currentPage, 10);
		return foodCommentMapper.getFoodCommentListByFID(id);
	}

	@Override
	public Long getFoodCommentListTotalByFID(int id) {
		return foodCommentMapper.getFoodCommentListTotalByFID(id);
	}

	@Override
	public Long getFoodCommentTotalByUId(int id) {
		return foodCommentMapper.getFoodCommentTotalByUId(id);
	}

	@Override
	public List<FoodComment> getFoodCommentByUId(int id) {
		return foodCommentMapper.getFoodCommentByUId(id);
	}
	
	@Override
	public List<FoodComment> getFoodComment2ByUId(int id) {
		return foodCommentMapper.getFoodComment2ByUId(id);
	}

	@Override
	public void deleteFComment(int id) {
		foodCommentMapper.deleteFComment(id);
	}

	@Override
	public void saveFoodComment(FoodComment foodComment) {
		foodCommentMapper.saveFoodComment(foodComment);
	}

	@Override
	public void updateFoodComment(FoodComment foodComment) {
		foodCommentMapper.updateFoodComment(foodComment);
	}

	@Override
	public void updateFoodCommentPhoto(FoodComment foodComment) {
		foodCommentMapper.updateFoodCommentPhoto(foodComment);
	}

}

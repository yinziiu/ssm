package com.hz.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hz.model.Food;

public interface IFoodService {
	
	public List<Food> getFoodList();
	
	public Long getFoodListTotal();
	
	public List<Food> getFoodList1(Integer currentPage);
	
	public List<Food> getFoodList2();
	
	public List<Food> getFoodListByID(int id);
	
	public List<Food> gethotFoodList();
	
	public void deleteFood(int id);
	
	public void saveFood(Food food);
	
	public Food getFoodById(int id);
	
	public void updateFPhoto(@Param("food")Food food);
	
	public void updateFood(@Param("food")Food food);
	
}

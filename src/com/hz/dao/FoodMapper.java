package com.hz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hz.model.Food;

public interface FoodMapper {
	
	public List<Food> getFoodList();
	
	public Long getFoodListTotal();
	
	public List<Food> getFoodList1();
	
	public List<Food> getFoodList2();
	
	public List<Food> getFoodListByID(@Param("id") int id);
	
	public List<Food> gethotFoodList();
	
	public void deleteFood(@Param("id") int id);
	
	public void saveFood(@Param("food")Food food);
	
	public Food getFoodById(@Param("id") int id);
	
	public void updateFPhoto(@Param("food")Food food);
	
	public void updateFood(@Param("food")Food food);
}

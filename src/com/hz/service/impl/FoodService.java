package com.hz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.hz.dao.FoodMapper;
import com.hz.model.Food;
import com.hz.model.FoodComment;
import com.hz.service.IFoodService;

@Service
public class FoodService implements IFoodService {
	
	@Autowired
	private FoodMapper foodMapper;

	@Override
	public List<Food> getFoodList() {
		return foodMapper.getFoodList();
	}

	@Override
	public Long getFoodListTotal() {
		return foodMapper.getFoodListTotal();
	}
	
	@Override
	public List<Food> getFoodList1(Integer currentPage) {
		PageHelper.startPage(currentPage, 10);
		return foodMapper.getFoodList1();
	}
	
	@Override
	public List<Food> getFoodList2() {
		return foodMapper.getFoodList2();
	}

	@Override
	public List<Food> getFoodListByID(int id) {
		return foodMapper.getFoodListByID(id);
	}

	@Override
	public List<Food> gethotFoodList() {
		return foodMapper.gethotFoodList();
	}

	@Override
	public void deleteFood(int id) {
		foodMapper.deleteFood(id);
	}

	@Override
	public void saveFood(Food food) {
		foodMapper.saveFood(food);
	}

	@Override
	public Food getFoodById(int id) {
		return foodMapper.getFoodById(id);
	}

	@Override
	public void updateFPhoto(Food food) {
		foodMapper.updateFPhoto(food);
	}

	@Override
	public void updateFood(Food food) {
		foodMapper.updateFood(food);
	}

}

package com.hz.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hz.model.Strategy;

public interface IStrategyService {
	
	public List<Strategy> getStrategyList();
	
	public Long getStrategyListTotal();
	
	public List<Strategy> getStrategyList2();
	
	public List<Strategy> getStrategyList3(Integer currentPage);
	
	public List<Strategy> getStrategyList4();
	
	public List<Strategy> getStrategyListById(int id);
	
	public List<Strategy> getStrategyList5();
	
	public void deleteStrategy(int id);
	
	public void saveStrategy(Strategy strategy);
	
	public void update_Strategy(Strategy strategy);
	
	public void update_sphoto(Strategy strategy);
	
	public Strategy getStrategyById(int id);

}

package com.hz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hz.model.Strategy;

public interface StrategyMapper {
	
	public List<Strategy> getStrategyList();
	
	public Long getStrategyListTotal();
	
	public List<Strategy> getStrategyList2();
	
	public List<Strategy> getStrategyList3();
	
	public List<Strategy> getStrategyList4();
	
	public List<Strategy> getStrategyListById(@Param("id") int id);
	
	public List<Strategy> getStrategyList5();
	
	public void deleteStrategy(@Param("id") int id);
	
	public void saveStrategy(@Param("strategy")Strategy strategy);
	
	public void update_Strategy(@Param("strategy")Strategy strategy);
	
	public void update_sphoto(@Param("strategy")Strategy strategy);
	
	public Strategy getStrategyById(@Param("id") int id);
	
	
	

}

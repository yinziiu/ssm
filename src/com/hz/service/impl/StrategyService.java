package com.hz.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.hz.dao.StrategyMapper;
import com.hz.model.Strategy;
import com.hz.service.IStrategyService;

@Service
public class StrategyService implements IStrategyService {
	
	@Autowired
	private StrategyMapper strategyMapper;

	@Override
	public List<Strategy> getStrategyList() {
		return strategyMapper.getStrategyList();
	}

	@Override
	public Long getStrategyListTotal() {
		return strategyMapper.getStrategyListTotal();
	}
	
	@Override
	public List<Strategy> getStrategyList2() {
		return strategyMapper.getStrategyList2();
	}
	
	@Override
	public List<Strategy> getStrategyList3(Integer currentPage) {
		PageHelper.startPage(currentPage, 10);
		return strategyMapper.getStrategyList3();
	}
	
	@Override
	public List<Strategy> getStrategyList4() {
		return strategyMapper.getStrategyList4();
	}

	@Override
	public List<Strategy> getStrategyListById(int id) {
		return strategyMapper.getStrategyListById(id);
	}
	
	@Override
	public List<Strategy> getStrategyList5() {
		return strategyMapper.getStrategyList5();
	}

	@Override
	public void deleteStrategy(int id) {
		strategyMapper.deleteStrategy(id);
	}

	@Override
	public void saveStrategy(Strategy strategy) {
		//封装属性postTime
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh-mm-ss");
		String time = sdf.format(new Date());
		strategy.setSttime(time);
		strategyMapper.saveStrategy(strategy);
	}

	@Override
	public void update_Strategy(Strategy strategy) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh-mm-ss");
		String time = sdf.format(new Date());
		strategy.setSttime(time);
		strategyMapper.update_Strategy(strategy);
	}

	@Override
	public void update_sphoto(Strategy strategy) {
		strategyMapper.update_sphoto(strategy);
	}

	@Override
	public Strategy getStrategyById(int id) {
		return strategyMapper.getStrategyById(id);
	}

}

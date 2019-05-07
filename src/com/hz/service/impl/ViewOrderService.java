package com.hz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hz.dao.ViewOrderMapper;
import com.hz.model.ViewOrder;
import com.hz.service.IViewOrderService;

@Service
public class ViewOrderService implements IViewOrderService {
	
	@Autowired
	private ViewOrderMapper viewOrderMapper;

	@Override
	public List<ViewOrder> getViewOrderList() {
		return viewOrderMapper.getViewOrderList();
	}

	@Override
	public Long getViewOrderListtotal() {
		return viewOrderMapper.getViewOrderListtotal();
	}

	@Override
	public List<ViewOrder> getViewOrderListByUID(int id) {
		return viewOrderMapper.getViewOrderListByUID(id);
	}

	@Override
	public List<ViewOrder> getViewOrderListById(int id) {
		return viewOrderMapper.getViewOrderListById(id);
	}

	@Override
	public void deleteViewOrder(int id) {
		viewOrderMapper.deleteViewOrder(id);
	}

	@Override
	public ViewOrder getViewOrderListById2(int id) {
		return viewOrderMapper.getViewOrderListById2(id);
	}

	@Override
	public void UpdateViewOrder(ViewOrder viewOrder) {
		viewOrderMapper.UpdateViewOrder(viewOrder);
	}

	@Override
	public Long getViewOrderTotalByUID(int id) {
		return viewOrderMapper.getViewOrderTotalByUID(id);
	}

	@Override
	public void saveViewTicket(ViewOrder viewOrder) {
		viewOrderMapper.saveViewTicket(viewOrder);
	}

	@Override
	public void updateStatus(ViewOrder viewOrder) {
		viewOrderMapper.updateStatus(viewOrder);
	}

}

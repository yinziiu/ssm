package com.hz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hz.dao.HotelInfoMapper;
import com.hz.model.HotelRoomInfo;
import com.hz.model.HotelComment;
import com.hz.model.HotelFac;
import com.hz.model.HotelInfo;
import com.hz.model.HotelRoomType;
import com.hz.model.HotelService1;
import com.hz.model.HotelStory;
import com.hz.model.HotelType;
import com.hz.service.IHotelInfoService;

@Service
public class HotelInfoService implements IHotelInfoService {
	
	@Autowired
	private HotelInfoMapper hotelInfoMapper;
	
	
	//酒店类型
	@Override
	public List<HotelType> getHotelType() {
		return hotelInfoMapper.getHotelType();
	}
	@Override
	public Long getHotelTypeTotal() {
		return hotelInfoMapper.getHotelTypeTotal();
	}
	@Override
	public void saveHotelType(HotelType hotelType) {
		hotelInfoMapper.saveHotelType(hotelType);
	}
	@Override
	public HotelType CheckHotelType(HotelType hotelType) {
		return hotelInfoMapper.CheckHotelType(hotelType);
	}
	@Override
	public HotelType getHotelTypeById(int id) {
		return hotelInfoMapper.getHotelTypeById(id);
	}
	@Override
	public void updateHotelType(HotelType hotelType) {
		hotelInfoMapper.updateHotelType(hotelType);
	}
	@Override
	public void deleteHotelType(int id) {
		hotelInfoMapper.deleteHotelType(id);
	}
	
	
	//房间类型
	@Override
	public List<HotelRoomType> getRoomListById(int id) {
		return hotelInfoMapper.getRoomListById(id);
	}
	@Override
	public HotelRoomType getHotelRoomById(int id) {
		return hotelInfoMapper.getHotelRoomById(id);
	}
	@Override
	public List<HotelRoomType> getHotelRoomType() {
		return hotelInfoMapper.getHotelRoomType();
	}
	@Override
	public Long getHotelRoomTypeTotal() {
		return hotelInfoMapper.getHotelRoomTypeTotal();
	}
	@Override
	public List<HotelRoomType> getHotelRoomType2(int id) {
		return hotelInfoMapper.getHotelRoomType2(id);
	}
	@Override
	public Long getHotelRoomTypeTotal2(int id) {
		return hotelInfoMapper.getHotelRoomTypeTotal2(id);
	}
	@Override
	public void saveHotelRoomType(HotelRoomType hotelRoomType) {
		hotelInfoMapper.saveHotelRoomType(hotelRoomType);
	}
	@Override
	public HotelRoomType CheckHotelRoomType(HotelRoomType hotelRoomType) {
		return hotelInfoMapper.CheckHotelRoomType(hotelRoomType);
	}
	@Override
	public HotelRoomType getHotelRoomTypeById(int id) {
		return hotelInfoMapper.getHotelRoomTypeById(id);
	}
	@Override
	public void updateHotelRoomType(HotelRoomType hotelRoomType) {
		hotelInfoMapper.updateHotelRoomType(hotelRoomType);
	}
	@Override
	public void deleteHotelRoomType(int id) {
		hotelInfoMapper.deleteHotelRoomType(id);
	}
	@Override
	public List<HotelRoomType> getHotelRoomPhoto(int id){
		return hotelInfoMapper.getHotelRoomPhoto(id);
	}
	@Override
	public void updateHotelRoomPhoto(HotelRoomType hotelRoomType) {
		hotelInfoMapper.updateHotelRoomPhoto(hotelRoomType);
	}

	//基本信息
	@Override
	public List<HotelInfo> getHotelInfoListById(int id) {
		return hotelInfoMapper.getHotelInfoListById(id);
	}
	@Override
	public List<HotelInfo> getHotelInfo() {
		return hotelInfoMapper.getHotelInfo();
	}
	@Override
	public Long getHotelInfoTotal2(int id) {
		return hotelInfoMapper.getHotelInfoTotal2(id);
	}
	@Override
	public List<HotelInfo> getHotelInfo2(int id) {
		return hotelInfoMapper.getHotelInfo2(id);
	}
	@Override
	public Long getHotelInfoTotal() {
		return hotelInfoMapper.getHotelInfoTotal();
	}
	@Override
	public void saveHotelInfo(HotelInfo hotelInfo) {
		hotelInfoMapper.saveHotelInfo(hotelInfo);
	}
	@Override
	public HotelInfo getHotelInfoById(int id) {
		return hotelInfoMapper.getHotelInfoById(id);
	}
	@Override
	public void updateHotelInfo(HotelInfo hotelInfo) {
		hotelInfoMapper.updateHotelInfo(hotelInfo);
	}
	@Override
	public void deleteHotelInfo(int id) {
		hotelInfoMapper.deleteHotelInfo(id);
	}

	//酒店服务
	@Override
	public List<HotelService1> getHotelServiceListById(int id) {
		return hotelInfoMapper.getHotelServiceListById(id);
	}
	@Override
	public List<HotelService1> getHotelService() {
		return hotelInfoMapper.getHotelService();
	}
	@Override
	public Long getHotelServiceTotal() {
		return hotelInfoMapper.getHotelServiceTotal();
	}
	@Override
	public void saveHotelService(HotelService1 hotelService1) {
		hotelInfoMapper.saveHotelService(hotelService1);
	}
	@Override
	public HotelService1 CheckHotelService(HotelService1 hotelService1) {
		return hotelInfoMapper.CheckHotelService(hotelService1);
	}
	@Override
	public HotelService1 getHotelServiceById(int id) {
		return hotelInfoMapper.getHotelServiceById(id);
	}
	@Override
	public void updateHotelService(HotelService1 hotelService1) {
		hotelInfoMapper.updateHotelService(hotelService1);
	}
	@Override
	public void deleteHotelService(int id) {
		hotelInfoMapper.deleteHotelService(id);
	}
	@Override
	public List<HotelService1> getHotelServiceByHid(int hid) {
		return hotelInfoMapper.getHotelServiceByHid(hid);
	}
	@Override
	public Long getHotelServiceByHidTotal(int hid) {
		return hotelInfoMapper.getHotelServiceByHidTotal(hid);
	}

	
	//酒店设施
	@Override
	public List<HotelFac> getHotelFacListById(int id) {
		return hotelInfoMapper.getHotelFacListById(id);
	}
	@Override
	public List<HotelFac> getHotelFac() {
		return hotelInfoMapper.getHotelFac();
	}
	@Override
	public Long getHotelFacTotal() {
		return hotelInfoMapper.getHotelFacTotal();
	}
	@Override
	public void saveHotelFac(HotelFac hotelFac) {
		hotelInfoMapper.saveHotelFac(hotelFac);
	}
	@Override
	public HotelFac CheckHotelFac(HotelFac hotelFac) {
		return hotelInfoMapper.CheckHotelFac(hotelFac);
	}
	@Override
	public HotelFac getHotelFacById(int id) {
		return hotelInfoMapper.getHotelFacById(id);
	}
	@Override
	public void updateHotelFac(HotelFac hotelFac) {
		hotelInfoMapper.updateHotelFac(hotelFac);
	}
	@Override
	public void deleteHotelFac(int id) {
		hotelInfoMapper.deleteHotelFac(id);
	}
	@Override
	public List<HotelFac> getHotelFacByHId(int hid) {
		return hotelInfoMapper.getHotelFacByHId(hid);
	}
	@Override
	public Long getHotelFacTotalByHId(int hid) {
		return hotelInfoMapper.getHotelFacTotalByHId(hid);
	}

	//房间设施
	@Override
	public List<HotelRoomInfo> getHotelRoomInfoListById(int id) {
		return hotelInfoMapper.getHotelRoomInfoListById(id);
	}
	@Override
	public List<HotelRoomInfo> getHotelRoomInfo() {
		return hotelInfoMapper.getHotelRoomInfo();
	}
	@Override
	public Long getHotelRoomInfoTotal() {
		return hotelInfoMapper.getHotelRoomInfoTotal();
	}
	@Override
	public void saveHotelRoomInfo(HotelRoomInfo hotelRoomInfo) {
		hotelInfoMapper.saveHotelRoomInfo(hotelRoomInfo);
	}
	@Override
	public HotelRoomInfo CheckHotelRoomInfo(HotelRoomInfo hotelRoomInfo) {
		return hotelInfoMapper.CheckHotelRoomInfo(hotelRoomInfo);
	}
	@Override
	public HotelRoomInfo getHotelRoomInfoById(int id) {
		return hotelInfoMapper.getHotelRoomInfoById(id);
	}
	@Override
	public void updateHotelRoomInfo(HotelRoomInfo hotelRoomInfo) {
		hotelInfoMapper.updateHotelRoomInfo(hotelRoomInfo);
	}
	@Override
	public void deleteHotelRoomInfo(int id) {
		hotelInfoMapper.deleteHotelRoomInfo(id);
	}
	
	//酒店故事
	@Override
	public List<HotelStory> getHotelStoryListById(int id) {
		return hotelInfoMapper.getHotelStoryListById(id);
	}
	@Override
	public List<HotelStory> getHotelStory() {
		return hotelInfoMapper.getHotelStory();
	}
	@Override
	public Long getHotelStoryTotal() {
		return hotelInfoMapper.getHotelStoryTotal();
	}
	@Override
	public void saveHotelStory(HotelStory hotelStory) {
		hotelInfoMapper.saveHotelStory(hotelStory);
	}
	@Override
	public HotelStory getHotelStoryById(int id) {
		return hotelInfoMapper.getHotelStoryById(id);
	}
	@Override
	public List<HotelStory> getHotelStoryById2(int id) {
		return hotelInfoMapper.getHotelStoryById2(id);
	}
	@Override
	public Long getHotelStoryTotal2(int id) {
		return hotelInfoMapper.getHotelStoryTotal2(id);
	}
	@Override
	public void updateHotelStory(HotelStory hotelStory) {
		hotelInfoMapper.updateHotelStory(hotelStory);
	}
	@Override
	public void deleteHotelStory(int id) {
		hotelInfoMapper.deleteHotelStory(id);
	}	
	public List<HotelRoomInfo> getHotelRoomInfoByHId(int hid){
		return hotelInfoMapper.getHotelRoomInfoByHId(hid);
	}
	public Long getHotelRoomInfoTotalByHId(int hid){
		return hotelInfoMapper.getHotelRoomInfoTotalByHId(hid);
	}
	
	
	
	
	

}

package com.hz.service;

import java.util.List;


import com.hz.model.HotelRoomInfo;
import com.hz.model.HotelFac;
import com.hz.model.HotelInfo;
import com.hz.model.HotelRoomType;
import com.hz.model.HotelService1;
import com.hz.model.HotelStory;
import com.hz.model.HotelType;

public interface IHotelInfoService {
	
	//酒店类型
	public List<HotelType> getHotelType();
	public Long getHotelTypeTotal();
	public void saveHotelType(HotelType hotelType);
	public HotelType CheckHotelType(HotelType hotelType);
	public HotelType getHotelTypeById(int id);
	public void updateHotelType(HotelType hotelType);
	public void deleteHotelType(int id);
	
	//房间类型
	public List<HotelRoomType> getRoomListById(int id);
	public List<HotelRoomType> getHotelRoomType();
	public Long getHotelRoomTypeTotal();
	public List<HotelRoomType> getHotelRoomType2(int id);
	public Long getHotelRoomTypeTotal2(int id);
	public void saveHotelRoomType(HotelRoomType hotelRoomType);
	public HotelRoomType CheckHotelRoomType(HotelRoomType hotelRoomType);
	public HotelRoomType getHotelRoomTypeById(int id);
	public void updateHotelRoomType(HotelRoomType hotelRoomType);
	public void deleteHotelRoomType(int id);
	public List<HotelRoomType> getHotelRoomPhoto(int id);
	public void updateHotelRoomPhoto(HotelRoomType hotelRoomType);
	public HotelRoomType getHotelRoomById(int id);
	
	//基本信息
	public List<HotelInfo> getHotelInfoListById(int id);
	public List<HotelInfo> getHotelInfo();
	public Long getHotelInfoTotal();
	public List<HotelInfo> getHotelInfo2(int id);
	public Long getHotelInfoTotal2(int id);
	public void saveHotelInfo(HotelInfo hotelInfo);
	public HotelInfo getHotelInfoById(int id);
	public void updateHotelInfo(HotelInfo hotelInfo);
	public void deleteHotelInfo(int id);
	
	//酒店服务
	public List<HotelService1> getHotelServiceListById(int id);
	public List<HotelService1> getHotelService();
	public Long getHotelServiceTotal();
	public void saveHotelService(HotelService1 hotelService1);
	public HotelService1 CheckHotelService(HotelService1 hotelService1);
	public HotelService1 getHotelServiceById(int id);
	public void updateHotelService(HotelService1 hotelService1);
	public void deleteHotelService(int id);
	public List<HotelService1> getHotelServiceByHid(int hid);
	public Long getHotelServiceByHidTotal(int hid);
	
	//酒店设施
	public List<HotelFac> getHotelFacListById(int id);
	public List<HotelFac> getHotelFac();
	public Long getHotelFacTotal();
	public void saveHotelFac(HotelFac hotelFac);
	public HotelFac CheckHotelFac(HotelFac hotelFac);
	public HotelFac getHotelFacById(int id);
	public void updateHotelFac(HotelFac hotelFac);
	public void deleteHotelFac(int id);
	public List<HotelFac> getHotelFacByHId(int hid);
	public Long getHotelFacTotalByHId(int hid);
	
	//房间设施
	public List<HotelRoomInfo> getHotelRoomInfoListById(int id);
	public List<HotelRoomInfo> getHotelRoomInfo();
	public Long getHotelRoomInfoTotal();
	public void saveHotelRoomInfo(HotelRoomInfo hotelRoomInfo);
	public HotelRoomInfo CheckHotelRoomInfo(HotelRoomInfo hotelRoomInfo);
	public HotelRoomInfo getHotelRoomInfoById(int id);
	public void updateHotelRoomInfo(HotelRoomInfo hotelRoomInfo);
	public void deleteHotelRoomInfo(int id);
	public List<HotelRoomInfo> getHotelRoomInfoByHId(int hid);
	public Long getHotelRoomInfoTotalByHId(int hid);
	
	
	//酒店故事
	public List<HotelStory> getHotelStoryListById(int id);
	public List<HotelStory> getHotelStory();
	public Long getHotelStoryTotal();
	public void saveHotelStory(HotelStory hotelStory);
	public HotelStory getHotelStoryById(int id);
	public List<HotelStory> getHotelStoryById2(int id);
	public Long getHotelStoryTotal2(int id);
	public void updateHotelStory(HotelStory hotelStory);
	public void deleteHotelStory(int id);
	
	
	
	
	

}

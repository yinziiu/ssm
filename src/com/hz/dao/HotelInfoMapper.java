package com.hz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hz.model.HotelRoomInfo;
import com.hz.model.HotelComment;
import com.hz.model.HotelFac;
import com.hz.model.HotelInfo;
import com.hz.model.HotelRoomType;
import com.hz.model.HotelService1;
import com.hz.model.HotelStory;
import com.hz.model.HotelType;

public interface HotelInfoMapper {
	
	//酒店类型
	public List<HotelType> getHotelType();
	public Long getHotelTypeTotal();
	public void saveHotelType(@Param("hotelType") HotelType hotelType);
	public HotelType CheckHotelType(@Param("hotelType") HotelType hotelType);
	public HotelType getHotelTypeById(@Param("id") int id);
	public void updateHotelType(@Param("hotelType") HotelType hotelType);
	public void deleteHotelType(@Param("id") int id);
	
	//房间类型
	public List<HotelRoomType> getRoomListById(@Param("id") int id);
	public List<HotelRoomType> getHotelRoomType();
	public Long getHotelRoomTypeTotal();
	public List<HotelRoomType> getHotelRoomType2(@Param("id") int id);
	public Long getHotelRoomTypeTotal2(@Param("id") int id);
	public void saveHotelRoomType(@Param("hotelRoomType") HotelRoomType hotelRoomType);
	public HotelRoomType CheckHotelRoomType(@Param("hotelRoomType") HotelRoomType hotelRoomType);
	public HotelRoomType getHotelRoomTypeById(@Param("id") int id);
	public void updateHotelRoomType(@Param("hotelRoomType") HotelRoomType hotelRoomType);
	public void deleteHotelRoomType(@Param("id") int id);
	public List<HotelRoomType> getHotelRoomPhoto(@Param("id") int id);
	public void updateHotelRoomPhoto(@Param("hotelRoomType") HotelRoomType hotelRoomType);
	public HotelRoomType getHotelRoomById(@Param("id") int id);
	
	//基本信息
	public List<HotelInfo> getHotelInfoListById(@Param("id")int id);
	public List<HotelInfo> getHotelInfo();
	public Long getHotelInfoTotal();
	public List<HotelInfo> getHotelInfo2(@Param("id")int id);
	public Long getHotelInfoTotal2(@Param("id")int id);
	public void saveHotelInfo(@Param("hotelInfo") HotelInfo hotelInfo);
	public HotelInfo getHotelInfoById(@Param("id") int id);
	public void updateHotelInfo(@Param("hotelInfo") HotelInfo hotelInfo);
	public void deleteHotelInfo(@Param("id") int id);
	
	//酒店服务
	public List<HotelService1> getHotelServiceListById(@Param("id")int id);
	public List<HotelService1> getHotelService();
	public Long getHotelServiceTotal();
	public void saveHotelService(@Param("hotelService1") HotelService1 hotelService1);
	public HotelService1 CheckHotelService(@Param("hotelService1") HotelService1 hotelService1);
	public HotelService1 getHotelServiceById(@Param("id") int id);
	public void updateHotelService(@Param("hotelService1") HotelService1 hotelService1);
	public void deleteHotelService(@Param("id") int id);
	public List<HotelService1> getHotelServiceByHid(@Param("hid") int hid);
	public long getHotelServiceByHidTotal(@Param("hid") int hid);
	
	//酒店设施
	public List<HotelFac> getHotelFacListById(@Param("id")int id);
	public List<HotelFac> getHotelFac();
	public Long getHotelFacTotal();
	public void saveHotelFac(@Param("hotelFac") HotelFac hotelFac);
	public HotelFac CheckHotelFac(@Param("hotelFac") HotelFac hotelFac);
	public HotelFac getHotelFacById(@Param("id") int id);
	public void updateHotelFac(@Param("hotelFac") HotelFac hotelFac);
	public void deleteHotelFac(@Param("id") int id);
	public List<HotelFac> getHotelFacByHId(@Param("hid") int hid);
	public Long getHotelFacTotalByHId(@Param("hid") int hid);
	
	
	//房间设施
	public List<HotelRoomInfo> getHotelRoomInfoListById(@Param("id")int id);
	public List<HotelRoomInfo> getHotelRoomInfo();
	public Long getHotelRoomInfoTotal();
	public void saveHotelRoomInfo(@Param("hotelRoomInfo") HotelRoomInfo hotelRoomInfo);
	public HotelRoomInfo CheckHotelRoomInfo(@Param("hotelRoomInfo") HotelRoomInfo hotelRoomInfo);
	public HotelRoomInfo getHotelRoomInfoById(@Param("id") int id);
	public void updateHotelRoomInfo(@Param("hotelRoomInfo") HotelRoomInfo hotelRoomInfo);
	public void deleteHotelRoomInfo(@Param("id") int id);
	public List<HotelRoomInfo> getHotelRoomInfoByHId(@Param("hid") int hid);
	public Long getHotelRoomInfoTotalByHId(@Param("hid") int hid);
	
	//酒店故事
	public List<HotelStory> getHotelStoryListById(@Param("id")int id);
	public List<HotelStory> getHotelStory();
	public Long getHotelStoryTotal();
	public void saveHotelStory(@Param("hotelStory") HotelStory hotelStory);
	public HotelStory getHotelStoryById(@Param("id") int id);
	public List<HotelStory> getHotelStoryById2(@Param("id") int id);
	public Long getHotelStoryTotal2(@Param("id") int id);
	public void updateHotelStory(@Param("hotelStory") HotelStory hotelStory);
	public void deleteHotelStory(@Param("id") int id);
	
	
	
	
	
}

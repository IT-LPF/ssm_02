package com.carnoc.flight.flightInformation.service.impl;

import com.carnoc.flight.flightInformation.dao.FlightRecordDao;
import com.carnoc.flight.flightInformation.pojo.FlightRecord;
import com.carnoc.flight.flightInformation.service.FlightRecordService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 航班动态数据service实现类
 * @Author: lpf
 * @Date 2018/10/26/026  19:22
 **/
@Service("flightRecordService")
public class FlightRecordServiceImpl  implements FlightRecordService{

    @Resource
    private FlightRecordDao flightRecordDao;//航班动态信息dao接口

    /**
     * 获得航班动态信息
     * @param flightRecord
     * @return
     */
    @Override
    public List<FlightRecord> getFlightRecord(FlightRecord flightRecord) {
        return flightRecordDao.getFlightRecord(flightRecord);
    }



}

package com.woime.iboss.alarm.utils;

import java.util.Date;

import com.woime.iboss.alarm.persistence.domain.AlarmConfig;
import com.woime.iboss.alarm.persistence.domain.AlarmInfo;

/**
 * Created by raozhikun on 2017/2/21.
 */
public class AlarmUpGradeUtils {


    public static AlarmInfo upGradeAlarm(AlarmInfo alarmInfo){
        if(alarmInfo.getConfig().getUpgradeRule() == null){
            return alarmInfo;
        }
        int needUpGradeLevel = needUpGrade(alarmInfo);
        if(needUpGradeLevel == 0){
            return alarmInfo;
        }
        int levels = alarmInfo.getLevels();
        switch (alarmInfo.getConfig().getUpgradeType()){
            case 0:
                levels = 1;
                break;
            case 1:
                levels = 2;
                break;
            case 2:
                levels -= needUpGradeLevel;
        }

        alarmInfo.setLevels(levels < 1 ? 1 : levels);
        return alarmInfo;
    }

    private static int needUpGrade(AlarmInfo alarmInfo){
        AlarmConfig alarmConfig = alarmInfo.getConfig();
        if(alarmConfig.getUpgradeRule() == 0){
            //时间
            int timeUnit = 1000;
            switch (alarmConfig.getTimeUnit()){
                case 0:
                    timeUnit = 60*timeUnit;
                case 1:
                    timeUnit = 60*timeUnit;
                case 2:
                    timeUnit = 24*timeUnit;
                case 3:
                    timeUnit = 7*timeUnit;
            }
            long timeDistance = new Date().getTime() - alarmInfo.getFirstTime().getTime();
            return (int) (timeDistance % timeUnit);
        }else{
            // 阀值

        }

        return 0;
    }

}

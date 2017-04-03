package com.woime.iboss.alarm.persistence.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 告警配置
 *
 * @author 王国栋
 */
@Entity
@Table(name = "alarm_config")
public class AlarmConfig implements Serializable {
    private static final long serialVersionUID = 1L;

    private Long id;
    private String path;
    private long neId;
    private String name;
    private AlarmTarget alarmTarget;
    private String threshold;
    private Integer levels;
    private String comments;
    private Integer upgradeRule;
    private String timeRule;
    private Integer timeUnit;
    private Integer thresholdUnit;
    private Integer upgradeType;
    private Date startTime;
    private Date endTime;
    private String frequency;

    private int[] emailRecevierIds;
    private int[] smsRecevierIds;

    private List<AlarmNoticeReciver> emailReceviers;
    private List<AlarmNoticeReciver> smsReceviers;

    /**
     * 返回id
     *
     * @return
     */
    @Id
    @Column(name = "id", unique = true, nullable = false)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column(name = "ne_id")
    public long getNeId() {
        return neId;
    }

    public void setNeId(long neId) {
        this.neId = neId;
    }

    /**
     * 警告配置的名字
     *
     * @return
     */
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    /**
     * 警告指标
     *
     * @return
     */
    @ManyToOne(cascade = {CascadeType.REFRESH}, optional = false)
    @JoinColumn(name = "alarm_target_id")
    public AlarmTarget getAlarmTarget() {
        return alarmTarget;
    }

    public void setAlarmTarget(AlarmTarget alarmTarget) {
        this.alarmTarget = alarmTarget;
    }

    /**
     * 阀值条件
     *
     * @return
     */
    @Column(name = "threshold")
    public String getThreshold() {
        return threshold;
    }

    public void setThreshold(String threshold) {
        this.threshold = threshold;
    }

    /**
     * 告警级别<br>
     * 0-提示 1-次要 2-重要 3-紧急
     *
     * @return
     */
    @Column(name = "levels")
    public Integer getLevels() {
        return levels;
    }

    public void setLevels(Integer levels) {
        this.levels = levels;
    }

    /**
     * 告警描述
     *
     * @return
     */
    @Column(name = "comments")
    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    /**
     * 升级规则<br>
     * 0-经过时间 1-阀值判断
     *
     * @return
     */
    @Column(name = "upgrade_rule")
    public Integer getUpgradeRule() {
        return upgradeRule;
    }

    public void setUpgradeRule(Integer upgradeRule) {
        this.upgradeRule = upgradeRule;
    }

    /**
     * 升级经过时间规则
     *
     * @return
     */
    @Column(name = "time_rule")
    public String getTimeRule() {
        return timeRule;
    }

    public void setTimeRule(String timeRule) {
        this.timeRule = timeRule;
    }

    /**
     * 升级经过时间
     *
     * @return
     */
    @Column(name = "time_unit")
    public Integer getTimeUnit() {
        return timeUnit;
    }

    public void setTimeUnit(Integer timeUnit) {
        this.timeUnit = timeUnit;
    }

    /**
     * 升级阀值单位
     *
     * @return
     */
    @Column(name = "threshold_unit")
    public Integer getThresholdUnit() {
        return thresholdUnit;
    }

    public void setThresholdUnit(Integer thresholdUnit) {
        this.thresholdUnit = thresholdUnit;
    }

    /**
     * 升级类型<br>
     * 0-逐次升级 1-直接到重要 2-直接到紧急
     *
     * @return
     */
    @Column(name = "upgrade_type")
    public Integer getUpgradeType() {
        return upgradeType;
    }

    public void setUpgradeType(Integer upgradeType) {
        this.upgradeType = upgradeType;
    }


    @Transient
    public List<AlarmNoticeReciver> getEmailReceviers() {
        return emailReceviers;
    }

    public void setEmailReceviers(List<AlarmNoticeReciver> emailReceviers) {
        this.emailReceviers = emailReceviers;
    }

    @Transient
    public List<AlarmNoticeReciver> getSmsReceviers() {
        return smsReceviers;
    }

    public void setSmsReceviers(List<AlarmNoticeReciver> smsReceviers) {
        this.smsReceviers = smsReceviers;
    }

    @Transient
    public int[] getEmailRecevierIds() {
        return emailRecevierIds;
    }

    public void setEmailRecevierIds(int[] emailRecevierIds) {
        this.emailRecevierIds = emailRecevierIds;
    }

    @Transient
    public int[] getSmsRecevierIds() {
        return smsRecevierIds;
    }

    public void setSmsRecevierIds(int[] smsRecevierIds) {
        this.smsRecevierIds = smsRecevierIds;
    }

    @Column(name = "ne_path")
    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    @Column(name = "start_time")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    @Column(name = "end_time")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    @Column(name = "frequency")
    public String getFrequency() {
        return frequency;
    }

    public void setFrequency(String frequency) {
        this.frequency = frequency;
    }
}

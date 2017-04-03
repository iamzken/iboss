package com.woime.iboss.alarm.persistence.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 警告信息
 *
 * @author 王国栋
 *
 */
@Entity
@Table(name = "alarm_info")
public class AlarmInfo implements Serializable
{
	private static final long serialVersionUID = 1L;

	private Long id;
	private AlarmConfig config;
	private long neId;
	private int frequency;
	private Date firstTime;
	private Date lastTime;
	private Date confirmTime;
	private Date cleanTime;
	private Integer status;
	private String result;
	private Integer reasonType;
	private String causes;
	private String checkSql;
	private String summary;
	private Integer levels;

	@Id
	@Column(name = "id", unique = true, nullable = false)
	public Long getId()
	{
		return id;
	}

	public void setId(Long id)
	{
		this.id = id;
	}

	/**
	 * 告警信息关联到的告警配置
	 *
	 * @return
	 */
	@ManyToOne(cascade = { CascadeType.REFRESH }, optional = false)
	@JoinColumn(name = "alarm_config_id")
	public AlarmConfig getConfig()
	{
		return config;
	}

	public void setConfig(AlarmConfig config)
	{
		this.config = config;
	}

	@Column(name = "ne_id")
	public long getNeId() {
		return neId;
	}

	public void setNeId(long neId) {
		this.neId = neId;
	}

	/**
	 * 返回当前的告警状态
	 *
	 * @return
	 */
	@Column(name = "status")
	public Integer getStatus()
	{
		return status;
	}

	public void setStatus(Integer status)
	{
		this.status = status;
	}

	public int getFrequency() {
		return frequency;
	}

	public void setFrequency(int frequency) {
		this.frequency = frequency;
	}

	@Column(name = "first_time")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
	public Date getFirstTime() {
		return firstTime;
	}

	public void setFirstTime(Date firstTime) {
		this.firstTime = firstTime;
	}

	@Column(name = "last_time")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
	public Date getLastTime() {
		return lastTime;
	}

	public void setLastTime(Date lastTime) {
		this.lastTime = lastTime;
	}

	@Column(name = "result")
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	@Column(name = "confirm_time")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
	public Date getConfirmTime() {
		return confirmTime;
	}

	public void setConfirmTime(Date confirmTime) {
		this.confirmTime = confirmTime;
	}

	@Column(name = "clean_time")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
	public Date getCleanTime() {
		return cleanTime;
	}

	public void setCleanTime(Date cleanTime) {
		this.cleanTime = cleanTime;
	}

	@Column(name = "causes")
	public String getCauses() {
		return causes;
	}

	public void setCauses(String causes) {
		this.causes = causes;
	}

	@Column(name = "check_sql")
	public String getCheckSql() {
		return checkSql;
	}

	public void setCheckSql(String checkSql) {
		this.checkSql = checkSql;
	}

	@Column(name = "summary")
	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	@Column(name = "reason_type")
	public Integer getReasonType() {
		return reasonType;
	}

	public void setReasonType(Integer reasonType) {
		this.reasonType = reasonType;
	}

	@Column(name = "levels")
	public Integer getLevels() {
		return levels;
	}

	public void setLevels(Integer levels) {
		this.levels = levels;
	}
}

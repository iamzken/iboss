package com.woime.iboss.work.persistence.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author Chen Yujian on 2017/2/26 11:38.
 */
@Entity
@Table(name = "work_order")
public class WorkOrder implements Serializable {
    private Long id;
    private String title;
    private String description;
    private String no;
    private Integer type;
    private Integer priority;
    private Integer sysCode;
    private Integer sourceCode;
    private Integer userType;
    private String userName;
    private Integer userDept;
    private String userTel;
    private String userEmail;
    private Integer status;
    private String currentNode;
    private String currentNodeStatus;
    private String lastOperatorName;
    private Date lastOperatedTime;

    @Id
    @Column(name = "ID")
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column(name = "TITLE")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Column(name = "DESCRIPTION")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Column(name = "NO")
    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    @Column(name = "TYPE")
    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    @Column(name = "PRIORITY")
    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    @Column(name = "SYS_CODE")
    public Integer getSysCode() {
        return sysCode;
    }

    public void setSysCode(Integer sysCode) {
        this.sysCode = sysCode;
    }

    @Column(name = "SOURCE_CODE")
    public Integer getSourceCode() {
        return sourceCode;
    }

    public void setSourceCode(Integer sourceCode) {
        this.sourceCode = sourceCode;
    }

    @Column(name = "USER_TYPE")
    public Integer getUserType() {
        return userType;
    }

    public void setUserType(Integer userType) {
        this.userType = userType;
    }
    @Column(name = "USER_NAME")
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Column(name = "USER_DEPT")
    public Integer getUserDept() {
        return userDept;
    }

    public void setUserDept(Integer userDept) {
        this.userDept = userDept;
    }

    @Column(name = "USER_TEL")
    public String getUserTel() {
        return userTel;
    }

    public void setUserTel(String userTel) {
        this.userTel = userTel;
    }

    @Column(name = "USER_EMAIL")
    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    @Column(name = "status")
    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Column(name = "CURRENT_NODE")
    public String getCurrentNode() {
        return currentNode;
    }

    public void setCurrentNode(String currentNode) {
        this.currentNode = currentNode;
    }

    @Column(name = "CURRENT_NODE_STATUS")
    public String getCurrentNodeStatus() {
        return currentNodeStatus;
    }

    public void setCurrentNodeStatus(String currentNodeStatus) {
        this.currentNodeStatus = currentNodeStatus;
    }

    @Column(name = "LAST_OPERATOR_NAME")
    public String getLastOperatorName() {
        return lastOperatorName;
    }

    public void setLastOperatorName(String lastOperatorName) {
        this.lastOperatorName = lastOperatorName;
    }

    @Column(name = "LAST_OPERATED_TIME")
    public Date getLastOperatedTime() {
        return lastOperatedTime;
    }

    public void setLastOperatedTime(Date lastOperatedTime) {
        this.lastOperatedTime = lastOperatedTime;
    }
}

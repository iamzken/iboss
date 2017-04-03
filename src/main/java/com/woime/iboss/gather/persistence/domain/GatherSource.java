package com.woime.iboss.gather.persistence.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.woime.iboss.gather.service.enums.GatherSourceStatus;

/**
 * @author Chen Yujian on 2017/2/7 16:35.
 */
@Entity
@Table(name = "gather_source")
public class GatherSource implements Serializable {

	private static final long serialVersionUID = 1L;
	private Long id;
    private String name;
    private String ip;
    private int dbType;
    private String dbUser;
    private String dbPassword;
    private String dbPort;
    private String dbSid;
    private GatherSourceStatus status;
    private Integer quantity = 0;

    @Id
    @Column(name = "id")
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "ip")
    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    @Column(name = "db_type")
    public int getDbType() {
        return dbType;
    }

    public void setDbType(int dbType) {
        this.dbType = dbType;
    }

    @Column(name = "db_user")
    public String getDbUser() {
        return dbUser;
    }

    public void setDbUser(String dbUser) {
        this.dbUser = dbUser;
    }

    @Column(name = "db_password")
    public String getDbPassword() {
        return dbPassword;
    }

    public void setDbPassword(String dbPassword) {
        this.dbPassword = dbPassword;
    }

    @Column(name = "db_port")
    public String getDbPort() {
        return dbPort;
    }

    public void setDbPort(String dbPort) {
        this.dbPort = dbPort;
    }

    @Column(name = "db_sid")
    public String getDbSid() {
        return dbSid;
    }

    public void setDbSid(String dbSid) {
        this.dbSid = dbSid;
    }

    @Column(name = "status")
    public GatherSourceStatus getStatus() {
        return status;
    }

    public void setStatus(GatherSourceStatus status) {
        this.status = status;
    }

    @Column(name = "quantity")
    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
}

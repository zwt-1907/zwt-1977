package com.fh.shop.admin.po;


import com.auth0.jwt.internal.com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class Member extends PageUtil implements Serializable {
    private Integer id;

    private String userName;

    private String password;

    private Integer phone;

    private String email;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date  birthday;

    @DateTimeFormat(pattern="yyyy-MM-dd HH mm:ss")
    private Date regTime;

    @DateTimeFormat(pattern="yyyy-MM-dd HH mm:ss")
    private Date lastLoginTime;

    private Integer code;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getPhone() {
        return phone;
    }

    public void setPhone(Integer phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    @JsonFormat(pattern="yyyy-MM-dd hh:mm ss",timezone="GMT+8")
    public Date getRegTime() {
        return regTime;
    }

    public void setRegTime(Date regTime) {
        this.regTime = regTime;
    }

    @JsonFormat(pattern="yyyy-MM-dd hh:mm ss",timezone="GMT+8")
    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    @Override
    public String toString() {
        return "Member{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", phone=" + phone +
                ", email='" + email + '\'' +
                ", birthday=" + birthday +
                ", regTime=" + regTime +
                ", lastLoginTime=" + lastLoginTime +
                '}';
    }
}

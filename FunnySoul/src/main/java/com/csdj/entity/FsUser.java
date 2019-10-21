package com.csdj.entity;


public class FsUser {

  private long id;
  private String userName;
  private String email;
  private String userPassword;
  private long firstLabelId;
  private long secondLabelId;
  private long thirdLabelId;
  private java.sql.Timestamp bornthDate;
  private String phone;
  private String avatarPath;
  private long isFrozen;
  private long freezingTypeId;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }


  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }


  public String getUserPassword() {
    return userPassword;
  }

  public void setUserPassword(String userPassword) {
    this.userPassword = userPassword;
  }


  public long getFirstLabelId() {
    return firstLabelId;
  }

  public void setFirstLabelId(long firstLabelId) {
    this.firstLabelId = firstLabelId;
  }


  public long getSecondLabelId() {
    return secondLabelId;
  }

  public void setSecondLabelId(long secondLabelId) {
    this.secondLabelId = secondLabelId;
  }


  public long getThirdLabelId() {
    return thirdLabelId;
  }

  public void setThirdLabelId(long thirdLabelId) {
    this.thirdLabelId = thirdLabelId;
  }


  public java.sql.Timestamp getBornthDate() {
    return bornthDate;
  }

  public void setBornthDate(java.sql.Timestamp bornthDate) {
    this.bornthDate = bornthDate;
  }


  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }


  public String getAvatarPath() {
    return avatarPath;
  }

  public void setAvatarPath(String avatarPath) {
    this.avatarPath = avatarPath;
  }


  public long getIsFrozen() {
    return isFrozen;
  }

  public void setIsFrozen(long isFrozen) {
    this.isFrozen = isFrozen;
  }


  public long getFreezingTypeId() {
    return freezingTypeId;
  }

  public void setFreezingTypeId(long freezingTypeId) {
    this.freezingTypeId = freezingTypeId;
  }

}

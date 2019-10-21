package com.csdj.entity;


import java.sql.Timestamp;
import java.util.List;

public class FsPost {

  private long id;
  private long posterId;
  private String postTitile;
  private String details;
  private java.sql.Timestamp transmissionTime;
  private long postTypeId;
  private long forwarding;
  private long firstLabel;
  private long secondLabel;
  private long thirdLabel;
  private String picturePath;
  private String videoPath;
  private long heat;
  private long isTopping;
  private long isSelfAccount;
  private FsUser fsUser;
  private Integer pcount;
  private FsPostlist fsPostlist;

  public FsUser getFsUser() {
    return fsUser;
  }

  public void setFsUser(FsUser fsUser) {
    this.fsUser = fsUser;
  }

  public Integer getPcount() {
    return pcount;
  }

  public void setPcount(Integer pcount) {
    this.pcount = pcount;
  }

  public FsPostlist getFsPostlist() {
    return fsPostlist;
  }

  public void setFsPostlist(FsPostlist fsPostlist) {
    this.fsPostlist = fsPostlist;
  }

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public long getPosterId() {
    return posterId;
  }

  public void setPosterId(long posterId) {
    this.posterId = posterId;
  }


  public String getPostTitile() {
    return postTitile;
  }

  public void setPostTitile(String postTitile) {
    this.postTitile = postTitile;
  }


  public String getDetails() {
    return details;
  }

  public void setDetails(String details) {
    this.details = details;
  }


  public java.sql.Timestamp getTransmissionTime() {
    return transmissionTime;
  }

  public void setTransmissionTime(java.sql.Timestamp transmissionTime) {
    this.transmissionTime = transmissionTime;
  }


  public long getPostTypeId() {
    return postTypeId;
  }

  public void setPostTypeId(long postTypeId) {
    this.postTypeId = postTypeId;
  }


  public long getForwarding() {
    return forwarding;
  }

  public void setForwarding(long forwarding) {
    this.forwarding = forwarding;
  }


  public long getFirstLabel() {
    return firstLabel;
  }

  public void setFirstLabel(long firstLabel) {
    this.firstLabel = firstLabel;
  }


  public long getSecondLabel() {
    return secondLabel;
  }

  public void setSecondLabel(long secondLabel) {
    this.secondLabel = secondLabel;
  }


  public long getThirdLabel() {
    return thirdLabel;
  }

  public void setThirdLabel(long thirdLabel) {
    this.thirdLabel = thirdLabel;
  }


  public String getPicturePath() {
    return picturePath;
  }

  public void setPicturePath(String picturePath) {
    this.picturePath = picturePath;
  }


  public String getVideoPath() {
    return videoPath;
  }

  public void setVideoPath(String videoPath) {
    this.videoPath = videoPath;
  }


  public long getHeat() {
    return heat;
  }

  public void setHeat(long heat) {
    this.heat = heat;
  }


  public long getIsTopping() {
    return isTopping;
  }

  public void setIsTopping(long isTopping) {
    this.isTopping = isTopping;
  }


  public long getIsSelfAccount() {
    return isSelfAccount;
  }

  public void setIsSelfAccount(long isSelfAccount) {
    this.isSelfAccount = isSelfAccount;
  }

}

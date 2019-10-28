package com.csdj.entity;

<<<<<<< HEAD
=======
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
>>>>>>> 676bec12309a10b52f690b34505fc619d1ccc2f1

public class FsPost {

  private long id;
  private long posterId;
<<<<<<< HEAD
  private String details;
  private java.sql.Timestamp transmissionTime;
=======
  private String postTitile;
  private String details;
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date transmissionTime;
>>>>>>> 676bec12309a10b52f690b34505fc619d1ccc2f1
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
<<<<<<< HEAD

=======
  private FsUser fsUser;
  private Integer pcount;
  private Integer comment;

  public Integer getComment() {
    return comment;
  }

  public void setComment(Integer comment) {
    this.comment = comment;
  }

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
>>>>>>> 676bec12309a10b52f690b34505fc619d1ccc2f1

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


<<<<<<< HEAD
=======
  public String getPostTitile() {
    return postTitile;
  }

  public void setPostTitile(String postTitile) {
    this.postTitile = postTitile;
  }


>>>>>>> 676bec12309a10b52f690b34505fc619d1ccc2f1
  public String getDetails() {
    return details;
  }

  public void setDetails(String details) {
    this.details = details;
  }


<<<<<<< HEAD
  public java.sql.Timestamp getTransmissionTime() {
    return transmissionTime;
  }

  public void setTransmissionTime(java.sql.Timestamp transmissionTime) {
=======
  public Date getTransmissionTime() {
    return transmissionTime;
  }

  public void setTransmissionTime(Date transmissionTime) {
>>>>>>> 676bec12309a10b52f690b34505fc619d1ccc2f1
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

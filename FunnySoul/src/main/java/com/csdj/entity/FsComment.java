package com.csdj.entity;


import java.util.Date;

public class FsComment {

  private long id;
  private long postId;
  private long praisePeopleId;
  private long respondentId;
  private Date commentTime;
  private String details;
  private FsUser fsUser;
  private FsPost fsPost;

  public FsUser getFsUser() {
    return fsUser;
  }

  public void setFsUser(FsUser fsUser) {
    this.fsUser = fsUser;
  }

  public FsPost getFsPost() {
    return fsPost;
  }

  public void setFsPost(FsPost fsPost) {
    this.fsPost = fsPost;
  }

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public long getPostId() {
    return postId;
  }

  public void setPostId(long postId) {
    this.postId = postId;
  }


  public long getPraisePeopleId() {
    return praisePeopleId;
  }

  public void setPraisePeopleId(long praisePeopleId) {
    this.praisePeopleId = praisePeopleId;
  }


  public long getRespondentId() {
    return respondentId;
  }

  public void setRespondentId(long respondentId) {
    this.respondentId = respondentId;
  }


  public Date getCommentTime() {
    return commentTime;
  }

  public void setCommentTime(Date commentTime) {
    this.commentTime = commentTime;
  }


  public String getDetails() {
    return details;
  }

  public void setDetails(String details) {
    this.details = details;
  }

}

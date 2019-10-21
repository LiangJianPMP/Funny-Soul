package com.csdj.entity;


public class FsComment {

  private long id;
  private long postId;
  private long praisePeopleId;
  private long respondentId;
  private java.sql.Timestamp commentTime;
  private String details;


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


  public java.sql.Timestamp getCommentTime() {
    return commentTime;
  }

  public void setCommentTime(java.sql.Timestamp commentTime) {
    this.commentTime = commentTime;
  }


  public String getDetails() {
    return details;
  }

  public void setDetails(String details) {
    this.details = details;
  }

}

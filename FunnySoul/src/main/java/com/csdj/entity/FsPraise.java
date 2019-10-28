package com.csdj.entity;


public class FsPraise {

  private long id;
  private long praisePeopleId;
  private long postId;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public long getPraisePeopleId() {
    return praisePeopleId;
  }

  public void setPraisePeopleId(long praisePeopleId) {
    this.praisePeopleId = praisePeopleId;
  }


  public long getPostId() {
    return postId;
  }

  public void setPostId(long postId) {
    this.postId = postId;
  }

}

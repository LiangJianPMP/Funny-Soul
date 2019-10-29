package com.csdj.entity;


<<<<<<< HEAD
=======
import java.util.Date;

>>>>>>> 676bec12309a10b52f690b34505fc619d1ccc2f1
public class FsComment {

  private long id;
  private long postId;
  private long praisePeopleId;
  private long respondentId;
<<<<<<< HEAD
  private java.sql.Timestamp commentTime;
  private String details;

=======
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
>>>>>>> 676bec12309a10b52f690b34505fc619d1ccc2f1

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


<<<<<<< HEAD
  public java.sql.Timestamp getCommentTime() {
    return commentTime;
  }

  public void setCommentTime(java.sql.Timestamp commentTime) {
=======
  public Date getCommentTime() {
    return commentTime;
  }

  public void setCommentTime(Date commentTime) {
>>>>>>> 676bec12309a10b52f690b34505fc619d1ccc2f1
    this.commentTime = commentTime;
  }


  public String getDetails() {
    return details;
  }

  public void setDetails(String details) {
    this.details = details;
  }

}

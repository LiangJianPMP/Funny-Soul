package com.csdj.entity;


public class FsFeedback {

  private long id;
  private long userId;
  private java.sql.Timestamp feedbackTime;
  private String feedbackProblem;
  private String details;
  private long isSolve;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public java.sql.Timestamp getFeedbackTime() {
    return feedbackTime;
  }

  public void setFeedbackTime(java.sql.Timestamp feedbackTime) {
    this.feedbackTime = feedbackTime;
  }


  public String getFeedbackProblem() {
    return feedbackProblem;
  }

  public void setFeedbackProblem(String feedbackProblem) {
    this.feedbackProblem = feedbackProblem;
  }


  public String getDetails() {
    return details;
  }

  public void setDetails(String details) {
    this.details = details;
  }


  public long getIsSolve() {
    return isSolve;
  }

  public void setIsSolve(long isSolve) {
    this.isSolve = isSolve;
  }

}

package com.csdj.entity;


public class FsPageviews {

  private long id;
  private long count;
  private java.sql.Timestamp recordingMachine;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public long getCount() {
    return count;
  }

  public void setCount(long count) {
    this.count = count;
  }


  public java.sql.Timestamp getRecordingMachine() {
    return recordingMachine;
  }

  public void setRecordingMachine(java.sql.Timestamp recordingMachine) {
    this.recordingMachine = recordingMachine;
  }

}

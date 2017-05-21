package kdb.foodtruck.dto;

import java.sql.Timestamp;

public class Message {
	private	int			msgnum;
	private int			msgsender;
	private	int			msgreceiver;
	private	String		msgtitle;
	private	String		msgcontent;
	private	Timestamp	msgdate;
	private	String		msgsendername;
	private	String		msgreceivername;
	private String		msgsenderemail;
	private	String		msgreceiveremail;
	
	public String getMsgsenderemail() {
		return msgsenderemail;
	}
	public void setMsgsendermail(String msgsenderemail) {
		this.msgsenderemail = msgsenderemail;
	}
	public String getMsgreceiveremail() {
		return msgreceiveremail;
	}
	public void setMsgreceiveremail(String msgreceiveremail) {
		this.msgreceiveremail = msgreceiveremail;
	}
	public String getMsgsendername() {
		return msgsendername;
	}
	public void setMsgsendername(String msgsendername) {
		this.msgsendername = msgsendername;
	}
	public String getMsgreceivername() {
		return msgreceivername;
	}
	public void setMsgreceivername(String msgreceivername) {
		this.msgreceivername = msgreceivername;
	}
	public int getMsgnum() {
		return msgnum;
	}
	public void setMsgnum(int msgnum) {
		this.msgnum = msgnum;
	}
	public int getMsgsender() {
		return msgsender;
	}
	public void setMsgsender(int msgsender) {
		this.msgsender = msgsender;
	}
	public int getMsgreceiver() {
		return msgreceiver;
	}
	public void setMsgreceiver(int msgreceiver) {
		this.msgreceiver = msgreceiver;
	}
	public String getMsgtitle() {
		return msgtitle;
	}
	public void setMsgtitle(String msgtitle) {
		this.msgtitle = msgtitle;
	}
	public String getMsgcontent() {
		return msgcontent;
	}
	public void setMsgcontent(String msgcontent) {
		this.msgcontent = msgcontent;
	}
	public Timestamp getMsgdate() {
		return msgdate;
	}
	public void setMsgdate(Timestamp msgdate) {
		this.msgdate = msgdate;
	}
	
	
}

package com.sist.spring.cmn;

public class MessageVO extends DTO {

	/**
	 * 메시지 ID
	 */
	private String msgId;
	
	/**
	 * 메시지
	 */
	private String msgMsg;
	
	public MessageVO() {}

	/**
	 * @return the msgId
	 */
	public String getMsgId() {
		return msgId;
	}

	/**
	 * @param msgId the msgId to set
	 */
	public void setMsgId(String msgId) {
		this.msgId = msgId;
	}

	/**
	 * @return the msgMsg
	 */
	public String getMsgMsg() {
		return msgMsg;
	}

	/**
	 * @param msgMsg the msgMsg to set
	 */
	public void setMsgMsg(String msgMsg) {
		this.msgMsg = msgMsg;
	}

	@Override
	public String toString() {
		return "MessageVO [msgId=" + msgId + ", msgMsg=" + msgMsg + "]";
	}
	
	
	
}

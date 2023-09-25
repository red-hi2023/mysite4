package com.javaex.vo;

public class JsonResultVo {

	//성공했을때
	//success, List<GuestbookVo> , null
	// fail, null ,  "통신오류"
	//필드
	private String result;  //'success'  'fail'   success
	private Object data;    //성공했을때 data        
	private String failMsg;  //실패했을때 참고할수 있는 메세지 코드값
	
	//생성자
	public JsonResultVo() {
		super();
	}
	
	public JsonResultVo(String result, Object data, String failMsg) {
		super();
		this.result = result;
		this.data = data;
		this.failMsg = failMsg;
	}
	
	//메소드 gs
	public String getResult() {
		return result;
	}

	public Object getData() {
		return data;
	}

	public String getFailMsg() {
		return failMsg;
	}
	
	
	//메소드 일반
	//성공했을때
	public void success(Object data) {
		this.result = "success";
		this.data = data;
	}
	
	
	public void fail(String failMsg) {
		this.result = "fail";
		this.failMsg = failMsg;
	}

	@Override
	public String toString() {
		return "JsonResultVo [result=" + result + ", data=" + data + ", failMsg=" + failMsg + "]";
	}
	
}

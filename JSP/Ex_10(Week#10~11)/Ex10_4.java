package ex10;

import java.util.Hashtable;

public class Ex10_4 {
	private Hashtable<String, String> header = new Hashtable<String, String>();
	private int count;
	
	public Ex10_4() {
		header = null;
		count = 0;
	}
	
	public Hashtable<String, String> getHeader(){
		return header;
	}
	
	public void setHeader(Hashtable<String, String> header){
		this.header = header;
	}
	
	public int getCount() {
		return count;
	}
	
	public void setCount(int count) {
		this.count = count;
	}
}

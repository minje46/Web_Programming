package ex12;

import java.util.Hashtable;

public class Header {
	private Hashtable<String, String> headerTable = new Hashtable<String, String>();
	
	public Header(){
		headerTable = null;
	}
	public Hashtable<String, String> getHeaderTable() {
		return headerTable;
	}

	public void setHeaderTable(Hashtable<String, String> headerTable) {
		this.headerTable = headerTable;
	}
}

package ex12;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTag;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class Random_Int extends SimpleTagSupport implements SimpleTag{
	private int limit = 1;
	
	@Override
	public void doTag() throws JspException, IOException{
		JspWriter out = getJspContext().getOut();
		
		// Coding.
		out.print((int)(Math.random()*limit));
	}
	
	public void setLimit(String limit) {
		try {
			this.limit = Integer.parseInt(limit);
		} catch(NumberFormatException e){
			e.printStackTrace();
		}
	}
}

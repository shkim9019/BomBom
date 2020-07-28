package com.sist.spring.cmn;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * 모든 메소드는 static method
 * @author SIST
 *
 */
public class StringUtil {
	private static final Logger LOG = LoggerFactory.getLogger(StringUtil.class);
	
	/**
	 * 
	 *@Method Name:getUUID
	 *@작성일: 2020. 3. 11.
	 *@작성자: SIST
	 *@설명:
	 *@return
	 */
	public static String getUUID() {
		UUID uuid = UUID.randomUUID();
		String retUUID = uuid.toString().replace("-", "").substring(0, 5);
		LOG.debug("retUUID:"+retUUID);
		return retUUID;
	}
	
	/**
	 * 
	 *@Method Name:getDate
	 *@작성일: 2020. 3. 11.
	 *@작성자: SIST
	 *@설명: 
	 *@param format
	 *@return format string date
	 */
	public static String getDate(String format) {
		SimpleDateFormat formatter = new SimpleDateFormat(format);
		
		return formatter.format(new Date());
	}
	
	
	
	 /**
	   * Paging처리 
	   * @param maxNum_i
	   * @param currPageNoIn_i
	   * @param rowsPerPage_i
	   * @param bottomCount_i
	   * @param url_i
	   * @param scriptName_i
	   * @return
	   */
	  public static String renderPaging(int maxNum_i, int currPageNoIn_i, int rowsPerPage_i, int bottomCount_i,
	    String url_i, String scriptName_i) {
	   int maxNum = 0; // 총 갯수
	   int currPageNo = 1; // 현재 페이지 번호 : page_num
	   int rowPerPage = 10; // 한페이지에 보여질 행수 : page_size
	   int bottomCount = 10; // 바닥에 보여질 페이지 수: 10

	   /**
	    * 총글수: 21
	    * 현재페이지: 1
	    * 한페이지에 보여질 행수: 10
	    * 바닥에 보여질 페이지 수: 10
	    * << < 1 2 3 4 5 6 7 8 9 10 > >>
	    */
	   
	   maxNum = maxNum_i;
	   currPageNo = currPageNoIn_i;
	   rowPerPage = rowsPerPage_i;
	   bottomCount = bottomCount_i;

	   String url = url_i; // 호출 URL
	   String scriptName = scriptName_i; // 호출 자바스크립트

	   int maxPageNo = ((maxNum - 1) / rowPerPage) + 1;
	   int startPageNo = ((currPageNo - 1) / bottomCount) * bottomCount + 1;//
	   int endPageNo = ((currPageNo - 1) / bottomCount + 1) * bottomCount;
	   
	   int nowBlockNo = ((currPageNo - 1) / bottomCount) + 1;
	   int maxBlockNo = ((maxNum - 1) / bottomCount) + 1;

	   int inx = 0;
	   StringBuilder html = new StringBuilder();
	   if (currPageNo > maxPageNo) {
	    return "";
	   }

	   html.append("<table border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">   \n");
	   html.append("<tr>                       \n");
	   html.append("<td align=\"center\">                                                                    \n");
	   //html.append("<ul class=\"pagination pagination-sm\">                                                  \n");
	   // <<
	   if (nowBlockNo > 1 && nowBlockNo <= maxBlockNo) {
	    html.append("<a href=\"javascript:" + scriptName + "( '" + url+ "', 1 );\">  \n");
	    html.append("&laquo;   \n");
	    html.append("</a>      \n");
	   }

	   // <
	   if (startPageNo > bottomCount) {
	    html.append("<a href=\"javascript:" + scriptName + "( '" + url + "'," + (startPageNo - 1)+ ");\"> \n");
	    html.append("<        \n");
	    html.append("</a>     \n");
	   }


	   // 1 2 3 ... 10 (숫자보여주기)
	   for (inx = startPageNo; inx <= maxPageNo && inx <= endPageNo; inx++) {
	    
	    if (inx == currPageNo) {
	     html.append("<b>" + inx + "</b> &nbsp;&nbsp; \n");
	    } else {
	     html.append("<a href=\"javascript:" + scriptName + "('" + url + "'," + inx+ ");\" >" + inx + "</a> &nbsp;&nbsp; \n");
	    }
	   }
	   
	   // >
	   if (maxPageNo >= inx) {
	    html.append("<a href=\"javascript:" + scriptName + "('" + url + "',"+ ((nowBlockNo * bottomCount) + 1) + ");\"> \n");
	    html.append(">                       \n");
	    html.append("</a>              \n");
	   }

	   // >>
	   if (maxPageNo >= inx) {
	    html.append("<a href=\"javascript:" + scriptName + "('" + url + "'," + maxPageNo+ ");\">      \n");
	    html.append("&raquo;     \n");
	    html.append("</a>    \n");
	   }

	   html.append("</td>   \n");
	   html.append("</tr>   \n");
	   html.append("</table>   \n");

	   return html.toString();
	  }
	
	
	/**
	 * 
	 *@Method Name:nvl
	 *@작성일: 2020. 2. 24.
	 *@작성자: SIST
	 *@설명: null -> ""
	 *@param val String
	 *@return String
	 */
	public static String nvl(String val) {
		return nvl(val,"");
		
	}
	/**
	 * 
	 *@Method Name:nvl
	 *@작성일: 2020. 2. 24.
	 *@작성자: SIST
	 *@설명: request param null to ""
	 *@param val 원본 String
	 *@param rep 치환 String
	 *@return String
	 */
	public static String nvl(String val, String rep) {
		if(null == val || "".equals(val)) {
			val = rep;
		}
		
		return val;
		
	}
}

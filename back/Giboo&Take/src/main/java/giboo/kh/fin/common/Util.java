package giboo.kh.fin.common;

import java.text.SimpleDateFormat;

public class Util {
	   // ?��?���? �?�? 메소?��
	   public static String fileRename(String originFileName) {
	      SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	      String date = sdf.format(new java.util.Date(System.currentTimeMillis()));

	      int ranNum = (int) (Math.random() * 100000); // 5?���? ?��?�� ?��?�� ?��?��

	      String str = "_" + String.format("%05d", ranNum);

	      String ext = originFileName.substring(originFileName.lastIndexOf("."));

	      return date + str + ext;
	   }
	   
	   // ?��로스 ?��?��?�� ?��?��립트 공격?�� 방�? ?���? ?��?�� 메소?��
	   public static String XSSHandling(String content) {
	      if(content != null) {
	         content = content.replaceAll("&", "&amp;");
	         content = content.replaceAll("<", "&lt;");
	         content = content.replaceAll(">", "&gt;");
	         content = content.replaceAll("\"", "&quot;");
	      }
	      return content;
	   }

	   
	   // ?��로스 ?��?��?�� ?��?��립트 ?��?��
	   public static String XSSClear(String content) {
	      if(content != null) {
	         content = content.replaceAll("&amp;", "&");
	         content = content.replaceAll("&lt;", "<" );
	         content = content.replaceAll("&gt;", ">");
	         content = content.replaceAll("&quot;", "\"");
	      }
	      return content;
	   }
	   
	   
	   // 개행문자 처리 
	   public static String newLineHandling(String content) {
	      return content.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
	   }
	   
	   // 개행문자 ?��?��
	   public static String newLineClear(String content) {
	      return content.replaceAll("<br>", "\n");
	   }
	   
	   
	   
	   
}

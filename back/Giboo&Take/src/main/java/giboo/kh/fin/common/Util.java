package giboo.kh.fin.common;

import java.text.SimpleDateFormat;

public class Util {
	   // ?ŒŒ?¼ëª? ë³?ê²? ë©”ì†Œ?“œ
	   public static String fileRename(String originFileName) {
	      SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	      String date = sdf.format(new java.util.Date(System.currentTimeMillis()));

	      int ranNum = (int) (Math.random() * 100000); // 5?ë¦? ?œ?¤ ?ˆ«? ?ƒ?„±

	      String str = "_" + String.format("%05d", ranNum);

	      String ext = originFileName.substring(originFileName.lastIndexOf("."));

	      return date + str + ext;
	   }
	   
	   // ?¬ë¡œìŠ¤ ?‚¬?´?Š¸ ?Š¤?Š¸ë¦½íŠ¸ ê³µê²©?„ ë°©ì? ?•˜ê¸? ?œ„?•œ ë©”ì†Œ?“œ
	   public static String XSSHandling(String content) {
	      if(content != null) {
	         content = content.replaceAll("&", "&amp;");
	         content = content.replaceAll("<", "&lt;");
	         content = content.replaceAll(">", "&gt;");
	         content = content.replaceAll("\"", "&quot;");
	      }
	      return content;
	   }

	   
	   // ?¬ë¡œìŠ¤ ?‚¬?´?Š¸ ?Š¤?Š¸ë¦½íŠ¸ ?•´? œ
	   public static String XSSClear(String content) {
	      if(content != null) {
	         content = content.replaceAll("&amp;", "&");
	         content = content.replaceAll("&lt;", "<" );
	         content = content.replaceAll("&gt;", ">");
	         content = content.replaceAll("&quot;", "\"");
	      }
	      return content;
	   }
	   
	   
	   // ê°œí–‰ë¬¸ì ì²˜ë¦¬ 
	   public static String newLineHandling(String content) {
	      return content.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
	   }
	   
	   // ê°œí–‰ë¬¸ì ?•´? œ
	   public static String newLineClear(String content) {
	      return content.replaceAll("<br>", "\n");
	   }
	   
	   
	   
	   
}

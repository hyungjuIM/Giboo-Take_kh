package giboo.kh.fin.common.scheduling;
//package com.kh.fin.common.scheduling;
//
//import java.io.File;
//import java.util.Arrays;
//import java.util.List;
//
//import javax.servlet.ServletContext;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.scheduling.annotation.Scheduled;
//import org.springframework.stereotype.Component;
//
//import edu.kh.comm.board.model.service.BoardService;
//
//@Component // bean ?“±ë¡?
//public class ImageDeleteScheduling {
//
//	private Logger logger = LoggerFactory.getLogger(ImageDeleteScheduling.class);
//
//	// BOARD_IMG ?…Œ?´ë¸”ì—?„œ?Š” ?‚­? œ?˜?—ˆ?œ¼?‚˜
//	// ?„œë²?/resources/images/board ?´?”?—?Š” ì¡´ì¬?•˜?Š”
//	// ?´ë¯¸ì? ?ŒŒ?¼?„ ? •?‹œë§ˆë‹¤ ?‚­? œ
//
//
//	// ì½”ë”© ?ˆœ?„œ
//	// 1) BOARD_IMG?— ì¡´ì¬?•˜?Š” ëª¨ë“  ?´ë¯¸ì? ëª©ë¡ ì¡°íšŒ
//	// 2) /resources/images/board ?´?”?— ì¡´ì¬?•˜?Š” ëª¨ë“  ?´ë¯¸ì? ?ŒŒ?¼ ëª©ë¡ ì¡°íšŒ
//	// 3) ?‘ ëª©ë¡?„ ë¹„êµ?•´?„œ ?¼ì¹˜í•˜ì§? ?•Š?Š” ?´ë¯¸ì? ?ŒŒ?¼?„ ?‚­? œ (DB?—?Š” ?—†?Š”?° ?„œë²„í´?”?— ?ˆ?œ¼ë©? ?‚­? œ)
//
//	@Autowired
//	private BoardService service;
//
//	@Autowired
//	private ServletContext application; // application scope ê°ì²´ -> ?„œë²? ?´?” ê²½ë¡œ ?–»?–´?˜¤ê¸°ì— ?‚¬?š©
//
//	@Scheduled(cron="0 0 * * * *") // ? •?‹œë§ˆë‹¤
//	//@Scheduled(cron ="0 * * * * *")
//	public void serverImageDelete() {
//		// 1) BOARD_IMG?— ì¡´ì¬?•˜?Š” ëª¨ë“  ?´ë¯¸ì? ëª©ë¡ ì¡°íšŒ
//		List<String> dbList = service.selectDBList();
//
//
//		// 2) /resources/images/board ?´?”?— ì¡´ì¬?•˜?Š” ëª¨ë“  ?´ë¯¸ì? ?ŒŒ?¼ ëª©ë¡ ì¡°íšŒ
//		String folderPath = application.getRealPath("/resources/images/board");
//
//		File path = new File(folderPath); // /resources/images/board ?´?”ë¥? ì°¸ì¡°?•˜?Š” ê°ì²´
//
//		File[] arr = path.listFiles(); // pathê°? ì°¸ì¡°?•˜?Š” ?´?”?— ?ˆ?Š” ëª¨ë“  ?ŒŒ?¼?„ ?–»?–´?? File ë°°ì—´ ë°˜í™˜
//
//		List<File> serverList = Arrays.asList(arr); // arr?„ Listë¡? ë³??™˜
//
//		// 3) ?‘ ëª©ë¡?„ ë¹„êµ?•´?„œ ?¼ì¹˜í•˜ì§? ?•Š?Š” ?´ë¯¸ì? ?ŒŒ?¼?„ ?‚­? œ (DB?—?Š” ?—†?Š”?° ?„œë²„í´?”?— ?ˆ?œ¼ë©? ?‚­? œ)
//		if( !serverList.isEmpty() ) { // ?„œë²„ì— ?´ë¯¸ì? ?ŒŒ?¼?´ ?ˆ?„?•Œ ë¹„êµ/?‚­? œ ì§„í–‰
//
//			// server: \resources\images\board\sample1.png
//			// 	DB : /resources/images/board/sample1.png
//
//			for( File serverImage : serverList ) {
//
//				String name = "/resources/images/board/" + serverImage.getName(); // ?ŒŒ?¼ëª…ë§Œ ?–»?–´?˜¤ê¸?
//
//
//				if( dbList.indexOf(name) == -1 ) {
//
//					// dbList?—?Š” ?—†?Š”?° serverList?—ë§? ?ŒŒ?¼?´ ì¡´ì¬?•˜?Š” ê²½ìš°
//					logger.info(serverImage.getName() + " ?‚­? œ");
//					serverImage.delete(); // ?ŒŒ?¼?‚­? œ
//
//				}
//
//			}
//
//			logger.info("----------- ?„œë²? ?´ë¯¸ì? ?‚­? œ ?™„ë£? --------------");
//
//		}
//
//	}
//
//}

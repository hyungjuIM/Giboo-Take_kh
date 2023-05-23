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
//@Component // bean ?±λ‘?
//public class ImageDeleteScheduling {
//
//	private Logger logger = LoggerFactory.getLogger(ImageDeleteScheduling.class);
//
//	// BOARD_IMG ??΄λΈμ?? ?­? ???Ό?
//	// ?λ²?/resources/images/board ?΄??? μ‘΄μ¬??
//	// ?΄λ―Έμ? ??Ό? ? ?λ§λ€ ?­? 
//
//
//	// μ½λ© ??
//	// 1) BOARD_IMG? μ‘΄μ¬?? λͺ¨λ  ?΄λ―Έμ? λͺ©λ‘ μ‘°ν
//	// 2) /resources/images/board ?΄?? μ‘΄μ¬?? λͺ¨λ  ?΄λ―Έμ? ??Ό λͺ©λ‘ μ‘°ν
//	// 3) ? λͺ©λ‘? λΉκ΅?΄? ?ΌμΉνμ§? ?? ?΄λ―Έμ? ??Ό? ?­?  (DB?? ???° ?λ²ν΄?? ??Όλ©? ?­? )
//
//	@Autowired
//	private BoardService service;
//
//	@Autowired
//	private ServletContext application; // application scope κ°μ²΄ -> ?λ²? ?΄? κ²½λ‘ ?»?΄?€κΈ°μ ?¬?©
//
//	@Scheduled(cron="0 0 * * * *") // ? ?λ§λ€
//	//@Scheduled(cron ="0 * * * * *")
//	public void serverImageDelete() {
//		// 1) BOARD_IMG? μ‘΄μ¬?? λͺ¨λ  ?΄λ―Έμ? λͺ©λ‘ μ‘°ν
//		List<String> dbList = service.selectDBList();
//
//
//		// 2) /resources/images/board ?΄?? μ‘΄μ¬?? λͺ¨λ  ?΄λ―Έμ? ??Ό λͺ©λ‘ μ‘°ν
//		String folderPath = application.getRealPath("/resources/images/board");
//
//		File path = new File(folderPath); // /resources/images/board ?΄?λ₯? μ°Έμ‘°?? κ°μ²΄
//
//		File[] arr = path.listFiles(); // pathκ°? μ°Έμ‘°?? ?΄?? ?? λͺ¨λ  ??Ό? ?»?΄?? File λ°°μ΄ λ°ν
//
//		List<File> serverList = Arrays.asList(arr); // arr? Listλ‘? λ³??
//
//		// 3) ? λͺ©λ‘? λΉκ΅?΄? ?ΌμΉνμ§? ?? ?΄λ―Έμ? ??Ό? ?­?  (DB?? ???° ?λ²ν΄?? ??Όλ©? ?­? )
//		if( !serverList.isEmpty() ) { // ?λ²μ ?΄λ―Έμ? ??Ό?΄ ??? λΉκ΅/?­?  μ§ν
//
//			// server: \resources\images\board\sample1.png
//			// 	DB : /resources/images/board/sample1.png
//
//			for( File serverImage : serverList ) {
//
//				String name = "/resources/images/board/" + serverImage.getName(); // ??Όλͺλ§ ?»?΄?€κΈ?
//
//
//				if( dbList.indexOf(name) == -1 ) {
//
//					// dbList?? ???° serverList?λ§? ??Ό?΄ μ‘΄μ¬?? κ²½μ°
//					logger.info(serverImage.getName() + " ?­? ");
//					serverImage.delete(); // ??Ό?­? 
//
//				}
//
//			}
//
//			logger.info("----------- ?λ²? ?΄λ―Έμ? ?­?  ?λ£? --------------");
//
//		}
//
//	}
//
//}

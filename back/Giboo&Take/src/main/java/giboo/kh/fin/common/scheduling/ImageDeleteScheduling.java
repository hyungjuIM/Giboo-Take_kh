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
//@Component // bean ?���?
//public class ImageDeleteScheduling {
//
//	private Logger logger = LoggerFactory.getLogger(ImageDeleteScheduling.class);
//
//	// BOARD_IMG ?��?��블에?��?�� ?��?��?��?��?��?��
//	// ?���?/resources/images/board ?��?��?��?�� 존재?��?��
//	// ?��미�? ?��?��?�� ?��?��마다 ?��?��
//
//
//	// 코딩 ?��?��
//	// 1) BOARD_IMG?�� 존재?��?�� 모든 ?��미�? 목록 조회
//	// 2) /resources/images/board ?��?��?�� 존재?��?�� 모든 ?��미�? ?��?�� 목록 조회
//	// 3) ?�� 목록?�� 비교?��?�� ?��치하�? ?��?�� ?��미�? ?��?��?�� ?��?�� (DB?��?�� ?��?��?�� ?��버폴?��?�� ?��?���? ?��?��)
//
//	@Autowired
//	private BoardService service;
//
//	@Autowired
//	private ServletContext application; // application scope 객체 -> ?���? ?��?�� 경로 ?��?��?��기에 ?��?��
//
//	@Scheduled(cron="0 0 * * * *") // ?��?��마다
//	//@Scheduled(cron ="0 * * * * *")
//	public void serverImageDelete() {
//		// 1) BOARD_IMG?�� 존재?��?�� 모든 ?��미�? 목록 조회
//		List<String> dbList = service.selectDBList();
//
//
//		// 2) /resources/images/board ?��?��?�� 존재?��?�� 모든 ?��미�? ?��?�� 목록 조회
//		String folderPath = application.getRealPath("/resources/images/board");
//
//		File path = new File(folderPath); // /resources/images/board ?��?���? 참조?��?�� 객체
//
//		File[] arr = path.listFiles(); // path�? 참조?��?�� ?��?��?�� ?��?�� 모든 ?��?��?�� ?��?��?? File 배열 반환
//
//		List<File> serverList = Arrays.asList(arr); // arr?�� List�? �??��
//
//		// 3) ?�� 목록?�� 비교?��?�� ?��치하�? ?��?�� ?��미�? ?��?��?�� ?��?�� (DB?��?�� ?��?��?�� ?��버폴?��?�� ?��?���? ?��?��)
//		if( !serverList.isEmpty() ) { // ?��버에 ?��미�? ?��?��?�� ?��?��?�� 비교/?��?�� 진행
//
//			// server: \resources\images\board\sample1.png
//			// 	DB : /resources/images/board/sample1.png
//
//			for( File serverImage : serverList ) {
//
//				String name = "/resources/images/board/" + serverImage.getName(); // ?��?��명만 ?��?��?���?
//
//
//				if( dbList.indexOf(name) == -1 ) {
//
//					// dbList?��?�� ?��?��?�� serverList?���? ?��?��?�� 존재?��?�� 경우
//					logger.info(serverImage.getName() + " ?��?��");
//					serverImage.delete(); // ?��?��?��?��
//
//				}
//
//			}
//
//			logger.info("----------- ?���? ?��미�? ?��?�� ?���? --------------");
//
//		}
//
//	}
//
//}

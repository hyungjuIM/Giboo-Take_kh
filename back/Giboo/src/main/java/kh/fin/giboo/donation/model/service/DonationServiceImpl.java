package kh.fin.giboo.donation.model.service;

import kh.fin.giboo.admin.model.vo.ParentCategory;
import kh.fin.giboo.event.Util;
import kh.fin.giboo.common.model.vo.Pagination;
import kh.fin.giboo.donation.model.dao.DonationDAO;
import kh.fin.giboo.donation.model.vo.Donation;
import kh.fin.giboo.donation.model.vo.DonationDetail;
import kh.fin.giboo.donation.model.vo.DonationStory;
import kh.fin.giboo.event.model.exception.InsertFailException;
import kh.fin.giboo.mypage.model.vo.Favorite;
import kh.fin.giboo.volunteer.model.vo.Reply;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DonationServiceImpl implements DonationService {

    private Logger logger = LoggerFactory.getLogger(DonationServiceImpl.class);


    @Autowired
    private DonationDAO dao;

    @Override
    public Map<String, Object> selectDonationList(int category, int cp, Model model) {
        List<ParentCategory> parentCategoryList = dao.getParentCategoryList();
        boolean categoryValidate = false;
        int listCount = 0;

        for (ParentCategory pc : parentCategoryList) {
            if (pc.getParentCategoryNo() == category) {
                categoryValidate = true;
            }
        }

        if (categoryValidate) {
            listCount = dao.getListCount(category);
        } else {
            listCount = dao.getListCount();
        }

        Pagination pagination = new Pagination(cp, listCount);
        pagination.setLimit(6);

        List<Donation> donationList =  null;
        int donationListCount = 0;
        if (categoryValidate) {
            donationList = dao.getDonationList(pagination, model);
            donationListCount = dao.getDonationListCount(category);
        } else {
            donationList = dao.getDonationListAll(pagination, model);
            donationListCount = dao.getDonationListCount();
        }

        for (Donation d : donationList) {
            LocalDate currentDate = LocalDate.now();
            LocalDate dDay = LocalDate.of(d.getEndRecruitDate().getYear() + 1900, d.getEndRecruitDate().getMonth() + 1, d.getEndRecruitDate().getDate());
            long untilDay = ChronoUnit.DAYS.between(currentDate, dDay);
            d.setDDay(untilDay);

            int percent = (Integer.parseInt(d.getDonationAmount()) * 100) / Integer.parseInt(d.getTargetAmount());
            d.setPercent(percent);

            DecimalFormat df = new DecimalFormat("###,###");
            d.setDonationAmount(df.format(Integer.parseInt(d.getDonationAmount())));
            d.setTargetAmount(df.format(Integer.parseInt(d.getTargetAmount())));
        }

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("pagination", pagination);
        map.put("parentCategoryList", parentCategoryList);
        map.put("donationList", donationList);
        map.put("donationListCount", donationListCount);

        return map;
    }

    @Override
    public DonationDetail getDonationDetail(int donationNo) {
        return dao.getDonationDetail(donationNo);
    }

    @Override
    public int sync(Map<String, Object> map) {
        return dao.sync(map);
    }

    @Override
    public Map<String, Object> getStoryList(int cp, Model model) {
        int listCount = dao.getStoryListCount();
        Pagination pagination = new Pagination(cp, listCount);

        List<DonationStory> storyList = dao.getStoryList(pagination, model);

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("pagination", pagination);
        map.put("storyList", storyList);

        return map;
    }

    @Override
    public DonationStory selectDonationStory(int donationStoryNo) {
        return dao.selectDonationStory(donationStoryNo);
    }

    @Override
    public int updateViewCount(int donationStoryNo) {
        return dao.updateViewCount(donationStoryNo);
    }

    @Override
    public int updateAmount(Map<String, Object> map) {
        return dao.updateAmount(map);
    }

	  @Override
	  public List<Favorite> getFavoriteList(int memberNo) {
		
		  return dao.getFavoriteList(memberNo);
	  }
    
//	@Transactional(rollbackFor = { Exception.class })
//    @Override
//	public int insertDonation(DonationDetail detail, String webPath, String folderPath, MultipartFile uploadImage) throws IOException {
//    	 detail.setDonationTitle(Util.XSSHandling(detail.getDonationTitle()));
//         detail.setDonationContent(Util.XSSHandling(detail.getDonationContent()));
//         detail.setDonationContent(Util.newLineHandling(detail.getDonationContent()));
//         
//         int donationNo = dao.insertDonation(detail);
//         if(donationNo > 0) {
//        	 
//        	 String renameImage = null; // 변경된 파일명 저장 변수
// 			
//			 renameImage = Util.fileRename(uploadImage.getOriginalFilename());
//        	 System.out.println(renameImage);
//        	 DonationDetail img = new DonationDetail();
//        	 img.setDonationNo(donationNo);
//        	 img.setDonationAttachment(webPath + renameImage);
//        	 
//        	 int result =dao.insertImg(img);
//        	 if(result > 0 && img.getDonationAttachment()!=null) {
//        		 uploadImage.transferTo( new File(folderPath + renameImage) );
//        	 }else { // 이미지 삽입 실패 시
//				 
//				throw new InsertFailException();
//			}
//         }
//		return donationNo;
//	}

	@Override
    public int insertDonation(DonationDetail detail) {
        detail.setDonationTitle(Util.XSSHandling(detail.getDonationTitle()));
        detail.setDonationContent(Util.XSSHandling(detail.getDonationContent()));
        detail.setDonationContent(Util.newLineHandling(detail.getDonationContent()));

        return dao.insertDonation(detail);
    }

    @Override
    public int updateDonation(DonationDetail detail) {
        detail.setDonationTitle(Util.XSSHandling(detail.getDonationTitle()));
        detail.setDonationContent(Util.XSSHandling(detail.getDonationContent()));
        detail.setDonationContent(Util.newLineHandling(detail.getDonationContent()));

        return dao.updateDonation(detail);
    }

    @Override
    public int insertStory(DonationStory story) {
        story.setDonationStoryTitle(Util.XSSHandling(story.getDonationStoryTitle()));
        story.setDonationStoryContent(Util.XSSHandling(story.getDonationStoryContent()));
        story.setDonationStoryContent(Util.newLineHandling(story.getDonationStoryContent()));

        return dao.insertStory(story);
    }

    @Override
    public int updateStory(DonationStory story) {
        story.setDonationStoryTitle(Util.XSSHandling(story.getDonationStoryTitle()));
        story.setDonationStoryContent(Util.XSSHandling(story.getDonationStoryContent()));
        story.setDonationStoryContent(Util.newLineHandling(story.getDonationStoryContent()));

        return dao.updateStory(story);
    }

    @Override
    public void storyDelete(int storyNo) {
        dao.storyDelete(storyNo);
    }

    @Override
    public List<ParentCategory> getParentCategoryList() {
        return dao.getParentCategoryList();
    }

	@Override
	public List<Donation> selectDonation() {
		return dao.selectDonation();
	}

	@Override
	public DonationDetail getDonationDetail2(int donationNo2) {
		return dao.getDonationDetail2(donationNo2);
	}

	// 댓글 등록
		@Override
		public int insertReply(Reply reply) {
			// XSS, 개행문자 처리
			reply.setReplyContent(  Util.XSSHandling( reply.getReplyContent() )  );
			reply.setReplyContent(  Util.newLineHandling( reply.getReplyContent() )  );
					
			return dao.insertReply(reply);
		}
		
		// 응원 등록 서비스 구현
		@Override
		public Reply getReply(String replyContent) {
			// TODO Auto-generated method stub
			return dao.getReply(replyContent);
		}
		
		// 응원 목록 조회 서비스 구현
		@Override
		public List<Reply> selectReplyList(int donationNo) {	
			return dao.selectReplyList(donationNo);
		}
    
}

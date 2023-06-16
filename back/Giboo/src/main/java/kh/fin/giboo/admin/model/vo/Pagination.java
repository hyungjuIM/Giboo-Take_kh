//package kh.fin.giboo.admin.model.vo;
//
//import lombok.Getter;
//
//@Getter
//public class Pagination {
//    private int currentPage;
//    private int listCount;
//    private int limit = 10;
//    private int pageSize = 10;
//    private int maxPage;
//    private int startPage;
//    private int endPage;
//    private int prevPage;
//    private int nextPage;
//
//public Pagination(int currentPage, int listCount) {
//        this.currentPage = currentPage;
//        this.listCount = listCount;
//
//        calculatePagination(); // 계산 메서드 호출
//    }
//
//    public void setCurrentPage(int currentPage) {
//        this.currentPage = currentPage;
//
//        calculatePagination();
//    }
//
//    public void setListCount(int listCount) {
//        this.listCount = listCount;
//
//        calculatePagination();
//    }
//
//    public void setLimit(int limit) {
//        this.limit = limit;
//
//        calculatePagination();
//    }
//
//    public void setPageSize(int pageSize) {
//        this.pageSize = pageSize;
//
//        calculatePagination();
//    }
//}

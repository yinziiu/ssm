package com.hz.model.layer;

import java.util.List;

import org.apache.poi.ss.formula.functions.T;

public class page {
	
	//当前页
    private int pageNum;
    //每页的数量
    private int pageSize;
    //当前页的数量
    private int size;
    //由于startRow和endRow不常用，这里说个具体的用法
    //可以在页面中"显示startRow到endRow 共size条数据"

    //当前页面第一个元素在数据库中的行号
    private int startRow;
    //当前页面最后一个元素在数据库中的行号
    private int endRow;
    //总记录数
    private long total;
    //总页数
    private int pages;
    //结果集
    private List<T> list;

    //第一页
    private int firstPage;
    //前一页
    private int prePage;
    //下一页
    private int nextPage;
    //最后一页
    private int lastPage;

    //是否为第一页
    private boolean isFirstPage = false;
    //是否为最后一页
    private boolean isLastPage = false;
    //是否有前一页
    private boolean hasPreviousPage = false;
    //是否有下一页
    private boolean hasNextPage = false;
    //导航页码数
    private int navigatePages;
    //所有导航页号
    private int[] navigatepageNums;
    
    /*<div class="page text-right clearfix" style="margin-top: 40px">
       <!-- 当前页为第一页时href="javascript:void(0)" 禁用 a 标签的点击时间事件 
          当前页不是第一页时请求url 中返回currentPage=${pageInfo.pageNum - 1 } 当前页 -1
        -->
        <a <c:if test="${pageInfo.pageNum != pageInfo.firstPage}">href="${pageContext.request.contextPath}/orders/list?currentPage=${pageInfo.pageNum - 1 }"</c:if> 
         <c:if test="${pageInfo.pageNum == pageInfo.firstPage}"> href="javascript:void(0)" class="disabled"</c:if>
          >上一页</a>
                                        <!-- foreach 从 1 开始 到 总页数结束  遍历输出 -->
                                        <c:forEach begin="1" end="${pageInfo.pages }" varStatus="status">
                                            <a href="${pageContext.request.contextPath}/orders/list?currentPage=${status.count }" 
                                            <c:if test="${status.count == pageInfo.pageNum}">class="select"</c:if>>${status.count }</a>
                                        </c:forEach>
                                        <!-- 当前页为最后一页时href="javascript:void(0)" 禁用 a 标签的点击时间事件 
                                        当前页不是最后一页时请求url 中返回currentPage=${pageInfo.pageNum - 1 } 当前页 -1
                                     -->
                                        <a <c:if test="${pageInfo.pageNum == pageInfo.lastPage}">class="disabled" href="javascript:void(0)"</c:if> 
                                        <c:if test="${pageInfo.pageNum != pageInfo.lastPage}">href="${pageContext.request.contextPath}/orders/list?currentPage=${pageInfo.pageNum + 1 }"</c:if> 
                                        >下一页</a>
                                    </div> */


}

package com.util;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@ToString
public class pageInfo {

	int startPage; // 페이지 시작번호
	int endPage; // 페이지 끝번호
	boolean prev, next; // 페이지 이동(이전, 다음)

	int pageNum; // pageNum 현재 페이지 번호
	int pageRow; // pageRow,amount한 페이지당 몇개의 게시물을 보여줄것인가
	int startIdx; // 페이지그룹 시작번호

	int totalPage; // 전체 페이지 수
	int totalCount; // 전체 게시물 수

	public pageInfo() { // 매개변수가 없을 때 기본값
		this.pageNum = 1;
		this.pageRow = 10;
	}

	public pageInfo(int pageNum, int pageRow) { // 매개변수가 있을때 (같은타입인 경우에) 실행된다.
		this.pageNum = pageNum;
		this.pageRow = pageRow;
	}

	public pageInfo(int pageNum, int pageRow, int totalCount) { // pageNum, pageRow, totalCount는 변하는 수이기 때문에 변수로 넣어줘야
																// 한다.
		this.totalCount = totalCount;
		this.pageNum = pageNum;
		this.pageRow = pageRow;

		this.startIdx = (this.pageNum - 1) * this.pageRow;

		this.totalPage = totalCount / pageRow;
		if (totalCount % pageRow > 0) totalPage++;
		
		System.out.println("pageNum:" + pageNum); // 확인
		
		this.endPage = (int) (Math.ceil(pageNum / 10.0)) * 10;
		this.startPage = this.endPage - 9;

		int realEnd = (int) (Math.ceil(totalCount * 1.0 / pageRow)); // totalCount 통해 endPage 계산
		if (realEnd < this.endPage) { // 진짜 마지막 번호가 endPage 보다 작으면 같다.
			this.endPage = realEnd;
		}

		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd; // realEnd가 페이지끝번호보다 큰 경우에만 존재한다.
	}

}

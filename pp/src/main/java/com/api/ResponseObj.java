package com.api;

import java.util.List;


import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class ResponseObj{
	private int totalCount;
	private int totalPage;
	private int page;
	private int pageRow;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private List<BoardVO> items;
}

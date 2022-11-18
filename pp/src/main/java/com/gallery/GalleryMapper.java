package com.gallery;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.file.FileVO;

@Mapper
public interface GalleryMapper {
	
	int insert(GalleryVO vo); 
	List<GalleryVO> list(GalleryVO vo);
	GalleryVO view(int gallery_no);
	int update(GalleryVO vo);
	int delete(int gallery_no);

}

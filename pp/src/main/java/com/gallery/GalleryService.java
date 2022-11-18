package com.gallery;

import java.util.List;

import com.file.FileVO;

public interface GalleryService {

	boolean insert(GalleryVO vo); 
	List<GalleryVO> list(GalleryVO vo);
	GalleryVO view(int gallery_no);
	GalleryVO edit(GalleryVO vo);
	boolean update(GalleryVO vo);
	boolean delete(int gallery_no);


}

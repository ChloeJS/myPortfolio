package com.gallery;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.file.FileVO;

@Service
public class GalleryServiceImpl implements GalleryService {

	@Autowired
	GalleryMapper mapper;

	@Override
	public boolean insert(GalleryVO vo) {
		
		return mapper.insert(vo) > 0 ? true : false;
	}



	@Override
	public List<GalleryVO> list(GalleryVO vo) {
		return mapper.list(vo);
	}


	@Override
	public GalleryVO view(int gallery_no) {
		return mapper.view(gallery_no);
	}

	@Override
	public boolean update(GalleryVO vo) {
		return mapper.update(vo) > 0 ? true :  false;
	}

	@Override
	public boolean delete(int gallery_no) {
		return mapper.delete(gallery_no) > 0 ? true : false;
	}


	@Override
	public GalleryVO edit(GalleryVO vo) {
		return mapper.view(vo.getGallery_no());
	}

}

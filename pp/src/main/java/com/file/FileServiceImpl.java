package com.file;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FileServiceImpl implements FileService {
	
	@Autowired
	FileMapper fmapper;

	@Override
	public int insert_file(FileVO fvo) {
		return fmapper.insert_file(fvo);
	}

	@Override
	public int delete_file(FileVO fvo) {
		return fmapper.delete_file(fvo);
	}

	@Override
	public List<FileVO> get_fileList(FileVO fvo) {
		return fmapper.get_fileList(fvo);
	}
}

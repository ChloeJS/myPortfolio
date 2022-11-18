package com.file;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FileMapper {
	
	int insert_file(FileVO fvo);
	int delete_file(FileVO fvo);
	List<FileVO> get_fileList(FileVO fvo);
}

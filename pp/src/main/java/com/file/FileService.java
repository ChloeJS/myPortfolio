package com.file;

import java.util.List;

public interface FileService {
	int insert_file(FileVO fvo);
	int delete_file(FileVO fvo);
	List<FileVO> get_fileList(FileVO fvo);
}

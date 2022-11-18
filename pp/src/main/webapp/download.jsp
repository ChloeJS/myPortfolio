<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.io.*" %>
<%
	String saveDirectory = application.getRealPath("/upload/"); // 실제 파일이 저장된 경로 
	String saveFilename = request.getParameter("sName"); // 실제 서버에 저장된 파일명
	String originalFilename = request.getParameter("oName"); // 사용자가 첨부한 원본 파일명
	
	try {
		File file = new File(saveDirectory, saveFilename);
		InputStream inStream = new FileInputStream(file);
		
		String client = request.getHeader("User-Agent");
		if (client.indexOf("WOW64") == -1 ){
			originalFilename = new String(originalFilename.getBytes("UTF-8"), "ISO-8859-1");
		} else {
			originalFilename = new String(originalFilename.getBytes("KSC5601"), "ISO-8859-1");
		}
		
		response.reset();
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition ", "attachment; filename=\"" + originalFilename + "\"");
		response.setHeader("Content-Length", "" + file.length());
		
		out.clear();
		out = pageContext.pushBody();
		OutputStream outStream = response.getOutputStream();
		byte b[] = new byte[(int)file.length()];
		int readBuffer = 0;
		while ((readBuffer = inStream.read(b)) > 0){
			outStream.write(b, 0, readBuffer);
		}
		
		inStream.close();
		outStream.close();
				
		
	} catch (Exception e) {
		System.out.println(e.toString());}


 %>

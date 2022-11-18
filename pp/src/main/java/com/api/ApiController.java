package com.api;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.notice.NoticeService;

@Controller
public class ApiController {

	@Autowired
	NoticeService service;

	@GetMapping("/test/apiTestSTS.do")
	public String apiTest() {
		return "test/apiTestSTS";
	}

	@GetMapping("/test/client/board/list")
	public String list(Model model, ResponseObj resObj) throws Exception {
		String apiUrl = "http://localhost:8080/project/api/board/list";

		URL url = new URL(apiUrl);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");

		InputStreamReader streamReader = new InputStreamReader(con.getInputStream()); 

		try (
				BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();

			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}

			String jsonString = responseBody.toString();
			// System.out.println("jsonString====================="+jsonString);
			
			ObjectMapper objMapper = new ObjectMapper();
			ResponseObj res = new ResponseObj();
			
			try {
				// JSON 파일을 Java 객체로 deserialization 하기 위해서는 ObjectMapper의 readValue() 메서드를 이용한다.
				objMapper.configure(DeserializationFeature.FAIL_ON_NULL_FOR_PRIMITIVES, false);
				res = objMapper.readValue(jsonString, new TypeReference<ResponseObj>() {}); 
				res = objMapper.readValue(jsonString, ResponseObj.class);
				//System.out.println("res===================================" + res.getEndPage());
			} catch (Exception e) {
				 System.out.println(e.getMessage());
		}
		model.addAttribute("lists", res.getItems());

		return "test/client/board/list";
	}
}
}

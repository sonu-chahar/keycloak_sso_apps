package com.keycloak.dwr;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.keycloak.model.ApplicationMaster;
import com.keycloak.model.EmployeeVO;
import com.keycloak.service.UserMasterService;

@RemoteProxy(name = "userMasterRemoteService")
public class UserMasterRemoteService {

	@Autowired
	UserMasterService userMasterService;

	@RemoteMethod
	public List<ApplicationMaster> getApplicationListByUserId(Long userId) {
		return userMasterService.getApplicationListByUserId(userId);
	}

	@RemoteMethod
	public Boolean isMobileNumberExist(String mobileNumber) {
		return userMasterService.isMobileNubmerExist(mobileNumber);
	}

	@RemoteMethod
	public EmployeeVO checkEmployeeDetails(String employeeCode) {
		String[] commands = new String[] { "curl", "--request", "GET",
				"https://eservices.ndmc.gov.in/emp_api/Emp/emp_dtls", "--header",
				"API_KEY: a474bd87e4e84938a71c35775e1788ce", "--header", "Content-Type: application/json", "--data",
				employeeCode };
		Process process = null;
		BufferedReader reader = null;
		EmployeeVO employeeVO = null;
		try {
			process = Runtime.getRuntime().exec(commands);
			reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
			String line = "";
			StringBuilder response = new StringBuilder();
			while ((line = reader.readLine()) != null) {
				response.append(line);
			}
			String mobileNumber = null;
			JSONParser parser = new JSONParser();
			if (!"".equals(response.toString())) {
				JSONArray array = (JSONArray) parser.parse(response.toString());
				if (array != null && !array.isEmpty()) {
					JSONObject jsonObject = (JSONObject) array.get(0);
					/* if (array.size() == 1) { */
					jsonObject = (JSONObject) array.get(0);
					System.out.println(jsonObject.get("mobile_no"));
					mobileNumber = (String) jsonObject.get("mobile_no");
					System.out.println(mobileNumber);
					ObjectMapper objectMapper = new ObjectMapper();
					employeeVO = objectMapper.readValue(jsonObject.toJSONString(), EmployeeVO.class);
					/* } */
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} finally {
			if (process != null) {
				process.destroy();
			}
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			reader = null;
			process = null;
		}
		System.out.println(employeeVO);

		return employeeVO;
	}

}

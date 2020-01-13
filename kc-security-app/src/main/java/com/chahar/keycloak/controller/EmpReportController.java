package com.chahar.keycloak.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.chahar.keycloak.report.Emp;
import com.chahar.keycloak.service.EmpReportService;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

@RestController
@RequestMapping("/employee")
public class EmpReportController {
	private List<Emp> empList = Arrays
			.asList(new Emp[] { new Emp(1, "Sandeep", "Data Matrix", "Front-end Developer", 35000),
					new Emp(2, "Prince", "Genpact", "Consultant", 50000),
					new Emp(3, "Gaurav", "Silver Touch ", "Sr. Java Engineer", 97000),
					new Emp(4, "Abhinav", "Akal Info Sys", "CTO", 700000) });

    @Autowired
	private EmpReportService empReportService;

    @GetMapping("/report2")
    public String empReport2(HttpServletRequest request) {
    	
        String baseDir=request.getContextPath()+"/WEB-INF/classes";
        return empReportService.generateReport(baseDir);
    }
    @GetMapping("/report")
    public ModelAndView empReport(HttpServletRequest request,HttpServletResponse response, ModelMap model) {
    	
    	JRDataSource datasource = new JRBeanCollectionDataSource(empList);
    	
    	model.addAttribute("datasource",datasource);
    	model.addAttribute("createdBy","Chahar");
        
        return new ModelAndView("employee-rpt",model);
    }
}
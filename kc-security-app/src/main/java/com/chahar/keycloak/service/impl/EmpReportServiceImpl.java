package com.chahar.keycloak.service.impl;

import java.io.FileInputStream;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;

import com.chahar.keycloak.report.Emp;
import com.chahar.keycloak.service.EmpReportService;

import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

@Service
public class EmpReportServiceImpl implements EmpReportService {

	private List<Emp> empList = Arrays
			.asList(new Emp[] { new Emp(1, "Sandeep", "Data Matrix", "Front-end Developer", 35000),
					new Emp(2, "Prince", "Genpact", "Consultant", 50000),
					new Emp(3, "Gaurav", "Silver Touch ", "Sr. Java Engineer", 97000),
					new Emp(4, "Abhinav", "Akal Info Sys", "CTO", 700000) });

	public String generateReport(String fileName) {
		try {
			FileInputStream inputStream = new FileInputStream(
					ResourceUtils.getFile("classpath:reports/employee-rpt.jrxml"));
			// Compile the Jasper report from .jrxml to .japser
			JasperReport jasperReport = JasperCompileManager.compileReport(inputStream);

			// Get your data source
			JRBeanCollectionDataSource jrBeanCollectionDataSource = new JRBeanCollectionDataSource(empList);

			// Add parameters
			Map<String, Object> parameters = new HashMap<>();

			parameters.put("createdBy", "chahar.com");

			// Fill the report
			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters,
					jrBeanCollectionDataSource);

			// Export the report to a PDF file
			JasperExportManager.exportReportToPdfFile(jasperPrint, "employee-rpt.pdf");

			return "Report successfully generated @path= ";

		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
	}
}

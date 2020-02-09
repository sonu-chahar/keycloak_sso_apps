package com.keycloak.controller;
import javax.servlet.jsp.PageContext;

import com.keycloak.decorator.CommonDecorator;
import com.keycloak.model.ApplicationMaster;


public class SemesterMasterDecorator extends CommonDecorator {

	@SuppressWarnings("unused")
	private PageContext context;

	public String getActionLink() {
		ApplicationMaster master = (ApplicationMaster) getCurrentRowObject();
		Integer paramId = (Integer) getPageContext().getRequest().getAttribute("id");

		Integer id = master.getId();

		boolean isDeleteDisabled = false;
		if (id.equals(paramId))
			isDeleteDisabled = true;
		String contextPath = getContextPath();
		String link = "<a id='" + id + "' href='"
				+ getEnryptedURLEdit(contextPath + "/newSemesterMaster/editNewSemester/" + id + "?pageId=" + getPageId())
				+ getPagination() + "'><img src='" + getContextPath() + "/resources/images/Edit.gif' title='Edit'></a> / ";
		String deleteLink = !isDeleteDisabled
				? " <a id='" 
				+ id 
				+ "' href=\"javascript:void(0)\" onclick=\"return deleteObject('Record ?', " 
				+ id
				+ ",'/newSemesterMaster/deleteNewSemester/','"+ contextPath+"', " + getPageId() 
				+ ")\" " 
				+ addClassToDelete()
				+ "><img src='" 
				+ getContextPath() + "/resources/images/Delete.gif' title='Delete'></a>"
				: "<img width='15px' height='15px' src='" + getContextPath() + "/resources/images/Block_Icon.png'>";
		link += deleteLink;
		return link;
	}

}

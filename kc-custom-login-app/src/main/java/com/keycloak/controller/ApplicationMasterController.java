package com.keycloak.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.keycloak.model.ApplicationMaster;
import com.keycloak.service.GenServicein;

/**
 * @author Chahar
 *
 */
@Controller
public class ApplicationMasterController extends AbstractPageController {

	@Autowired
	private GenServicein<ApplicationMaster> genericApplicationMasterService;

	@GetMapping(path = "**/showApplicationPage")
	public ModelAndView showApplicationMasterPage(@ModelAttribute("application") ApplicationMaster applicationMasterDTO,
			HttpServletRequest request, ModelMap model) {
		log.debug("Loading Application Master page request....");
		model.addAttribute(MODEL_ATTRIBUTE_MESSAGE, getMessageAttributeForPage(request, "Application"));
		model.put("applicationList", genericApplicationMasterService.getAllNew(ApplicationMaster.class));
		log.debug("showing Application Master page....");
		return new ModelAndView("applicationMasterPage", model);
	}

	@PostMapping(path = "**/saveNewApplication")
	public ModelAndView saveOrUpdateApplicationMaster(@ModelAttribute("application") ApplicationMaster applicationMaster,
			BindingResult result, HttpServletRequest request, HttpServletResponse response) {
		log.debug("Processing save request for Application Master.....");
		String status = CONSTANT_FOR_BLANK_STRING;
		Integer holdId = applicationMaster.getId();
		try {
			applicationMaster = genericApplicationMasterService.save(applicationMaster);
		}  catch (Exception e) {
			log.error("Exception occured \n Message : {} \n Cause : {}" ,e.getMessage(), e.getCause());
			status = STATUS_FOR_DUPLICATE;
			return new ModelAndView(REDIRECT_URL_FOR_APPLICATION_MASTER + status);
		}
		if (applicationMaster.getId().equals(holdId)) {
			status = STATUS_FOR_UPDATE;
		} else {
			if (applicationMaster.getId() != null) {
				status = STATUS_FOR_SUCCESS;
			} else {
				status = STATUS_FOR_ERROR;
			}
		}
		log.debug("Application Master saved sucessfully.....");
		return new ModelAndView(REDIRECT_URL_FOR_APPLICATION_MASTER + status);
	}

	@RequestMapping(value = "**/editNewApplication/{id}", method = RequestMethod.GET)
	public ModelAndView editDegree(@PathVariable Integer id, Model model) {
		log.debug("loading Edit request for Application Master ....");
		ApplicationMaster applicationMaster = genericApplicationMasterService.get(id);

		if (applicationMaster == null) {
			return new ModelAndView(REDIRECT_URL_FOR_APPLICATION_MASTER +"alreadydeleted");
		} else
			model.addAttribute("applicationMaster", applicationMaster);

		List<ApplicationMaster> applicationList = genericApplicationMasterService.getAllNew(ApplicationMaster.class);
		model.addAttribute("ApplicationList", applicationList);
		model.addAttribute("isdesebled", true);
		log.debug("Showing edit page for Application Master.....");
		return new ModelAndView("academics/semesterMaster");
	}

	@RequestMapping(value = "**/deleteNewApplication/{id}", method = RequestMethod.GET)
	public ModelAndView deleteDegree(@PathVariable Integer id, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		log.debug("Processing delete request for Application Master.....");
		ApplicationMaster applicationMaster = genericApplicationMasterService.get(id);
		String stat = "";
		try {
			genericApplicationMasterService.remove(applicationMaster.getId());
			stat = "deleted";
		} catch (Exception e) {
			log.error("Application Master object already deleted....");
			stat = "cannotdelete";
		}
		if ("cannotdelete".equals(stat))
			log.debug("Application Master object cannot be deleted.....");
		else
			log.debug("Application Master object deleted sucessfully.....");
		return new ModelAndView(REDIRECT_URL_FOR_APPLICATION_MASTER + stat);
	}
}

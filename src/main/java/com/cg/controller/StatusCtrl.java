package com.cg.controller;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.cg.bean.Status;
import com.cg.service.StatusService;
@Controller
public class StatusCtrl {
	@Autowired
	StatusService service;
	@RequestMapping(value="/value",method = RequestMethod.POST)
	public ModelAndView table(@RequestParam("userName")String userName,@RequestParam("statusReport")String statusReport) 
	{
		    System.out.println("hg");
			ModelAndView model=new ModelAndView("source");
			model.addObject("userName",userName);
			System.out.println(statusReport);
			model.addObject("statusReport",statusReport);
		
		return model;
	}
	@RequestMapping(value="/add",method = RequestMethod.POST)
	public String addDetails(@RequestParam("userName")String userName,@RequestParam("statusReport")String statusReport,@RequestParam("currentWeekStatus")String currentWeekStatus,@RequestParam("nextWeekStatus")String nextWeekStatus,@RequestParam("issueNote")String issueNote,@RequestParam("timeStamp")String timeStamp) throws ParseException
	{
	System.out.println("gfd");
	Status status=new Status();
	status.setUserName(userName);
	SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
	java.util.Date date = sdf1.parse(statusReport);
	java.sql.Date sqlStartDate = new java.sql.Date(date.getTime());
	System.out.println(sqlStartDate);
	status.setStatusReport(sqlStartDate);
	status.setCurrentWeekStatus(currentWeekStatus);
	status.setIssueNote(issueNote);
	status.setNextWeekStatus(nextWeekStatus);
	 DateFormat formatter=new SimpleDateFormat("dd/MM/yyyy HH:mm");
	 java.util.Date dat = formatter.parse(timeStamp);
	 java.sql.Timestamp timestamp = new java.sql.Timestamp(dat.getTime());
      status.setTimeStamp(timestamp);
      System.out.println(timestamp);
		Status s1=service.addDetails(status);
		ModelAndView model=new ModelAndView();
		model.addObject("status", status);
		return "display";
	}
}

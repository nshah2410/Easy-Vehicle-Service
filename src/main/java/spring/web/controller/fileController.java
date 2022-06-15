package spring.web.controller;

import java.io.IOException;

import java.io.PrintWriter;

import java.security.Principal;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.print.attribute.standard.Severity;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.ServiceMode;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import spring.model.appointmentModel;
import spring.model.areaModel;
import spring.model.cityModel;
import spring.model.companyModel;
import spring.model.customerModel;
import spring.model.departmentModel;
import spring.model.employeeModel;
import spring.model.garageInventoryModel;
import spring.model.garageModel;
import spring.model.garageVehicleModel;
import spring.model.inventoryModel;
import spring.model.loginModel;
import spring.model.privilegeModel;
import spring.model.requestModel;
import spring.model.requestpartModel;
import spring.model.roleModel;
import spring.model.serviceModel;
import spring.model.userModel;
import spring.model.userVehicleModel;
import spring.model.vmodelModel;
import spring.model.dao.genericDao;
import spring.web.MailMail;

@Configuration
@Controller
public class fileController {

	@Autowired
	genericDao d;
	
	@RequestMapping(value="login.evs",method=RequestMethod.GET)
	public String login(HttpSession ses) {
		ses.removeAttribute("user");
		ses.removeAttribute("cid");
		ses.removeAttribute("role");
		ses.invalidate();
		return "login";
	}
	
	@RequestMapping(value="loginerror.evs",method=RequestMethod.GET)
	public void loginerror(HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		response.setHeader("Content-Type", "text/html");
		out.print("Invalid username or password");
	}
	
	@RequestMapping(value="EVS.evs",method=RequestMethod.GET)
	public String index(ModelMap m) {
		List<customerModel> clist = d.getdata("customerModel");
		int nc = clist.size();
		List<employeeModel> elist = d.getdata("employeeModel");
		int ne = elist.size();
		List<garageModel> glist = d.getdata("garageModel");
		int ng = glist.size();
		List<serviceModel> slist = d.getdata("serviceModel");
		int ns = slist.size();
		m.put("nes", ne);
		m.put("nc", nc);
		m.put("ng", ng);
		m.put("ns", ns);
		return "index";
	}
	
	@RequestMapping(value="signup.evs",method=RequestMethod.GET)
	public String signup() {
		return "signup";
	}

	@RequestMapping(value="forgotpass.evs",method=RequestMethod.GET)
	public String forgotpass() {
		return "forgotpassword";
	}
	
	@RequestMapping(value="forgotpassword.evs",method=RequestMethod.POST)
	public void forgotpassword(ModelMap m, HttpSession ses,@RequestParam("username") String username, HttpServletResponse response) throws IOException {
		List<loginModel> lm = d.getdata("loginModel");
		PrintWriter out = response.getWriter();
		String password = null;
		String user = null;
		String role = null;
		for (int i = 0; i < lm.size(); i++) {
			if(lm.get(i).getUsername().equalsIgnoreCase(username)) {
				role = lm.get(i).getRole();
				password = lm.get(i).getPassword();
			}	
		}
		if(role.equalsIgnoreCase("role_garage_admin")) {
			List<garageModel> gm = d.getdata("garageModel");
			for (int i = 0; i < gm.size(); i++) {
				if(gm.get(i).getEmail_id() == username)
					user = gm.get(i).getGarage_name();
			}
		}
		else if(role.equalsIgnoreCase("role_customer")) {
			List<customerModel> cm = d.getdata("customerModel");
			for (int i = 0; i < cm.size(); i++) {
				if(cm.get(i).getEmail_id().equals(username)){
					user = cm.get(i).getName();
				}
			}
		}
		else {
			user = "Admin";
		}
		
		if(password != null) {
			ApplicationContext AC = new ClassPathXmlApplicationContext("Spring-Mail.xml");
		    MailMail mm = (MailMail) AC.getBean("mailMail");    	
		    
			mm.sendMail("nshah2410.temp@gmail.com",username,"Forgot Password","Dear "+user+", \n\nUsername: "+username+"\n\nYour Password is: "+password);
			 
		   	ses.invalidate();
		   	out.print("Email Sent Successfully");
		}
		else {
			out.print("Username Doesn't Exists");
		}
		
	}
	
	@RequestMapping(value="index.evs",method=RequestMethod.GET)
	public String index(Principal p,HttpSession ses, HttpServletRequest request,ModelMap m,HttpServletResponse response) {
		response.setHeader("Content-Type", "text/html");
		String username = p.getName();
		System.out.println(username);
		int cust_id = 0;
		String name = null;
		String role = null;
		List<loginModel> clist = d.getdata("loginModel");
		System.out.print(clist);
		for(int i = 0 ; i < clist.size() ; i++) {
			if(clist.get(i).getUsername().equalsIgnoreCase(username)) {
				role = clist.get(i).getRole();				
			}
		}
		if(role.equalsIgnoreCase("role_customer")) {
			List<customerModel> cm = d.getdata("customerModel");
			for (int i = 0; i < cm.size(); i++) {
				if(cm.get(i).getEmail_id().equalsIgnoreCase(username)) {
					name = cm.get(i).getName();
					cust_id = cm.get(i).getCust_id();
				}
			}
		}
		else if(role.equalsIgnoreCase("role_garage_admin")) {
			List<garageModel> gm = d.getdata("");
			for (int i = 0; i < gm.size(); i++) {
				if(gm.get(i).getEmail_id().equalsIgnoreCase(username)) {
					name = gm.get(i).getGarage_name();
					cust_id = gm.get(i).getGarage_id();
				}
			}
		}
		else if(role.equalsIgnoreCase("role_admin")) {
			List<loginModel> lm = d.getdata("loginModel");
			for (int i = 0; i < lm.size(); i++) {
				if(lm.get(i).getUsername().equalsIgnoreCase(username)) {
					name = "Super Admin";
					cust_id = lm.get(i).getUser_id();
				}	
			}
		}
		ses.setAttribute("user", name);
		ses.setAttribute("cid", cust_id);
		ses.setAttribute("role", role);
		if(role.equalsIgnoreCase("role_admin"))
		{
			List<garageModel> glist = d.getdata("");
			int garage = glist.size();
			int customer = d.getdata("customerModel").size();
			int service = d.getdata("serviceModel").size();
			int employee = d.getdata("employeeModel").size();
			m.put("service", service);
			m.put("customer", customer);
			m.put("employee", employee);
			m.put("garage", garage);
			return "admindashboard";	
		}
		else if(role.equalsIgnoreCase("role_customer")) {
			customerModel cm = d.get(new customerModel(), cust_id);
			int cars = cm.getUvm().size();
			List<serviceModel> slist = d.getdata("serviceModel");
			List<serviceModel> services = new ArrayList<serviceModel>();
			String lastservice = null;
			List<serviceModel> feed = new ArrayList<serviceModel>();
			if(!slist.isEmpty()) {
				for (int i = 0; i < slist.size(); i++) {
					if(slist.get(i).getCm().getCust_id() == cust_id && slist.get(i).isDelivered_status() == true) {
						//lastservice = services.get(i).getService_date().toString();
					}
					if(slist.get(i).getCm().getCust_id() == cust_id && slist.get(i).isFeedback_status() == false) {
						feed.add(slist.get(i));
					}
				}
			}
			int service = services.size();
			int feedback = feed.size();
			m.put("service", service);
			m.put("vehicle", cars);
			m.put("feedback", feedback);
			return "customerDashboard";
		}
		else if(role.equalsIgnoreCase("role_garage_admin")) {
			List<serviceModel> slist = d.getdata("serviceModel");
			List<customerModel> clist1 = new ArrayList<customerModel>();
			int services = 0;
			if(!slist.isEmpty()) {
				for (int i = 0; i < slist.size(); i++) {
					if(slist.get(i).getGm().getGarage_id() ==  cust_id) {
						if(clist1.isEmpty()) {
							clist1.add(slist.get(i).getCm());
						}
						else {
							for (int j = 0; j < clist1.size(); j++) {
								if(!clist1.isEmpty()) {
								if(clist1.get(j).getCust_id() != slist.get(i).getCm().getCust_id()) {
									clist1.add(slist.get(i).getCm());
								}
							}
							}
						}
					}
					if(slist.get(i).getGm().getGarage_id() == cust_id) {
						services++;
					}
				}
			}
			List<requestModel> rlist = d.getdata("requestModel");
			int requests = 0;
			List<requestModel> requestlist = new ArrayList<requestModel>();
			for (int i = 0; i < rlist.size(); i++) {
				if(rlist.get(i).getSm().getGm().getGarage_id() == cust_id && rlist.get(i).isRequest_status() == false && rlist.get(i).isRequest_visibilty_status() == true) {
					requestlist.add(rlist.get(i));
					requests++;
				}
			}
			int customer = clist1.size();
			List<employeeModel> elist = d.getdata("employeeModel");
			int employees = 0;
			for (int i = 0; i < elist.size(); i++) {
				if(elist.get(i).getGm().getGarage_id() == cust_id) {
					employees++;
				}
			}
			m.put("service", services);
			m.put("customer", customer);
			m.put("employee", employees);
			m.put("request", requests);
			m.put("requestlist", requestlist);
			return "dashboard";
		}
			
			
		
		return null;
	}
	
	@RequestMapping(value="customer.evs",method=RequestMethod.GET)
	public String customer(ModelMap m) {
		m.put("custlist", d.getdata("customerModel"));
		return "customer";
	}
	
	@RequestMapping(value="editcustomer.evs",method=RequestMethod.GET)
	public String editcustomer(ModelMap m, HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		customerModel cm = d.get(new customerModel(), id);
		m.put("cl", cm);
		return "editcustomer";
	}
	
	@RequestMapping(value="editgarage.evs",method=RequestMethod.GET)
	public String editgarage(ModelMap m, HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("gid"));
		garageModel gm = d.get(new garageModel(), id);
		m.put("gd", gm);
		List<areaModel> alist = d.getdata("areaModel");
		List<cityModel> clist = d.getdata("cityModel");
		m.put("alist", alist);
		m.put("clist", clist);
		return "editgarage";
	}
	
	@RequestMapping(value="profile.evs",method=RequestMethod.GET)
	public String editprofile(ModelMap m, HttpServletRequest request,HttpSession ses) {
		String role = (String) ses.getAttribute("role");
		int id = (int) ses.getAttribute("cid");
		if(role.equalsIgnoreCase("role_customer")) {
			customerModel cm = d.get(new customerModel(), id);
			m.put("cl", cm);
			return "profile";
		}
		else if(role.equalsIgnoreCase("role_garage_admin")) {
			garageModel gm = d.get(new garageModel(), id);
			m.put("gl",gm);
			return "garageprofile";
		}
		else if(role.equalsIgnoreCase("role_admin")) {
			loginModel lm = d.get(new loginModel(), id);
			m.put("lm", lm);
			return "adminprofile";
		}
		return null;
	}
	
	@RequestMapping(value="employee.evs",method=RequestMethod.GET)
	public String employee(ModelMap m) {
		m.put("city", d.getdata("cityModel"));
		m.put("emplist", d.getdata("employeeModel"));
		m.put("glist", d.getdata("garageModel"));
		m.put("deptlist", d.getdata("departmentModel"));
		return "employee";
	}
	
	@RequestMapping(value="editemployee.evs",method=RequestMethod.GET)
	public String editemployee(ModelMap m, HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		employeeModel em = d.get(new employeeModel(), id);
		m.put("glist", d.getdata("garageModel"));
		m.put("deptlist", d.getdata("departmentModel"));
		m.put("el", em);
		return "editemployee";
	}
	
	@RequestMapping(value="department.evs",method=RequestMethod.GET)
	public String department(ModelMap m) {
		m.put("deptlist", d.getdata("departmentModel"));
		return "department";
	}
	
	@RequestMapping(value="vehiclecompany.evs",method=RequestMethod.GET)
	public String managecompany(ModelMap m) {
		m.put("clist", d.getdata("companyModel"));
		return "vehiclecompany";
	}
	
	@RequestMapping(value="vehiclemodel.evs",method=RequestMethod.GET)
	public String vehiclemodel(ModelMap m,@RequestParam("id") int id) {
		companyModel cm = d.get(new companyModel(), id);
		m.put("cm", cm);
		return "vehiclemodel";
	}
	
	@RequestMapping(value="garagedetails.evs",method=RequestMethod.GET)
	public String garagedetails(ModelMap m,@RequestParam("gid") int id) {
		garageModel gm = d.get(new garageModel(), id);
		
		int employee = 0;
		int customer = 0;
		int services = 0;
		List<employeeModel> em = d.getdata("employeeModel");
		for (int i = 0; i < em.size(); i++) {
			if(em.get(i).getGm().getGarage_id() ==  id) {
				employee++;
			}
		}
		
		List<serviceModel> slist = d.getdata("serviceModel");
		List<customerModel> clist = new ArrayList<customerModel>();
		if(!slist.isEmpty()) {
			for (int i = 0; i < slist.size(); i++) {
				if(slist.get(i).getGm().getGarage_id() ==  id) {
					services++;
					if(clist.isEmpty()) {
						clist.add(slist.get(i).getCm());
					}
					else {
						for (int j = 0; j < clist.size(); j++) {
							if(clist.get(j).getCust_id() != slist.get(i).getCm().getCust_id()) {
								clist.add(slist.get(i).getCm());
							}
						}
					}
				}
			}
		}
		customer = clist.size();
		m.put("customers",customer);
		m.put("services",services);
		m.put("employees",employee);
		m.put("gdetail", gm);
		return "garagedetails";
	}
	
	@RequestMapping(value="customervehicle.evs",method=RequestMethod.GET)
	public String customervehicle(ModelMap m) {
		m.put("custlist", d.getdata("customerModel"));
		return "customervehicle";
	}
	
	@RequestMapping(value="viewcustvehicle.evs",method=RequestMethod.GET)
	public String customervehicle(ModelMap m,@RequestParam("id") int id) {
		customerModel cm = d.get(new customerModel(), id);
		m.put("custlist", cm);
		return "viewcustvehicle";
	}
	
	@RequestMapping(value="uservehiclehistory.evs",method=RequestMethod.GET)
	public String uservehicleHistory(ModelMap m,@RequestParam("vid") int vid) {
		List<serviceModel> slist = d.getdata("serviceModel");
		List<serviceModel> services = new ArrayList<serviceModel>();
		if(!slist.isEmpty()) {
			for (int i = 0; i < slist.size(); i++) {
				if(slist.get(i).getUvm().getUv_id() == vid) {
					services.add(slist.get(i));
				}
			}
		}
		m.put("services", services);
		return "service";
	}
	
	@RequestMapping(value="addcustomervehicle.evs",method=RequestMethod.GET)
	public String addcustomervehicle(ModelMap m) {
		m.put("custlist", d.getdata("customerModel"));
		m.put("companylist",d.getdata("companyModel"));
		return "addcustomervehicle";
	}
	
	@RequestMapping(value="city.evs",method=RequestMethod.GET)
	public String city(ModelMap m) {
		m.put("clist", d.getdata("cityModel"));
		return "city";
	}
	
	@RequestMapping(value="area.evs",method=RequestMethod.GET)
	public String area(ModelMap m,@RequestParam("id") int id) {
		cityModel cm = d.get(new cityModel(), id);
		m.put("cm", cm);
		return "area";
	}
	
	@RequestMapping(value="garage.evs",method=RequestMethod.GET)
	public String garage(ModelMap m) {
		m.put("clist", d.getdata("cityModel"));
		m.put("glist", d.getdata("garageModel"));
		return "garage";
	}
	
	@RequestMapping(value="user.evs",method=RequestMethod.GET)
	public String user() {
		return "user";
	}
	
	@RequestMapping(value="registration.evs",method=RequestMethod.GET)
	public String user_registration(ModelMap m) {
		m.put("role", d.getdata("roleModel"));
		m.put("userForm", new userModel());
		return "userform";
	}
	
	@RequestMapping(value="inventory.evs",method=RequestMethod.GET)
	public String inventory(ModelMap m) {
		m.put("clist", d.getdata("companyModel"));
		return "inventory";
	}
	
	@RequestMapping(value="myvehicle.evs",method=RequestMethod.GET)
	public String myVehicle(HttpSession ses, ModelMap m) {
		int cust_id = (int) ses.getAttribute("cid");
		customerModel cm = d.get(new customerModel(), cust_id);
		List<userVehicleModel> uvm = cm.getUvm();
		m.put("vlist", uvm);
		return "myvehicle";
	}
	
	@RequestMapping(value="service.evs",method=RequestMethod.GET)
	public String service(HttpSession ses, ModelMap m) {
		int customer_id = (int) ses.getAttribute("cid");
		List<serviceModel> slist = d.getdata("serviceModel");
		List<serviceModel> services = new ArrayList<serviceModel>();
		if(!slist.isEmpty()) {
			for (int i = 0; i < slist.size(); i++) {
				if(slist.get(i).getCm().getCust_id() == customer_id && slist.get(i).isDelivered_status() == true) {
					services.add(slist.get(i));
				}
			}
		}
		m.put("services", services);
		return "service";
	}
	
	@RequestMapping(value="servicerequest.evs",method=RequestMethod.GET)
	public String servicerequest(HttpSession ses, ModelMap m) {
		int cust_id = (int) ses.getAttribute("cid");
		customerModel cm = d.get(new customerModel(), cust_id);
		List<userVehicleModel> uvm = cm.getUvm();
		List<cityModel> clist = d.getdata("cityModel");
		m.put("clist", clist);
		m.put("vlist", uvm);
		return "serviceRequest";
	}
	
	@RequestMapping(value="servicedetails.evs",method=RequestMethod.GET)
	public String servicedetails(HttpSession ses, ModelMap m, HttpServletRequest request) {
		int service_id = Integer.parseInt(request.getParameter("id"));
		serviceModel sm = d.get(new serviceModel(), service_id);
		
		String spart = sm.getParts().toString().replace("[", "").replace("]", "").replace(" ", "");
		String[] tempparts = spart.split(",");
		int[] parts = new int[tempparts.length];
		for (int i = 0; i < parts.length; i++) {
			parts[i] = Integer.parseInt(tempparts[i]);
		}
		
		List<String> finalparts = new ArrayList<String>();
		List<Integer> finalprice = new ArrayList<Integer>();
		List<inventoryModel> invmodel = d.getdata("inventoryModel");
		List<garageInventoryModel> inventory = d.getdata("garageInventoryModel");
		
		if(!invmodel.isEmpty()) {
			for (int i = 0; i < invmodel.size(); i++) {
				for (int k1 = 0; k1 < inventory.size(); k1++) {
				if(inventory.get(k1).getGm().getGarage_id() == sm.getGm().getGarage_id()) { 
					if(inventory.get(k1).getVm().getVmodel_id() == sm.getUvm().getVm().getVmodel_id()) {
						String pricestring = sm.getAmount().toString().replace("[", "").replace("]", "").replace(" ", "");						
						String[] pricetemp = pricestring.split(",");
						int[] price = new int[pricetemp.length];
						for (int j = 0; j < pricetemp.length; j++) {
							price[j] = Integer.parseInt(pricetemp[j]);
						}
						
						for (int j2 = 0; j2 < parts.length; j2++) {
							if(parts[j2]==invmodel.get(i).getPart_id()) {
								finalparts.add(invmodel.get(i).getPart_name());
								finalprice.add(price[j2]);
								break;
							}
						}
					}
				}
			}
			}
		}
		int sum = 0;
		for (int i = 0; i < finalparts.size(); i++) {
			sum = sum + finalprice.get(i);
		}
		m.put("parts", finalparts);
		m.put("price", finalprice);
		m.put("sdetails",sm);
		m.put("total", sum);
		return "serviceDetails";
	}

	@RequestMapping(value="pendingfeedback.evs",method=RequestMethod.GET)
	public String pendingfeedback(HttpSession ses, ModelMap m, HttpServletRequest request) {
		int customer_id = (int) ses.getAttribute("cid");
		List<serviceModel> temp = d.getdata("serviceModel");
		List<serviceModel> feed = new ArrayList<serviceModel>();
		if(!temp.isEmpty()) {
			for (int i = 0; i < temp.size(); i++) {
				if(temp.get(i).getCm().getCust_id() == customer_id && temp.get(i).isFeedback_status() == false) {
					feed.add(temp.get(i));
				}
			}
		}
		m.put("feed", feed);
		return "pendingfeedback";
	}
	
	@RequestMapping(value="servicesummary.evs",method=RequestMethod.GET)
	public String servicesummary(HttpSession ses, ModelMap m, HttpServletRequest request) {
		int service_id = Integer.parseInt(request.getParameter("id"));
		serviceModel sm = d.get(new serviceModel(), service_id);
		List<requestModel> rm = d.getdata("requestModel");
		int request_id = 0;
		String spart = sm.getParts().toString().replace("[", "").replace("]", "").replace(" ", "");
		String[] tempparts = spart.split(",");
		int[] parts = new int[tempparts.length];
		for (int i = 0; i < parts.length; i++) {
			parts[i] = Integer.parseInt(tempparts[i]);
		}
		for (int i = 0; i < rm.size(); i++) {
			if(rm.get(i).getSm().getService_id() == service_id) {
				request_id = rm.get(i).getRequest_id();
			}
			
		}
		List<String> finalparts = new ArrayList<String>();
		List<Integer> finalprice = new ArrayList<Integer>();
		List<inventoryModel> invmodel = d.getdata("inventoryModel");
		List<garageInventoryModel> inventory = d.getdata("garageInventoryModel");
		
		if(!invmodel.isEmpty()) {
			for (int i = 0; i < invmodel.size(); i++) {
				for (int k1 = 0; k1 < inventory.size(); k1++) {
				if(inventory.get(k1).getGm().getGarage_id() == sm.getGm().getGarage_id()) { 
					if(inventory.get(k1).getVm().getVmodel_id() == sm.getUvm().getVm().getVmodel_id()) {
						String pricestring = sm.getAmount().toString().replace("[", "").replace("]", "").replace(" ", "");						
						String[] pricetemp = pricestring.split(",");
						int[] price = new int[pricetemp.length];
						for (int j = 0; j < pricetemp.length; j++) {
							price[j] = Integer.parseInt(pricetemp[j]);
						}
						
						for (int j2 = 0; j2 < parts.length; j2++) {
							if(parts[j2]==invmodel.get(i).getPart_id()) {
								finalparts.add(invmodel.get(i).getPart_name());
								finalprice.add(price[j2]);
								break;
							}
						}
					}
				}
			}
			}
		}
		int sum = 0;
		for (int i = 0; i < finalparts.size(); i++) {
			sum = sum + finalprice.get(i);
		}
		m.put("parts", finalparts);
		m.put("price", finalprice);
		m.put("sdetails",sm);
		m.put("total", sum);
		m.put("request_id",request_id);
		return "servicesummary";
	}
	
	@RequestMapping(value="garageservicerequest.evs",method=RequestMethod.GET)
	public String garageservicerequest(HttpSession ses, ModelMap m) {
		int cust_id = (int) ses.getAttribute("cid");
		customerModel cm = d.get(new customerModel(), cust_id);
		List<userVehicleModel> uvm = cm.getUvm();
		List<cityModel> clist = d.getdata("cityModel");
		m.put("clist", clist);
		m.put("vlist", uvm);
		return "garageservicerequest";
	}
	
	@RequestMapping(value="garageuservehicle.evs",method=RequestMethod.GET)
	public String garageuservehicle(HttpServletRequest request, ModelMap m, HttpSession ses) {
		int cust_id = Integer.parseInt(request.getParameter("id"));
		int garage_id = (int)ses.getAttribute("cid");
		String name = null;
		List<serviceModel> slist = d.getdata("serviceModel");
		List<serviceModel> temp = new ArrayList<serviceModel>();
		List<userVehicleModel> userVehicles = new ArrayList<userVehicleModel>();
		if(!slist.isEmpty()) {
			for (int i = 0; i < slist.size(); i++) {
				if(slist.get(i).getCm().getCust_id() == cust_id && slist.get(i).getGm().getGarage_id() == garage_id) {
					temp.add(slist.get(i));
					name = slist.get(i).getCm().getName();
				}
			}
		}
		m.put("name", name);
		m.put("uservehicles", temp);
		return "garageuservehicle";
	}

	@RequestMapping(value="price_estimation.evs",method=RequestMethod.POST)
	public String priceestimation(HttpServletRequest request, HttpServletResponse response, ModelMap m) throws IOException {
		PrintWriter out = response.getWriter();
		int vehicle_id = Integer.parseInt(request.getParameter("vehicle"));
		int area = Integer.parseInt(request.getParameter("area"));
		String[] tempparts = request.getParameterValues("parts");
		int[] parts = new int[tempparts.length];
		for (int i = 0; i < parts.length; i++) {
			parts[i] = Integer.parseInt(tempparts[i]);
		}
		List<List> priceestimation = new ArrayList<List>();
		List temppriceest = new ArrayList();
		List<inventoryModel> invmodel = d.getdata("inventoryModel");
		List<garageInventoryModel> inventory = d.getdata("garageInventoryModel");
		int sum = 0;
		if(!inventory.isEmpty()) {
			for (int i = 0; i < inventory.size(); i++) {
				if(inventory.get(i).getGm().getAm().getArea_id() == area) {
					if(inventory.get(i).getVm().getVmodel_id() == vehicle_id) {
						garageInventoryModel gm = d.get(new garageInventoryModel(), inventory.get(i).getGi_id());
						String partstring = gm.getParts().toString().replace("[", "").replace("]", "").replace(" ", "");
						String pricestring = gm.getPrice().toString().replace("[", "").replace("]", "").replace(" ", "");
						String quantitystring = gm.getQuantity().toString().replace("[", "").replace("]", "").replace(" ", "");
						String[] parttemp = partstring.split(",");
						String[] pricetemp = pricestring.split(",");
						String[] qunatitytemp = quantitystring.split(",");
						int[] part = new int[parttemp.length];
						int[] quantity = new int[parttemp.length];
						int[] price = new int[parttemp.length];
						for (int j = 0; j < parttemp.length; j++) {
							part[j] = Integer.parseInt(parttemp[j]);
							price[j] = Integer.parseInt(pricetemp[j]);
							quantity[j] = Integer.parseInt(qunatitytemp[j]);
						}
						int flag = 0;
						int x = 0;
						int y = parts.length;
						for (int j = 0; j < part.length; j++) {
							for (int j2 = 0; j2 < parts.length; j2++) {
								if(parts[j2]==part[j] && quantity[j] > 0) {
									x++;
								}
								if(x == y) {
									flag = 1;
									break;
								}
							}
						}
						if(flag == 1) {
							for (int j = 0; j < part.length; j++) {
								for (int j2 = 0; j2 < parts.length; j2++) {
									if(part[j] == parts[j2]) {
										sum = sum + price[j];
									}
								}
							}
							temppriceest.add(inventory.get(i).getGm().getGarage_name());
							temppriceest.add(sum);
						}
					}
				}
				
				priceestimation.add(new ArrayList(temppriceest));
				temppriceest.clear();
				sum = 0;
			}
			
		}
		for (int j = 0; j < priceestimation.size(); j++) {
			if(priceestimation.get(j).isEmpty()) {
				priceestimation.remove(j);
			}
			
		}
		List<garageModel> glist = d.getdata("garageModel");
		for (int j = 0; j < glist.size(); j++) {
			for (int j2 = 0; j2 < priceestimation.size(); j2++) {
				for (int k = 0; k < priceestimation.get(j2).size(); k++) {
					if(glist.get(j).getGarage_name().equalsIgnoreCase(priceestimation.get(j2).get(0).toString())){
						priceestimation.get(j2).add(glist.get(j).getFeedback());
						break;
					}
				}
								
			}
		}
		m.put("vehicle_id", vehicle_id);
		m.put("parts", parts);
		m.put("estimation", priceestimation);
		return "priceestimation";
	}
	
	//Garage Admin
	
	@RequestMapping(value="garageInventory.evs",method=RequestMethod.GET)
	public String garageInventory(ModelMap m) {
		/*
		 * List<vmodelModel> temp = d.getdata("vmodelModel"); List<garageModel> gm =
		 * d.getdata("garageModel"); List<vmodelModel> vlist = new
		 * ArrayList<vmodelModel>(); for (int i = 0; i < temp.size(); i++) {
		 * if(gm.contains(temp.get(i).getVmodel_id())) { vlist.add(temp.get(i)); } }
		 */
		
		m.put("clist", d.getdata("companyModel"));
		return "garageInventory";
	}
	
	@RequestMapping(value="admingarageinventory.evs",method=RequestMethod.GET)
	public String admingarageInventory(ModelMap m) {	
		m.put("clist", d.getdata("companyModel"));
		return "admingarageinventory";
	}
	
	@RequestMapping(value="garagevehicle.evs",method=RequestMethod.GET)
	public String garageVehicle(ModelMap m, HttpSession ses) {
		int garage_id = (int) ses.getAttribute("cid");
		m.put("clist", d.getdata("companyModel"));
		List<garageVehicleModel> temp = d.getdata("garageVehicleModel");
		List<garageVehicleModel> glist = new ArrayList<garageVehicleModel>();
		for (int i = 0; i < temp.size(); i++) {
			if(temp.get(i).getGm().getGarage_id() == garage_id) {
				glist.add(temp.get(i));
			}
		}	
		m.put("vlist", glist);
		return "garagevehicle";
	}
	
	@RequestMapping(value="garageinventoryparts.evs",method=RequestMethod.GET)
	public String garageinventory(ModelMap m, HttpServletRequest request, HttpServletResponse response){
		int inv_id = 0;
		int x = 0;
		int garage_id = Integer.parseInt(request.getParameter("garage_id"));
		int vid = Integer.parseInt(request.getParameter("vehicle_id"));
		List<inventoryModel> temp = d.getdata("inventoryModel");
		List<inventoryModel> plist = new ArrayList<inventoryModel>();
		for (int i = 0; i < temp.size(); i++) {
			if(temp.get(i).getVm().getVmodel_id() == vid) {
				plist.add(temp.get(i));
			}
		}
		x = plist.size();
				
		List temp2 = new ArrayList();
		List pricet = new ArrayList();
		List quantityt = new ArrayList();
		List<garageInventoryModel> temp1 = d.getdata("garageInventoryModel");
		for (int i = 0; i < temp1.size(); i++) {
			if(temp1.get(i).getGm().getGarage_id() == garage_id && temp1.get(i).getVm().getVmodel_id() == vid) {
				temp2.add(temp1.get(i).getParts());
				pricet.add(temp1.get(i).getPrice());
				quantityt.add(temp1.get(i).getQuantity());
				inv_id = temp1.get(i).getGi_id();
			}
		}
		
		List gilist = new ArrayList();
		List price = new ArrayList();
		List quantity = new ArrayList();
	
		String s = temp2.toString().replace("[", "").replace("]", "").replace(" ", "");
		String t = pricet.toString().replace("[", "").replace("]", "").replace(" ", "");
		String u = quantityt.toString().replace("[", "").replace("]", "").replace(" ", "");
		String[] pt = s.split(",");
		String[] pr = t.split(",");
		String[] qt = u.split(",");
		for (int j = 0; j < pt.length; j++) {
			if(!pt[j].equals(",") || !pt[j].equals(" ")) {
				gilist.add(pt[j]);
				price.add(pr[j]);
				quantity.add(qt[j]);
			}
		}
		if(price.size() < x) {
			for(int i = price.size(); i < x ; i++) {
				price.add("0");
				gilist.add("0");
				quantity.add("0");
			}
				
		}
		m.put("gilist",gilist);
		m.put("gi_id",inv_id);
		m.put("pricelist",price);
		m.put("quantitylist",quantity);
		m.put("plist", plist);	
		m.put("clist", d.getdata("companyModel"));
		return "garageInventory";
	}

	@RequestMapping(value="updateinventoryparts.evs",method=RequestMethod.GET)
	public String updategarageinventory(ModelMap m, HttpServletRequest request, HttpServletResponse response){
		int inv_id = 0;
		int x = 0;
		int garage_id = Integer.parseInt(request.getParameter("garage_id"));
		int vid = Integer.parseInt(request.getParameter("vehicle_id"));
		List<inventoryModel> temp = d.getdata("inventoryModel");
		List<inventoryModel> plist = new ArrayList<inventoryModel>();
		for (int i = 0; i < temp.size(); i++) {
			if(temp.get(i).getVm().getVmodel_id() == vid) {
				plist.add(temp.get(i));
			}
		}
		x = plist.size();
				
		List temp2 = new ArrayList();
		List pricet = new ArrayList();
		List quantityt = new ArrayList();
		List<garageInventoryModel> temp1 = d.getdata("garageInventoryModel");
		for (int i = 0; i < temp1.size(); i++) {
			if(temp1.get(i).getGm().getGarage_id() == garage_id && temp1.get(i).getVm().getVmodel_id() == vid) {
				temp2.add(temp1.get(i).getParts());
				pricet.add(temp1.get(i).getPrice());
				quantityt.add(temp1.get(i).getQuantity());
				inv_id = temp1.get(i).getGi_id();
			}
		}
		
		List gilist = new ArrayList();
		List price = new ArrayList();
		List quantity = new ArrayList();
	
		String s = temp2.toString().replace("[", "").replace("]", "").replace(" ", "");
		String t = pricet.toString().replace("[", "").replace("]", "").replace(" ", "");
		String u = quantityt.toString().replace("[", "").replace("]", "").replace(" ", "");
		String[] pt = s.split(",");
		String[] pr = t.split(",");
		String[] qt = u.split(",");
		for (int j = 0; j < pt.length; j++) {
			if(!pt[j].equals(",") || !pt[j].equals(" ")) {
				gilist.add(pt[j]);
				price.add(pr[j]);
				quantity.add(qt[j]);
			}
		}
		if(price.size() < x) {
			for(int i = price.size(); i < x ; i++) {
				price.add("0");
				gilist.add("0");
				quantity.add("0");
			}
				
		}
		m.put("gilist",gilist);
		m.put("gi_id",inv_id);
		m.put("pricelist",price);
		m.put("quantitylist",quantity);
		m.put("plist", plist);	
		return "garageinventoryparts";
	}
	
	@RequestMapping(value="pendingrequest.evs",method=RequestMethod.GET)
	public String pendingRequest(ModelMap m, HttpSession ses) {
		int garage_id = (int) ses.getAttribute("cid");
		List<requestModel> rlist = d.getdata("requestModel");
		List<requestModel> requests = new ArrayList<requestModel>();
		List<inventoryModel> ilist = d.getdata("inventoryModel"); 
		List<requestpartModel> rpm = new ArrayList<requestpartModel>();
		String[] parttemp =  null; 
		List temp = new ArrayList();
		List<String> partsname = new ArrayList<String>();
		if(!rlist.isEmpty()) {
			for (int i = 0; i < rlist.size(); i++) {
				if(rlist.get(i).getSm().getGm().getGarage_id() == garage_id && rlist.get(i).isRequest_status() == false && rlist.get(i).isRequest_visibilty_status() == true) {
					requestModel rm = d.get(new requestModel(), rlist.get(i).getRequest_id());
					requests.add(rm);
					String partstring = rm.getSm().getParts().toString().replace("[", "").replace("]", "").replace(" ", "");
					parttemp = partstring.split(",");
					for (int j = 0; j < parttemp.length; j++) {
						temp.add(Integer.parseInt(parttemp[j]));
					}
					
					for (int j = 0; j < ilist.size(); j++) {
						if(temp.contains(ilist.get(j).getPart_id())) {
							partsname.add(ilist.get(j).getPart_name().toString());
						}
					}
					
					requestpartModel rmm = new requestpartModel(rm, new ArrayList(partsname));
					rpm.add(rmm);
					temp.clear();
					partsname.clear();
				}
			}
		}		
		m.put("request", rpm);
		return "pendingrequest";
	}
	
	@RequestMapping(value="acceptedrequest.evs",method=RequestMethod.GET)
	public String acceptedrequest(ModelMap m, HttpSession ses) {
		int garage_id = (int) ses.getAttribute("cid");
		List<requestModel> rlist = d.getdata("requestModel");
		List<requestModel> requests = new ArrayList<requestModel>();
		List<inventoryModel> ilist = d.getdata("inventoryModel"); 
		List<requestpartModel> rpm = new ArrayList<requestpartModel>();
		String[] parttemp =  null; 
		List temp = new ArrayList();
		List<String> partsname = new ArrayList<String>();
		if(!rlist.isEmpty()) {
			for (int i = 0; i < rlist.size(); i++) {
				if(rlist.get(i).getSm().getGm().getGarage_id() == garage_id && rlist.get(i).isRequest_status() == true && rlist.get(i).isRequest_visibilty_status() == true && rlist.get(i).isAppointment_status() == false) {
					requestModel rm = d.get(new requestModel(), rlist.get(i).getRequest_id());
					requests.add(rm);
					String partstring = rm.getSm().getParts().toString().replace("[", "").replace("]", "").replace(" ", "");
					parttemp = partstring.split(",");
					for (int j = 0; j < parttemp.length; j++) {
						temp.add(Integer.parseInt(parttemp[j]));
					}
					
					for (int j = 0; j < ilist.size(); j++) {
						if(temp.contains(ilist.get(j).getPart_id())) {
							partsname.add(ilist.get(j).getPart_name().toString());
						}
					}
					
					requestpartModel rmm = new requestpartModel(rm, new ArrayList(partsname));
					rpm.add(rmm);
					temp.clear();
					partsname.clear();
				}
			}
		}		
		m.put("request", rpm);
		return "acceptedrequest";
	}
	
	@RequestMapping(value="declinedrequest.evs",method=RequestMethod.GET)
	public String declinedrequest(ModelMap m, HttpSession ses) {
		int garage_id = (int) ses.getAttribute("cid");
		List<requestModel> rlist = d.getdata("requestModel");
		List<requestModel> requests = new ArrayList<requestModel>();
		List<inventoryModel> ilist = d.getdata("inventoryModel"); 
		List<requestpartModel> rpm = new ArrayList<requestpartModel>();
		String[] parttemp =  null; 
		List temp = new ArrayList();
		List<String> partsname = new ArrayList<String>();
		if(!rlist.isEmpty()) {
			for (int i = 0; i < rlist.size(); i++) {
				if(rlist.get(i).getSm().getGm().getGarage_id() == garage_id && rlist.get(i).isRequest_visibilty_status() == false) {
					requestModel rm = d.get(new requestModel(), rlist.get(i).getRequest_id());
					requests.add(rm);
					String partstring = rm.getSm().getParts().toString().replace("[", "").replace("]", "").replace(" ", "");
					parttemp = partstring.split(",");
					for (int j = 0; j < parttemp.length; j++) {
						temp.add(Integer.parseInt(parttemp[j]));
					}
					
					for (int j = 0; j < ilist.size(); j++) {
						if(temp.contains(ilist.get(j).getPart_id())) {
							partsname.add(ilist.get(j).getPart_name().toString());
						}
					}
					
					requestpartModel rmm = new requestpartModel(rm, new ArrayList(partsname));
					rpm.add(rmm);
					temp.clear();
					partsname.clear();
				}
			}
		}		
		m.put("request", rpm);
		return "declinedrequest";
	}
	
	@RequestMapping(value="schedulepickup.evs",method=RequestMethod.GET)
	public String schedulepickup(ModelMap m, HttpServletRequest request, HttpSession ses) throws ParseException {
		int request_id = Integer.parseInt(request.getParameter("r_id"));
		int garage_id = (int) ses.getAttribute("cid");
		String date_temp = null;
		String time_temp = null;
		int appointment_id = 0;
		java.util.Date availDate = new java.util.Date();
		java.util.Date availtime = new java.util.Date();
		
		requestModel rm = d.get(new requestModel(), request_id);
		List<employeeModel> temp = d.getdata("employeeModel");
		List<employeeModel> elist = new ArrayList<employeeModel>();
		if(!temp.isEmpty()) {
			for (int i = 0; i < temp.size(); i++) {
				if(temp.get(i).getGm().getGarage_id() == garage_id && temp.get(i).getDm().getDept_no() == 1) {
					elist.add(temp.get(i));
				}
			}
		}
		m.put("elist", elist);
		m.put("rm", rm);
		return "pickupschedule";
	}
	
	@RequestMapping(value="scheduledpickup.evs",method=RequestMethod.GET)
	public String scheduledpickup(ModelMap m, HttpServletRequest request, HttpSession ses) {
		int garage_id = (int) ses.getAttribute("cid");
		List<appointmentModel> temp_alist = d.getdata("appointmentModel");
		List<appointmentModel> alist = new ArrayList<appointmentModel>();
		if(!temp_alist.isEmpty()) {
			for (int i = 0; i < temp_alist.size(); i++) {
				if(temp_alist.get(i).getRm().getSm().getGm().getGarage_id() == garage_id && temp_alist.get(i).getRm().isAppointment_status() == true && temp_alist.get(i).getRm().getSm().isRecieved_status() == false) {
					alist.add(temp_alist.get(i));
				}	
			}
		}
		m.put("alist", alist);
		return "scheduledpickup";
	}
	
	@RequestMapping(value="assigndriver.evs",method=RequestMethod.GET)
	public String assigndriver(ModelMap m, HttpServletRequest request, HttpSession ses) {
		int garage_id = (int) ses.getAttribute("cid");
		List<appointmentModel> temp_alist = d.getdata("appointmentModel");
		List<appointmentModel> alist = new ArrayList<appointmentModel>();
		if(!temp_alist.isEmpty()) {
			for (int i = 0; i < temp_alist.size(); i++) {
				if(temp_alist.get(i).getRm().getSm().getGm().getGarage_id() == garage_id && temp_alist.get(i).getRm().isAppointment_status() == true && temp_alist.get(i).getEm() == null) {
					alist.add(temp_alist.get(i));
				}
			}
		}
		List<employeeModel> temp = d.getdata("employeeModel");
		List<employeeModel> elist = new ArrayList<employeeModel>();
		if(!temp.isEmpty()) {
			for (int i = 0; i < temp.size(); i++) {
				if(temp.get(i).getGm().getGarage_id() == garage_id && temp.get(i).getDm().getDept_no() == 1) {
					elist.add(temp.get(i));
				}
			}
		}
		m.put("elist", elist);
		m.put("alist", alist);
		return "assigndriver";
	}
	
	@RequestMapping(value="vehiclerecieved.evs",method=RequestMethod.GET)
	public String vehiclerecieved(ModelMap m, HttpServletRequest request, HttpSession ses) {
		int garage_id = (int) ses.getAttribute("cid");
		List<appointmentModel> temp_alist = d.getdata("appointmentModel");
		List<appointmentModel> alist = new ArrayList<appointmentModel>();
		if(!temp_alist.isEmpty()) {
			for (int i = 0; i < temp_alist.size(); i++) {
				if(temp_alist.get(i).getRm().getSm().getGm().getGarage_id() == garage_id && temp_alist.get(i).getRm().isAppointment_status() == true && temp_alist.get(i).getRm().getSm().isRecieved_status() == true && temp_alist.get(i).getRm().getSm().isDelivered_status() == false) {
					alist.add(temp_alist.get(i));
				}	
			}
		}
		m.put("alist", alist);
		return "vehiclerecieved";
	}
	
	@RequestMapping(value="garageemployee.evs",method=RequestMethod.GET)
	public String garageemployee(ModelMap m, HttpServletRequest request, HttpSession ses) {
		String role = (String) ses.getAttribute("role");
		List<employeeModel> elist = new ArrayList<employeeModel>();
		int garage_id = 0;
		if(role.equalsIgnoreCase("role_garage_admin")) {
			garage_id = (int) ses.getAttribute("cid");
		}
		else {
			garage_id = Integer.parseInt(request.getParameter("gid"));
		}
		List<employeeModel> temp = d.getdata("employeeModel");
		if(!temp.isEmpty()) {
			for (int i = 0; i < temp.size(); i++) {
				if(temp.get(i).getGm().getGarage_id() == garage_id) {
					elist.add(temp.get(i));
				}
			}
		}
		
		m.put("elist", elist);
		m.put("deptlist",d.getdata("departmentModel"));
		return "garageemployee";
	}
	
	@RequestMapping(value="garagecustomer.evs",method=RequestMethod.GET)
	public String garagecustomer(ModelMap m, HttpServletRequest request, HttpSession ses) {
		String role = (String) ses.getAttribute("role");
		int garage_id = 0;
		if(role.equalsIgnoreCase("role_garage_admin")) {
			garage_id = (int) ses.getAttribute("cid");
		}
		else {
			garage_id = Integer.parseInt(request.getParameter("gid"));
		}
		List<serviceModel> slist = d.getdata("serviceModel");
		List<customerModel> clist = new ArrayList<customerModel>();
		if(!slist.isEmpty()) {
			for (int i = 0; i < slist.size(); i++) {
				if(slist.get(i).getGm().getGarage_id() ==  garage_id) {
					if(clist.isEmpty()) {
						clist.add(slist.get(i).getCm());
					}
					else {
						for (int j = 0; j < clist.size(); j++) {
							if(clist.get(j).getCust_id() != slist.get(i).getCm().getCust_id()) {
								clist.add(slist.get(i).getCm());
							}
						}
					}
				}
			}
		}
		m.put("clist", clist);
		return "garagecustomer";
	}
}

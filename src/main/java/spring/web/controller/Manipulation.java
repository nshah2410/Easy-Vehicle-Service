package spring.web.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.io.Serializable;
import java.lang.annotation.Annotation;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.ServiceMode;
import javax.xml.ws.Service.Mode;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonArray;

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
import spring.model.roleModel;
import spring.model.userVehicleModel;
import spring.model.vmodelModel;
import spring.model.dao.genericDao;
import spring.model.serviceModel;
import spring.web.MailMail;

@Controller
public class Manipulation implements Serializable {

	@Autowired
	genericDao d;

	@RequestMapping(value = "manipulate_role.evs", method = RequestMethod.POST)
	public String manipulate_role(@RequestParam("action") String action, HttpServletRequest request) {

		switch (action) {

		case "addrole": {
			String role = request.getParameter("role");
			roleModel rm = new roleModel(role);
			d.insert(rm);
			break;
		}

		case "editrole": {
			int id = Integer.parseInt(request.getParameter("id"));
			String role = request.getParameter("role");
			roleModel rm = new roleModel(id, role);
			d.update(rm);
			break;
		}

		case "deleterole": {
			int id = Integer.parseInt(request.getParameter("id"));
			d.delete(new roleModel(id));
			break;
		}

		default:
			break;
		}
		return "role";
	}
	
	@RequestMapping(value = "manipulate_profile.evs", method = RequestMethod.POST)
	public String manipulate_profile(@RequestParam("action") String action, HttpServletRequest request) {
		switch (action) {
		case "customer_profile": {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			String email = request.getParameter("email_id");
			long mobile_no = Long.parseLong(request.getParameter("mobile_no"));
			String address = request.getParameter("address");
			String gender = request.getParameter("gender");
			String role = request.getParameter("role");
			int user_id = Integer.parseInt(request.getParameter("user_id"));
			String password = request.getParameter("password");
			loginModel lm = new loginModel(user_id, email, password, role);
			customerModel cm = new customerModel(id, name, email.toLowerCase(), mobile_no, address, gender, lm);
			d.update(cm);
			break;
		}
		case "admin_profile":{
			String email = request.getParameter("email_id");
			int user_id = Integer.parseInt(request.getParameter("user_id"));
			String password = request.getParameter("password");
			String role = request.getParameter("role");
			loginModel lm = new loginModel(user_id, email, password, role);
			d.update(lm);
			break;
		}
		
		}
		return "index";
	}

	@RequestMapping(value = "manipulate_customer.evs", method = RequestMethod.POST)
	public String manipulate_customer(@RequestParam("action") String action, HttpServletRequest request) {
		ApplicationContext AC = new ClassPathXmlApplicationContext("Spring-Mail.xml");
		MailMail mm = (MailMail) AC.getBean("mailMail");
		switch (action) {

		case "addcustomer": {
			String name = request.getParameter("name");
			String email = request.getParameter("email_id");
			long mobile_no = Long.parseLong(request.getParameter("mobile_no"));
			String address = request.getParameter("address");
			String gender = request.getParameter("gender");
			loginModel lm = new loginModel(email, email, "ROLE_CUSTOMER");
			customerModel cm = new customerModel(name, email.toLowerCase(), mobile_no, address, gender, lm);
			d.insert(cm);
			/*
			 * mm.sendMail("nshah2410@gmail.com", email, "Welcome to Easy Vehicle Service",
			 * "Dear " + name +
			 * ", \n\nThank you for registrating. Given below are your login details.\n\n <B>Username:</B>"
			 * + email + "\n\nYour Password is: " + email);
			 */
			break;
		}

		case "editcustomer": {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			String email = request.getParameter("email_id");
			long mobile_no = Long.parseLong(request.getParameter("mobile_no"));
			String address = request.getParameter("address");
			String gender = request.getParameter("gender");
			String role = request.getParameter("role");
			int user_id = Integer.parseInt(request.getParameter("user_id"));
			String password = request.getParameter("password");
			loginModel lm = new loginModel(user_id, email, password, role);
			customerModel cm = new customerModel(id, name, email, mobile_no, address, gender, lm);
			d.update(cm);
			/*
			 * mm.sendMail("nshah2410@gmail.com", email, "Profile Updated", "Dear " + name +
			 * ", \n\nYour Details have been updated.Given below are your login details.\n\n Username: "
			 * + email + "\n\nYour Password is: " + password);
			 */
			break;
		}

		case "deletecustomer": {
			int id = Integer.parseInt(request.getParameter("id"));
			d.delete(new customerModel(id));
			break;
		}

		case "signup": {
			String name = request.getParameter("name");
			String email = request.getParameter("email_id");
			long mobile_no = Long.parseLong(request.getParameter("mobile_no"));
			String password = request.getParameter("password");
			loginModel lm = new loginModel(email, password, "ROLE_CUSTOMER");
			customerModel cm = new customerModel(name, email.toLowerCase(), mobile_no, lm);
			d.insert(cm);
			/*
			 * mm.sendMail("nshah2410@gmail.com", email, "Welcome to Easy Vehicle Service",
			 * "Dear " + name +
			 * ", \n\nThank you for registrating. Given below are your login details.\n\n <B>Username:</B>"
			 * + email + "\n\nYour Password is: " + email);
			 */
			break;
		}

		default:
			break;
		}
		return "customer";
	}

	@RequestMapping(value = "manipulate_department.evs", method = RequestMethod.POST)
	public String manipulate_department(@RequestParam("action") String action, HttpServletRequest request) {

		switch (action) {

		case "adddept": {
			String name = request.getParameter("dept");
			departmentModel dm = new departmentModel(name);
			d.insert(dm);
			break;
		}

		case "editdept": {
			int id = Integer.parseInt(request.getParameter("id"));
			String dept = request.getParameter("dept");
			departmentModel dm = new departmentModel(id, dept);
			d.update(dm);
			break;
		}

		case "deletedept": {
			int id = Integer.parseInt(request.getParameter("id"));
			d.delete(new departmentModel(id));
			break;
		}

		default:
			break;
		}
		return "department";
	}

	@RequestMapping(value = "manipulate_employee.evs", method = RequestMethod.POST)
	public String manipulate_employee(@RequestParam("action") String action, HttpServletRequest request) {

		switch (action) {

		case "addemployee": {
			String name = request.getParameter("name");
			String email = request.getParameter("email_id");
			long mobile_no = Long.parseLong(request.getParameter("mobile_no"));
			String gender = request.getParameter("gender");
			int garage_id = Integer.parseInt(request.getParameter("garage_id"));
			int department = Integer.parseInt(request.getParameter("department"));
			departmentModel dm = d.get(new departmentModel(), department);
			loginModel lm = new loginModel(email, email, "ROLE_EMPLOYEE");
			garageModel gm = d.get(new garageModel(), garage_id);
			employeeModel em = new employeeModel(name, email.toLowerCase(), mobile_no, gender, dm, lm, gm);
			d.insert(em);
			break;
		}

		case "editemployee": {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			String email = request.getParameter("email_id");
			long mobile_no = Long.parseLong(request.getParameter("mobile_no"));
			int dept_no = Integer.parseInt(request.getParameter("department"));
			String gender = request.getParameter("gender");
			String role = request.getParameter("role");
			int garage_id = Integer.parseInt(request.getParameter("garage_id"));
			int user_id = Integer.parseInt(request.getParameter("user_id"));
			String password = request.getParameter("password");
			departmentModel dm = d.get(new departmentModel(), dept_no);
			loginModel lm = new loginModel(user_id, email, password, role);
			garageModel gm = d.get(new garageModel(), garage_id);
			employeeModel em = new employeeModel(id, name, email.toLowerCase(), mobile_no, gender, dm, lm, gm);
			d.update(em);
			break;
		}

		case "deleteemployee": {
			int id = Integer.parseInt(request.getParameter("id"));
			d.delete(new employeeModel(id));
			break;
		}

		default:
			break;
		}
		return "employee";
	}

	@RequestMapping(value = "manipulate_company.evs", method = RequestMethod.POST)
	public String manipulate_company(@RequestParam("action") String action, HttpServletRequest request) {

		switch (action) {

		case "addcompany": {
			String company = request.getParameter("company");
			companyModel cm = new companyModel(company);
			d.insert(cm);
			break;
		}

		case "editrole": {
			int id = Integer.parseInt(request.getParameter("id"));
			String role = request.getParameter("role");
			roleModel rm = new roleModel(id, role);
			d.update(rm);
			break;
		}

		case "deletecompany": {
			int vehicle_id = Integer.parseInt(request.getParameter("id"));
			d.delete(new companyModel(vehicle_id));
			break;
		}

		default:
			break;
		}
		return "role";
	}

	@RequestMapping(value = "manipulate_vehicle_model.evs", method = RequestMethod.POST)
	public String manipulate_vehicle_model(@RequestParam("action") String action, HttpServletRequest request) {

		switch (action) {

		case "addvehiclemodel": {
			String name = request.getParameter("model_name");
			int year = Integer.parseInt(request.getParameter("year"));
			int id = Integer.parseInt(request.getParameter("company_id"));
			companyModel cm = d.get(new companyModel(), id);
			vmodelModel vm = new vmodelModel(name, year, cm);
			d.insert(vm);
			break;
		}

		case "editvehiclemodel": {
			int id = Integer.parseInt(request.getParameter("id"));
			String dept = request.getParameter("dept");
			departmentModel dm = new departmentModel(id, dept);
			d.update(dm);
			break;
		}

		case "deletevehiclemodel": {
			int id = Integer.parseInt(request.getParameter("id"));
			d.delete(new vmodelModel(id));
			break;
		}

		default:
			break;
		}
		return "department";
	}

	@RequestMapping(value = "manipulate_addcustomervehicle.evs", method = RequestMethod.GET)
	public void manipulate_addcustomervehicle(@RequestParam("action") String action, HttpServletResponse response,
			HttpServletRequest request, ModelMap m) throws IOException {
		PrintWriter out = response.getWriter();
		switch (action) {
		case "getcompanymodel":
			
			response.setHeader("Content-Type", "text/html");
			int cid = Integer.parseInt(request.getParameter("cid"));
			
			companyModel vlist = d.get(new companyModel(), cid);
			List<vmodelModel> vehiclelist = vlist.getVm();
			ObjectMapper obj = new ObjectMapper();
			String vehicle = obj.writeValueAsString(vehiclelist);
			out.print(vehicle);
			
			break;
		
		}
		
	}

	@RequestMapping(value = "manipulate_garage.evs", method = RequestMethod.GET)
	public void get_manipulate_garage(@RequestParam("action") String action, HttpServletResponse response,
			HttpServletRequest request, ModelMap m) throws IOException, JSONException {

		switch (action) {
		case "getarea": {
			PrintWriter out = response.getWriter();
			int cid = Integer.parseInt(request.getParameter("cityid"));
			cityModel cm = d.get(new cityModel(), cid);
			List<areaModel> arealist = cm.getAm();

			ObjectMapper obj = new ObjectMapper();
			String area = obj.writeValueAsString(arealist);
			
			out.print(area);
			break;
		}
		case "getgarage": {
			PrintWriter out = response.getWriter();
			int area_id = Integer.parseInt(request.getParameter("area_id"));
			areaModel am = d.get(new areaModel(), area_id);
			List<garageModel> temp = d.getdata("garageModel");
			List<garageModel> glist = new ArrayList<garageModel>();
			if (!temp.isEmpty()) {
				for (int i = 0; i < temp.size(); i++) {
					if(temp.get(i).getAm().getArea_id() == area_id) {
						glist.add(temp.get(i));
					}	
				}
			}

			ObjectMapper obj = new ObjectMapper();
			String garage = obj.writeValueAsString(glist);
			
			out.print(garage);
			break;
		}
		}

	}
	@RequestMapping(value = "manipulate_garage.evs", method = RequestMethod.POST)
	public void manipulate_garage(@RequestParam("action") String action, HttpServletResponse response,
			HttpServletRequest request, ModelMap m) throws IOException, JSONException {
		ApplicationContext AC = new ClassPathXmlApplicationContext("Spring-Mail.xml");
		MailMail mm = (MailMail) AC.getBean("mailMail");
		switch (action) {
		case "addgarage": {
			
			PrintWriter out = response.getWriter();
			String  garagename = request.getParameter("garage_name");
			String email_id = request.getParameter("email_id");
			String address = request.getParameter("address");
			int city_id = Integer.parseInt(request.getParameter("city"));
			int area_id = Integer.parseInt(request.getParameter("area"));
			long mobile_no = Long.parseLong(request.getParameter("mobile_no"));
			
			areaModel am = d.get(new areaModel(), area_id);
			cityModel cm = d.get(new cityModel(), city_id);
			loginModel lm = new loginModel(email_id, email_id, "ROLE_GARAGE_ADMIN");
			garageModel gm = new garageModel(garagename, email_id, mobile_no, address, cm, am, lm);
			d.update(gm);
			/*
			 * mm.sendMail("nshah2410@gmail.com", email_id,
			 * "Welcome to Easy Vehicle Service", "Dear " + garagename +
			 * ", \n\nThank you for registrating. Given below are your login details.\n\n <B>Username:</B>"
			 * + email_id + "\n\nYour Password is: " + email_id);
			 */
			out.print("Garage Registerd Successfully");
			break;
		}
		case "editgarage":
		{
			PrintWriter out = response.getWriter();
			int garage_id = Integer.parseInt(request.getParameter("garage_id"));
			String  garagename = request.getParameter("garage_name");
			String email_id = request.getParameter("email_id");
			String address = request.getParameter("address");
			int city_id = Integer.parseInt(request.getParameter("city_id"));
			int area_id = Integer.parseInt(request.getParameter("area_id"));
			long mobile_no = Long.parseLong(request.getParameter("mobile_no"));
			int login_id = Integer.parseInt(request.getParameter("login_id"));
			float feedback = Float.parseFloat(request.getParameter("feedback"));
			areaModel am = d.get(new areaModel(), area_id);
			cityModel cm = d.get(new cityModel(), city_id);
			loginModel lm = d.get(new loginModel(), login_id);
			garageModel gm = new garageModel(garage_id, garagename, email_id, mobile_no, address, feedback, cm, am, lm);
			d.update(gm);;
			out.print("Garage Registerd Successfully");
			break;
		}
		}

	}

	@RequestMapping(value = "manipulate_city.evs", method = RequestMethod.POST)
	public String manipulate_city(@RequestParam("action") String action, HttpServletRequest request) {

		switch (action) {
		case "addcity": {
			String city = request.getParameter("city");
			cityModel cm = new cityModel(city);
			d.insert(cm);
			break;
		}
		case "editcity": {
			String city = request.getParameter("city");
			int id = Integer.parseInt(request.getParameter("id"));
			cityModel cm = new cityModel(id, city);
			d.update(cm);
			break;
		}
		case "removecity": {
			int id = Integer.parseInt(request.getParameter("id"));
			cityModel cm = new cityModel(id);
			d.delete(cm);
			break;
		}
		case "addarea": {
			String area = request.getParameter("area_name");
			int pincode = Integer.parseInt(request.getParameter("pincode"));
			int cityid = Integer.parseInt(request.getParameter("city_id"));
			cityModel cm = new cityModel(cityid);
			areaModel am = new areaModel(pincode, area, cm);
			d.insert(am);
			break;
		}
		case "removearea": {
			int id = Integer.parseInt(request.getParameter("id"));
			areaModel am = new areaModel(id);
			d.delete(am);
			break;
		}
		}
		return "city";
	}
	
	@RequestMapping(value = "manipulate_inventory_part.evs", method = RequestMethod.POST)
	public void manipulate_inventory_part(@RequestParam("action") String action, HttpServletRequest request,HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter(); 
		switch (action) {
		case "addpart": {
			String part = request.getParameter("part");
			int vehicle = Integer.parseInt(request.getParameter("vehicle"));
			vmodelModel vm = d.get(new vmodelModel(), vehicle);
			inventoryModel im = new inventoryModel(part, vm);
			d.update(im);
			
			List<inventoryModel> temp = d.getdata("inventoryModel");
			List<inventoryModel> plist = new ArrayList<inventoryModel>();
			for (int i = 0; i < temp.size(); i++) {
				if(temp.get(i).getVm().getVmodel_id() == vehicle) {
					plist.add(temp.get(i));
				}
			}
			ObjectMapper obj = new ObjectMapper();
			String parts = obj.writeValueAsString(plist);
			out.print(parts);
			break;
		}
		case "getparts":
		{
			int vid = Integer.parseInt(request.getParameter("vid"));
			List<inventoryModel> temp = d.getdata("inventoryModel");
			List<inventoryModel> plist = new ArrayList<inventoryModel>();
			for (int i = 0; i < temp.size(); i++) {
				if(temp.get(i).getVm().getVmodel_id() == vid) {
					plist.add(temp.get(i));
				}
			}
			ObjectMapper obj = new ObjectMapper();
			String parts = obj.writeValueAsString(plist);
			out.print(parts);
			break;
		}
		case "editparts":
		{
			String part = request.getParameter("part");
			int id = Integer.parseInt(request.getParameter("id"));
			int vid = Integer.parseInt(request.getParameter("vehicle"));
			vmodelModel vm = d.get(new vmodelModel(), vid);
			inventoryModel im = new inventoryModel(id, part, vm);
			d.update(im);
			List<inventoryModel> temp = d.getdata("inventoryModel");
			List<inventoryModel> plist = new ArrayList<inventoryModel>();
			for (int i = 0; i < temp.size(); i++) {
				if(temp.get(i).getVm().getVmodel_id() == vid) {
					plist.add(temp.get(i));
				}
			}
			ObjectMapper obj = new ObjectMapper();
			String parts = obj.writeValueAsString(plist);
			out.print(parts);
			
			break;
		}
		
		case "deletepart":
		{
			int id = Integer.parseInt(request.getParameter("id"));
			inventoryModel im = new inventoryModel(id);
			int vid = Integer.parseInt(request.getParameter("vid"));
			d.delete(im);
			List<inventoryModel> temp = d.getdata("inventoryModel");
			List<inventoryModel> plist = new ArrayList<inventoryModel>();
			for (int i = 0; i < temp.size(); i++) {
				if(temp.get(i).getVm().getVmodel_id() == vid) {
					plist.add(temp.get(i));
				}
			}
			ObjectMapper obj = new ObjectMapper();
			String parts = obj.writeValueAsString(plist);
			out.print(parts);
		}
		}
	}

	@RequestMapping(value = "search_customer.evs", method = RequestMethod.GET)
	public void search_customer(HttpServletRequest request, ModelMap m, HttpServletResponse response)
			throws IOException {
		PrintWriter out = response.getWriter();
		response.setHeader("Content-Type", "text/html");

		String data = request.getParameter("search");

		out.print("XYZABC");
	}

	@RequestMapping(value = "manipulate_privilege.evs", method = RequestMethod.POST)
	public String manipulate_privilege(@RequestParam("action") String action, @RequestParam("id") int id,
			HttpServletRequest request) {
		switch (action) {

		case "addprivilege": {
			String privilege_name = request.getParameter("privilege");
			privilegeModel pm = new privilegeModel(privilege_name);
			d.insert(pm);
		}

		case "editprivilege": {
			String privilege_name = request.getParameter("privilege");
			privilegeModel pm = new privilegeModel(id, privilege_name);
			d.update(pm);
			break;
		}

		case "deleteprivilege": {
			d.delete(new privilegeModel(id));
			break;
		}

		default:
			break;
		}

		return "privilege";
	}
	
	
	//Customer Side
	
	@RequestMapping(value = "manipulate_add_vehicle.evs", method = RequestMethod.POST)
	public void manipulate_add_vehicle(@RequestParam("action") String action, HttpServletRequest request, ModelMap m, HttpServletResponse response)
			throws IOException {
		
		switch(action) {
		case "addcustomervehicle":
		{
			String vehicle_no = request.getParameter("registration_no");
			int vehicle_model = Integer.parseInt(request.getParameter("vehiclemodel"));
			int cust_id = Integer.parseInt(request.getParameter("customer_id"));
			vmodelModel vm = d.get(new vmodelModel(), vehicle_model);
			customerModel cm = d.get(new customerModel(), cust_id);
			userVehicleModel uvm = new userVehicleModel(vehicle_no, cm, vm);
			d.update(uvm);
			break;
		}
		}
	}
	
	@RequestMapping(value = "send_request.evs", method = RequestMethod.POST)
	public void send_request(HttpServletRequest request, ModelMap m, HttpServletResponse response,HttpSession ses)
			throws IOException {
		PrintWriter out = response.getWriter();
		response.setHeader("Content-Type", "text/html");
		
		String garage_name = request.getParameter("Garage_name");
		int customer_id = (int) ses.getAttribute("cid");
		String[] temp_parts =  request.getParameterValues("parts[]");
		int final_price = 0;
		int vehicle_id = Integer.parseInt(request.getParameter("vehicle_id"));
		int garage_id = 0;
		List parts = new ArrayList();
		List part_price = new ArrayList();
		for (int i = 0; i < temp_parts.length; i++) {
			parts.add(temp_parts[i]);
		}
		
		List<garageInventoryModel> glist = d.getdata("garageInventoryModel");
		for (int i = 0; i < glist.size(); i++) {
			if(glist.get(i).getGm().getGarage_name().equals(garage_name)) {
				garage_id = glist.get(i).getGm().getGarage_id();	
			}
			if(garage_id == glist.get(i).getGm().getGarage_id() && glist.get(i).getVm().getVmodel_id() == vehicle_id) {
				garageInventoryModel gm = d.get(new garageInventoryModel(), glist.get(i).getGi_id());
				String pricestring = gm.getPrice().toString().replace("[", "").replace("]", "").replace(" ", "");
				String partstring = gm.getParts().toString().replace("[", "").replace("]", "").replace(" ", "");
				String[] parttemp = partstring.split(",");
				String[] pricetemp = pricestring.split(",");
				int[] price = new int[pricetemp.length];
				for (int j = 0; j < pricetemp.length; j++) {
					price[j] = Integer.parseInt(pricetemp[j]);
				}
				for (int j = 0; j < parttemp.length; j++) {
					if(parts.contains(parttemp[j])) {
						part_price.add(price[j]);
						final_price = final_price + price[j];
					}
					
				}
			}
		}
		userVehicleModel uvm = new userVehicleModel();
		List<userVehicleModel> vehiclelist = d.getdata("userVehicleModel");
		for (int i = 0; i < vehiclelist.size(); i++) {
			if(vehiclelist.get(i).getVm().getVmodel_id() == vehicle_id) {
				uvm = d.get(new userVehicleModel(),  vehiclelist.get(i).getUv_id());
			}
		}
		
		customerModel cm = d.get(new customerModel(), customer_id);
		garageModel gm = d.get(new garageModel(), garage_id);
		final_price = ((final_price*18) / 100) + final_price; 
		serviceModel sm = new serviceModel(part_price.toString(), parts.toString(), final_price, gm, uvm, cm);
		requestModel rm = new requestModel(false, true, false, sm);
		d.insert(rm);
		out.print("Request Sent Successfully");
	}
	
	@RequestMapping(value = "send_garage_request.evs", method = RequestMethod.POST)
	public String send_garage_request(HttpServletRequest request, ModelMap m, HttpServletResponse response,HttpSession ses)
			throws IOException, ParseException {
	
		PrintWriter out = response.getWriter();
		response.setHeader("Content-Type", "text/html");
		
		int garage_id = Integer.parseInt(request.getParameter("garage_id"));
		int customer_id = (int) ses.getAttribute("cid");
		String[] temp_parts =  request.getParameterValues("parts");
		int vehicle_id = Integer.parseInt(request.getParameter("vehicle_id"));
		int final_price = 0;
		List parts = new ArrayList();
		List part_price = new ArrayList();
		
		String date_temp = request.getParameter("mydate");
		String time_temp = request.getParameter("mytime");
		
		SimpleDateFormat availDate = new SimpleDateFormat("yyyy-MM-dd");
		Date date = availDate.parse(date_temp);
		
		SimpleDateFormat availtime = new SimpleDateFormat("HH:mm");
		Date time = availtime.parse(time_temp);
		
		for (int i = 0; i < temp_parts.length; i++) {
			parts.add(temp_parts[i]);
		}
		
		List<garageInventoryModel> glist = d.getdata("garageInventoryModel");
		for (int i = 0; i < glist.size(); i++) {
			if(garage_id == glist.get(i).getGm().getGarage_id() && glist.get(i).getVm().getVmodel_id() == vehicle_id) {
				garageInventoryModel gm = d.get(new garageInventoryModel(), glist.get(i).getGi_id());
				String pricestring = gm.getPrice().toString().replace("[", "").replace("]", "").replace(" ", "");
				String partstring = gm.getParts().toString().replace("[", "").replace("]", "").replace(" ", "");
				String[] parttemp = partstring.split(",");
				String[] pricetemp = pricestring.split(",");
				int[] price = new int[pricetemp.length];
				for (int j = 0; j < pricetemp.length; j++) {
					price[j] = Integer.parseInt(pricetemp[j]);
				}
				for (int j = 0; j < parttemp.length; j++) {
					if(parts.contains(parttemp[j])) {
						part_price.add(price[j]);
						final_price = final_price + price[j];
					}
					
				}
			}
		}
		userVehicleModel uvm = new userVehicleModel();
		List<userVehicleModel> vehiclelist = d.getdata("userVehicleModel");
		for (int i = 0; i < vehiclelist.size(); i++) {
			if(vehiclelist.get(i).getVm().getVmodel_id() == vehicle_id) {
				uvm = d.get(new userVehicleModel(),  vehiclelist.get(i).getUv_id());
			}
		}
		
		customerModel cm = d.get(new customerModel(), customer_id);
		garageModel gm = d.get(new garageModel(), garage_id);
		serviceModel sm = new serviceModel(date, null, part_price.toString(), parts.toString(), final_price, false, false, gm, uvm, cm);
		/*
		 * d.insert(sm); int sid= 0; List<serviceModel> slist =
		 * d.getdata("serviceModel"); if(!slist.isEmpty()) { for (int i = 0; i <
		 * slist.size(); i++) { if(slist.get(i).getParts().equals(sm.getParts()) &&
		 * slist.get(i).getGm() == sm.getGm() && slist.get(i).getCm() == sm.getCm() ) {
		 * sid = slist.get(i).getService_id(); } } } serviceModel sm1 = d.get(new
		 * serviceModel(), sid);
		 */
		requestModel rm = new requestModel(false, true, true, sm);
		appointmentModel am = new appointmentModel(date, time, null, rm);
		d.insert(am);
		return "dashboard";
	}

	// Garage Admin Side
	
	@RequestMapping(value = "manipulate_garage_vehicle.evs", method = RequestMethod.POST)
	public void manipulate_garage_vehicle(@RequestParam("action") String action, HttpServletRequest request, ModelMap m, HttpServletResponse response)
			throws IOException {
		PrintWriter out = response.getWriter();
		ObjectMapper obj = new ObjectMapper();
		switch(action) {
		case "addvehicle":
		{
			int vehicle_model = Integer.parseInt(request.getParameter("model"));
			int garage_id = Integer.parseInt(request.getParameter("garage_id"));
			vmodelModel vm = d.get(new vmodelModel(), vehicle_model);
			garageModel gm = d.get(new garageModel(), garage_id);
			garageVehicleModel gvm = new garageVehicleModel(vm, gm);
			d.update(gvm);
			break;
		}
		case "getvehicle":
		{
			int company_id = Integer.parseInt(request.getParameter("id"));
			int garage_id = Integer.parseInt(request.getParameter("garage_id"));
			List<garageVehicleModel> glist = d.getdata("garageVehicleModel");
			List<vmodelModel> vlist = new ArrayList<vmodelModel>();
			for (int i = 0; i < glist.size(); i++) {
				if(glist.get(i).getGm().getGarage_id() == garage_id && glist.get(i).getVm().getCm().getCompany_id() == company_id) {
					vlist.add(glist.get(i).getVm());
				}
			}
			
			String vehicle = obj.writeValueAsString(vlist);
			out.print(vehicle);
			break;
		}
		case "deletevehicle":
		{
			
			break;
		}
		}
	}
	
	@RequestMapping(value = "manipulate_garage_inventory_part.evs", method = RequestMethod.POST)
	public void manipulate_inventory_part(@RequestParam("action") String action, HttpServletRequest request, ModelMap m, HttpServletResponse response)
			throws IOException {
		PrintWriter out = response.getWriter();
		ObjectMapper obj = new ObjectMapper();
		switch(action) {
		case "addpdetails":{
			String[] tprice = request.getParameterValues("price");
			String[] tquantity = request.getParameterValues("quantity");
			String[] tparts = request.getParameterValues("part");
			int gi_id = Integer.parseInt(request.getParameter("gi_id"));
			int garage = Integer.parseInt(request.getParameter("garage_id"));
			int vehicle = Integer.parseInt(request.getParameter("Model"));
			
			List<String> price = new ArrayList<String>();
			List<String> quantity = new ArrayList<String>();
			List<String> part = new ArrayList<String>();
			
			for (int i = 0; i < tparts.length; i++) {
				if(tprice[i].equals("") || tquantity[i].equals("")) {
					price.add("0");
					quantity.add("0");
				}
				else {
					quantity.add(tquantity[i]);
					price.add(tprice[i]);					
				}
				part.add(tparts[i]);
			}
			
			vmodelModel vm = d.get(new vmodelModel(), vehicle);
			garageModel gm = d.get(new garageModel(), garage);
			garageInventoryModel gim = new garageInventoryModel(gi_id, price.toString(), quantity.toString(), part.toString(), vm, gm);
			d.update(gim);
			break;
		}
		}
	}
	
	@RequestMapping(value = "manipulate_request.evs", method = RequestMethod.POST)
	public void manipulate_request(@RequestParam("action") String action, HttpServletRequest request, ModelMap m, HttpServletResponse response)
			throws IOException {
		
		int request_id = Integer.parseInt(request.getParameter("id"));
		switch(action) {
		case "accept_request":
		{
			requestModel rm1 = d.get(new requestModel(), request_id);
			requestModel rm = new requestModel(request_id, true, true, rm1.isAppointment_status(), rm1.getSm()); 
			d.update(rm);
			break;
		}
		case "decline_request":
		{
			requestModel rm1 = d.get(new requestModel(), request_id);
			requestModel rm = new requestModel(request_id, false, false, false, rm1.getSm());
			d.update(rm);
			break;
		}
		}
	}

	

	@RequestMapping(value = "manipulate_feedback.evs", method = RequestMethod.POST)
	public void manipulate_feedback(@RequestParam("action") String action, HttpServletRequest request, ModelMap m, HttpServletResponse response)
			throws IOException {
		
		int service_id = Integer.parseInt(request.getParameter("service_id"));
		switch(action) {
		case "submit_feedback":
		{
			float feedback = Float.parseFloat(request.getParameter("feedback"));
			serviceModel sm = d.get(new serviceModel(), service_id);
			garageModel gm = d.get(new garageModel(), sm.getGm().getGarage_id());
			float temp = sm.getGm().getFeedback() ;
			if(temp == 0) {
				temp = feedback;
			}
			else {
				temp = (temp + feedback) / 2;
			}
			gm.setFeedback(temp);
			sm.setFeedback_status(true);
			d.update(sm);
			d.update(gm);
			break;
		}
		}
	}
	
	@RequestMapping(value = "book_appointment.evs", method = RequestMethod.POST)
	public void book_appointment(HttpServletRequest request, ModelMap m, HttpServletResponse response)
			throws IOException, ParseException {
		int mechanic_id = Integer.parseInt(request.getParameter("mechanic_id"));
		String date_temp = request.getParameter("mydate");
		String time_temp = request.getParameter("mytime");
		int request_id = Integer.parseInt(request.getParameter("request_id"));
		
		SimpleDateFormat availDate = new SimpleDateFormat("yyyy-MM-dd");
		Date date = availDate.parse(date_temp);
		
		SimpleDateFormat availtime = new SimpleDateFormat("HH:mm");
		Date time = availtime.parse(time_temp);
		
		employeeModel em = d.get(new employeeModel(), mechanic_id);
		requestModel rm = d.get(new requestModel(), request_id);
		rm.setAppointment_status(true);
		d.update(rm);
		appointmentModel am = new appointmentModel(date, time, em, rm);
		d.insert(am);
	}
	
	@RequestMapping(value = "scheduled_appointment.evs", method = RequestMethod.POST)
	public void scheduled_appointment(@RequestParam("action") String action, HttpServletRequest request, ModelMap m, HttpServletResponse response)
			throws IOException, ParseException {
		switch (action) {
		case "vehicle_recieved":
		{
			int request_id = Integer.parseInt(request.getParameter("request_id"));
			requestModel rm = d.get(new requestModel(), request_id);
			serviceModel sm = d.get(new serviceModel(), rm.getSm().getService_id());
			sm.setRecieved_status(true);
			DateFormat df = new SimpleDateFormat("dd-MMM-yyyy");
			java.util.Date service_date = new java.util.Date();
			sm.setService_date(service_date);
			d.update(sm);
			break;
		}
		case "vehicle_delivered":{
			int request_id = Integer.parseInt(request.getParameter("request_id"));
			requestModel rm = d.get(new requestModel(), request_id);
			serviceModel sm = d.get(new serviceModel(), rm.getSm().getService_id());
			sm.setDelivered_status(true);
			DateFormat df = new SimpleDateFormat("dd-MMM-yyyy");
			java.util.Date delivered_date = new java.util.Date();
			sm.setDelivery_date(delivered_date);
			d.update(sm);
			
			// Quantity Decrement
			String spart = sm.getParts().toString().replace("[", "").replace("]", "").replace(" ", "");
			String[] tempparts = spart.split(",");
			int[] parts = new int[tempparts.length];
			for (int i = 0; i < parts.length; i++) {
				
				parts[i] = Integer.parseInt(tempparts[i]);
				System.out.println("parts: " + parts[i]);
			}
			
			List<String> finalparts = new ArrayList<String>();
			List<Integer> final_quantity = new ArrayList<Integer>();
			List<inventoryModel> invmodel = d.getdata("inventoryModel");
			List<garageInventoryModel> inventory = d.getdata("garageInventoryModel");
			String[] pricetemp = null;
			String[] quantitytemp = null;
			int[] partint = null , quantityint = null;
			if(!invmodel.isEmpty()) {
				for (int i = 0; i < invmodel.size(); i++) {
					for (int k1 = 0; k1 < inventory.size(); k1++) {
					if(inventory.get(k1).getGm().getGarage_id() == sm.getGm().getGarage_id()) { 
						if(inventory.get(k1).getVm().getVmodel_id() == sm.getUvm().getVm().getVmodel_id()) {							
							String partsstring = inventory.get(k1).getParts().replace("[", "").replace("]", "").replace(" ", "");
							String quantitystring = inventory.get(k1).getQuantity().replace("[", "").replace("]", "").replace(" ", "");
							pricetemp = partsstring.split(",");
							quantitytemp = quantitystring.split(",");
							partint = new int[pricetemp.length];
							quantityint = new int[pricetemp.length];
							for (int j = 0; j < pricetemp .length; j++) {
								partint[j] = Integer.parseInt(pricetemp[j]);
								quantityint[j] = Integer.parseInt(quantitytemp[j]);
							}
						}
					}
				}
				}
			}
			/*
			 * for (int j2 = 0; j2 < parts.length; j2++) { for (int j = 0; j <
			 * quantityint.length; j++) { if(parts[j2] == partint[j]){ quantityint[j]--;
			 * System.out.println("Quantity-"+quantityint[j]);
			 * final_quantity.add(quantityint[j]); } else{
			 * final_quantity.add(quantityint[j]); } } }
			 */
			
			for (int i = 0; i < quantityint.length; i++) {
				for (int j = 0; j < parts.length; j++) {
					if(partint[i] == parts[j]) {
						quantityint[i]--;
						System.out.println("Parts int: "+partint[i]);
						System.out.println("Quantity-"+quantityint[i]);
						final_quantity.add(quantityint[i]);
						break;
					}
					else {
						System.out.println("Else Quantity-"+quantityint[i]);
						final_quantity.add(quantityint[i]);
						break;
					}
				}
			}
			System.out.println(final_quantity);
			break;
		}
		case "assign_driver":
		{
			int appointment_id = Integer.parseInt(request.getParameter("appointment_id"));
			int emp_id = Integer.parseInt(request.getParameter("emp_id"));
			employeeModel em = d.get(new employeeModel(), emp_id);
			appointmentModel am = d.get(new appointmentModel(), appointment_id);
			appointmentModel am1 = new appointmentModel(appointment_id, am.getDate(), am.getTime_slot(), em, am.getRm());
			System.out.println(am1.getAppointment_id());
			System.out.println(am1.getEm().getEmp_id());
			d.update(am1);
			break;
		}

		default:
			break;
		}
	}
}

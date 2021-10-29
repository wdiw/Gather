package com.Gather.Sponsorship.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.Base64;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.Gather.Sponsorship.model.SponsorshipBean;
import com.Gather.Sponsorship.service.SponsorshipService;
import com.google.gson.Gson;

@Controller
public class SponsorshipController {

	SponsorshipService sponsorshipService;
	ServletContext servletContext;

	@Autowired
	public SponsorshipController(SponsorshipService sponsorshipService, ServletContext servletContext) {
		this.sponsorshipService = sponsorshipService;
		this.servletContext = servletContext;
	}

	@GetMapping("/addorder")
	public String addJsp(Model model) {
		return "Sponsorship/addOrder";

	}

	@GetMapping("/redirectAll")
	public String redirectrders() {
		return "redirect:/orders";

	}

	@GetMapping("/test")
	public String test() {
		return "Sponsorship/index";
	}

	// 查詢所有訂單

	@GetMapping("/orders")
	public String list(Model model) {
		List<SponsorshipBean> sBeans = sponsorshipService.getOrders();
		model.addAttribute("orders", sBeans);
		return "Sponsorship/orders";
	}

	// 查單筆
	@GetMapping("/order/{sID}")
	public String order(@PathVariable("sID") Integer sID, Model model) {
		SponsorshipBean sBean = sponsorshipService.getOrderByID(sID);
		model.addAttribute("sBean", sBean);
		return "Sponsorship/updateOrder";
	}

	// 新增訂單

	@PostMapping("/orders")
	@ResponseBody
	public ResponseEntity<String> getAddNewOrderForm(@Valid @RequestParam("sName") String sName,
			@RequestParam("sPID") int sPID, @RequestParam("sPName") String sPName, @RequestParam("sAmount") int sAmount,
			@RequestParam(required = false, name = "projectImage") MultipartFile photo) throws IOException {
		byte[] image = new byte[1024];
		InputStream is = photo.getInputStream();
		ByteArrayOutputStream baos = new ByteArrayOutputStream();

		int length;
		while ((length = is.read(image)) != -1) {
			baos.write(image, 0, length);
		}

		image = baos.toByteArray();
		String base64String = Base64.getEncoder().encodeToString(image);
		SponsorshipBean sBean = new SponsorshipBean(sName, sPID, sPName, sAmount, image, base64String);
		sponsorshipService.insertOrder(sBean);
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return ResponseEntity.ok().headers(responseHeaders).body(new Gson().toJson(sBean));
	}

//	@PostMapping("/orders")
//	@ResponseBody
//	public ResponseEntity<String> getAddNewOrderForm(@RequestParam("sName") String sName,
//			@RequestParam("sPID") int sPID, @RequestParam("sPName") String sPName, @RequestParam("sAmount") int sAmount,
//			@RequestParam(required = false, name = "projectImage") MultipartFile photo,@ModelAttribute SponsorshipBean sBean1,BindingResult bindingResult) throws IOException {
//		byte[] image = new byte[1024];
//		InputStream is = photo.getInputStream();
//		ByteArrayOutputStream baos = new ByteArrayOutputStream();
//
//		int length;
//		while ((length = is.read(image)) != -1) {
//			baos.write(image, 0, length);
//		}
//
//		image = baos.toByteArray();
//		String base64String = Base64.getEncoder().encodeToString(image);
//		SponsorshipBean sBean = new SponsorshipBean(sName, sPID, sPName, sAmount, image, base64String);
//		new SponsorshipValidator().validate(sBean1, bindingResult);
//		if(bindingResult.hasErrors()) {
//			return ResponseEntity.status(HttpStatus.CREATED).body(sBean.getsName());
//		}
//		else {
//			sponsorshipService.insertOrder(sBean);
//			HttpHeaders responseHeaders = new HttpHeaders();
//			responseHeaders.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
//			responseHeaders.add("Content-Type", "application/json; charset=utf-8");
//			return ResponseEntity.ok().headers(responseHeaders).body(new Gson().toJson(sBean));
//			
//		}
		
//	}

	// 刪除訂單

	@DeleteMapping("/order/delete/{sID}")
	@ResponseBody
	public ResponseEntity<String> getDeleteNewOrderForm(@PathVariable("sID") int sID) {
		sponsorshipService.deleteOrderByOrderID(sID);
		return new ResponseEntity<String>(HttpStatus.OK);
	}

//	@PostMapping("/order/{sID}")
//	@ResponseBody
//	public ResponseEntity<String> addUpdateOrderInfo(@PathVariable("sID") int sID,
//			@RequestParam("sName") String sName,
//			@RequestParam("sPID") int sPID,
//			 
//			 @RequestParam("sPName") String sPName,
//			  
//			 @RequestParam("sAmount") int sAmount,
//			  
//			  @RequestParam(required = false, name = "projectImage") MultipartFile photo
//			  )
//			{
//		System.out.println("郭童童");
//		System.out.println(sName);
//		System.out.println(sPID);
//		System.out.println(sPName);
//		System.out.println(sAmount);
//		System.out.println(photo);
//		return new ResponseEntity<String>(HttpStatus.OK);
//	}

	// 修改訂單

	@PostMapping("/order/{sID}")

	@ResponseBody
	public ResponseEntity<String> addUpdateOrderInfo(@PathVariable("sID") int sID,

			@RequestParam("sName") String sName,

			@RequestParam("sPID") int sPID,

			@RequestParam("sPName") String sPName,

			@RequestParam("sAmount") int sAmount,

			@RequestParam(required = false, name = "projectImage") MultipartFile photo) throws IOException {

		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!");

		byte[] image = new byte[1024];
		if (photo.isEmpty()) {
			SponsorshipBean sBean = sponsorshipService.getOrderByID(sID);
			image = sBean.getImage();
		} else {
			InputStream is = photo.getInputStream();
			ByteArrayOutputStream baos = new ByteArrayOutputStream();

			int length;
			while ((length = is.read(image)) != -1) {
				baos.write(image, 0, length);
			}

			image = baos.toByteArray();
		}

		String base64String = Base64.getEncoder().encodeToString(image);
		SponsorshipBean sBean = new SponsorshipBean(sID, sName, sPID, sPName, sAmount, base64String, image);

		sponsorshipService.updateOrder(sBean);
		return new ResponseEntity<String>(HttpStatus.OK);

	}

	// 圖片從資料庫輸出

	@GetMapping("/getPicture/{sID}")
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer sID) {
		HttpHeaders headers = new HttpHeaders();

		SponsorshipBean sBean = sponsorshipService.getOrderByID(sID);
		byte[] image = sBean.getImage();

		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(image, headers, HttpStatus.OK);
		return responseEntity;
	}

}
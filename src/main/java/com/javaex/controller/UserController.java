package com.javaex.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.UserService;
import com.javaex.vo.JsonResultVo;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	private UserService userService;

	// 로그인폼
	@RequestMapping(value = "/loginForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginForm() {
		System.out.println("UserController/loginForm()");

		return "user/loginForm";
	}

	// 로그인
	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(@ModelAttribute UserVo userVo, HttpSession session) {
		System.out.println("UserController/login()");

		UserVo authUser = userService.login(userVo);

		session.setAttribute("authUser", authUser);

		return "redirect:/";
	}

	// 회원가입
	@RequestMapping(value = "/join", method = { RequestMethod.GET, RequestMethod.POST })
	public String join(@ModelAttribute UserVo userVo) {
		System.out.println("UserController>join()");
		System.out.println(userVo);
		
		int count = userService.join(userVo);

		return "user/joinOk";
	}

	
	
	
	// 회원가입폼
	@RequestMapping(value = "/joinForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String joinForm() {
		System.out.println("UserController>joinForm()");

		return "user/joinForm";
	}
	
	//idcheck
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = { RequestMethod.GET, RequestMethod.POST })
	public JsonResultVo idCheck(@RequestParam(value="id") String id) {
		System.out.println("UserController>idCheck()");

		//true 사용가능,  false 사용불가
		boolean check = userService.idCheck(id);
		System.out.println(check);
	
		JsonResultVo jsonResultVo = new JsonResultVo();
		jsonResultVo.success(check);
			
		
		return jsonResultVo;
	}
	
	
	

	
	

}

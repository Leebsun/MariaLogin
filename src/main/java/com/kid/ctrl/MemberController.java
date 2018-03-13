package com.kid.ctrl;

import java.lang.ProcessBuilder.Redirect;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;

import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kid.member.MemberDTO;
import com.kid.member.MemberService;


@Controller
@RequestMapping(value="/member/*")
public class MemberController {
	
	@Inject
	private MemberService memberService;
	

//일반회원 아이디 체크
	@RequestMapping(value="memberIdCheck")
	public ModelAndView memberIdCheck(String checkId, ModelAndView mv) throws Exception {
		String result = "";
		if(checkId.equals(""))
		{
			result = "아이디를 입력해주세요.";
		}
		else
		{
			result = memberService.memberIdCheck(checkId);			
		}
		
		mv.addObject("result", result);
		mv.setViewName("common/ajax");
		
		return mv;
	}
	
//일반회원 회원가입 GET
	@RequestMapping(value="memberJoin", method=RequestMethod.GET)
	public ModelAndView memberJoin(MemberDTO memberDTO, ModelAndView mv, HttpSession session) throws Exception {

		mv.addObject("menuTitle", "회원가입");
		mv.setViewName("member/memberJoin");
		
		return mv;
	}
//일반회원 회원가입 POST
	@RequestMapping(value="memberJoin", method=RequestMethod.POST)
	public String memberJoin(MemberDTO memberDTO, RedirectAttributes rd, HttpSession session) throws Exception {
		
		rd = memberService.memberJoin(memberDTO, rd, session);	
		System.out.println(memberDTO.getName());
		
		return "redirect:/";
	}
//일반회원 로그인	
	@RequestMapping(value="memberLogin")
	public String memberLogin(MemberDTO memberDTO, HttpSession session, RedirectAttributes rd) {
		String message = "로그인 실패";
		
		try {
			memberDTO = memberService.memberLogin(memberDTO);
	
		} catch(Exception e) {
			memberDTO = null;
		
			e.printStackTrace();
		}
		
		if(memberDTO != null)
		{
			message = "로그인 성공";
			
			session.setAttribute("member", memberDTO);
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:/";
	}
	
//로그아웃
	@RequestMapping(value="memberLogout")
	public String logout(RedirectAttributes rd, HttpSession session) throws Exception {
		
			session.invalidate();
	
		
		return "redirect:/";
	}
	

}


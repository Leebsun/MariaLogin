package com.kid.member;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Service
public class MemberService {

	@Inject
	private MemberDAO memberDAO;

	
//일반회원 selectOne
	public MemberDTO selectOne(int member_seq) throws Exception {

		return memberDAO.selectOne(member_seq);
	}
	
//일반회원 아이디 체크
	public String memberIdCheck(String checkId) throws Exception {
		
		String id = "";
		
		try{
			id = memberDAO.memberIdCheck(checkId);			
		}
		catch(Exception e){
			e.printStackTrace();
			id = "";
		}
		String result = "사용 가능한 아이디입니다.";
		
		if(checkId.equals(id))
		{
			result = "이미 가입된 아이디입니다.";
		}
		
		return result;
	}
	
//일반회원 JOIN
	public RedirectAttributes memberJoin(MemberDTO memberDTO, RedirectAttributes rd, HttpSession session) throws Exception {
	
		//DB member에 데이터 삽입
		int result = memberDAO.memberJoin(memberDTO);
		String message = "회원가입 실패";
		
		//DB upload에 데이터 삽입 & 실제 업로드
		
		
		if(result > 0)
		{
			message = "회원가입 성공";
		}
	
		
		rd.addFlashAttribute("message", message);
		
		return rd;
	}
//일반회원 LOGIN
	public MemberDTO memberLogin(MemberDTO memberDTO) throws Exception {
		
		memberDTO = memberDAO.memberLogin(memberDTO);
		
		
		
		
		return memberDTO;
		
	}

	
//state Update
	public int stateUpdate(MemberDTO memberDTO) throws Exception {
		
		return memberDAO.stateUpate(memberDTO);
	}
	

	
}

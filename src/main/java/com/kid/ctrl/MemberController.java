package com.kid.ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/member/*")
public class MemberController {
	
	@RequestMapping(value="memberJoin", method=RequestMethod.GET)
	public String memberJoin(){
		return "member/memberJoin";
	}

}

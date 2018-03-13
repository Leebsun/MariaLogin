package com.kid.ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/kid/*")
public class KidController {
	
	@RequestMapping(value="face")
	public String memberIdCheck() throws Exception{
		return "kid/kid";
	}

}

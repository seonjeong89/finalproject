package com.lms.hexa.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import com.lms.hexa.dto.ManagerVO;

public class ManagerLoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler{
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {
		
		Manager manager = (Manager)authentication.getDetails();	
		ManagerVO loginUser = manager.getManagerVO();  
		HttpSession session = request.getSession();		
		session.setAttribute("loginUser", loginUser);
		session.setAttribute("category", "m");
		session.setMaxInactiveInterval(60*30);
		
		super.onAuthenticationSuccess(request, response, authentication);
	}
	
}

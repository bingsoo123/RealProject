package icia.oap.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class LoginSuccessHandler implements AuthenticationSuccessHandler{
	
	public void onAuthenticationSuccess(HttpServletRequest req, HttpServletResponse res, Authentication auth) throws IOException , ServletException{
		
		List<String> roleNames = new ArrayList<>();
		
		auth.getAuthorities().forEach(authority ->{
			roleNames.add(authority.getAuthority());
		});
		
		if(roleNames.contains("ROLE_ADMIN")) {
			
			System.out.println("관리자님 로그인성공");
			res.sendRedirect("/admin");
			return;
			
		}
		
		if(roleNames.contains("ROLE_MEMBER")) {
			
			System.out.println("알바생님 로그인성공");
			res.sendRedirect("/member");
			return;
			
		}
		
		res.sendRedirect("/");
		
	}
	
}

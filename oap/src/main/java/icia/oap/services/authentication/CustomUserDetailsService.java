package icia.oap.services.authentication;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import icia.oap.beans.MemberVO;
import icia.oap.mapper.MemberMapper;
import icia.oap.security.domain.CustomUser;
import lombok.Setter;

public class CustomUserDetailsService implements UserDetailsService{

	
	@Setter(onMethod_ = {@Autowired})
	private MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		
		System.out.println("Load User By UserName :" + userName);
		
		//userName means userid
		MemberVO vo = memberMapper.read(userName);
		
		System.out.println("queried by member mapper :" + vo);
		
		return vo == null ? null : new CustomUser(vo);
		
	}
	
}

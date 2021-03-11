package icia.oap.spring;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class DBCPTest {
	
	@Setter(onMethod_ = {@Autowired})
	private DataSource data;
	
	@Setter(onMethod_ = {@Autowired})
	private PasswordEncoder pwdEncoder;
	
	
	
	
	@Test
	public void insMember() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		/* 패스워드 암호화 사용자 등록 */
		String sql = "INSERT INTO MN(MN_CODE,MN_ID,MN_PW,MN_NAME,MN_PHONE,MN_GENDER,MN_EMAIL,MN_BIRTH) VALUES(?,?,?,?,?,?,?,?)";
		// String sql = "INSERT INTO AB(AB_CODE,AB_ID,AB_PW,AB_NAME,AB_PHONE,AB_BIRTH,AB_ADDR,AB_EMAIL,AB_GENDER) VALUES (?,?,?,?,?,?,?,?,?)";
		try {
			conn = data.getConnection();
			pstmt = conn.prepareStatement(sql);
			/* 패스워드 암호화 사용자 등록 */
			/* MEMBER 
			pstmt.setString(1, "zzang");
			pstmt.setString(2, pwdEncoder.encode("1234"));
			pstmt.setString(3, "짱짱");
			*/
			
			// 관리자
			pstmt.setString(1, "10000002");
			pstmt.setString(2, "MANAGER2");
			pstmt.setString(3, pwdEncoder.encode("aabbcc"));
			pstmt.setString(4, "잘난관리자");
			pstmt.setString(5, "01094361500");
			pstmt.setString(6, "M");
			pstmt.setString(7, "dhpq@naver.com");
			pstmt.setString(8, "19700814");
			
			
			/* MEMBER 
			pstmt.setString(1, "100000010");
			pstmt.setString(2, "MEM");
			pstmt.setString(3, pwdEncoder.encode("aabbcc"));
			pstmt.setString(4, "알바생이에요");
			pstmt.setString(5, "01068491023");
			pstmt.setString(6, "F");
			pstmt.setString(7, "ZZPQWM@naver.com");
			pstmt.setString(8, "19991014");*/

			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null) {try{pstmt.close();}catch(Exception e) {}}
			if(conn != null) {try{conn.close();}catch(Exception e) {}}
		}
	}
	
	

}

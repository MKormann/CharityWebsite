/*
 * JDBC implementation of UserDAO
 */

package user.dao.impl;

import java.util.ArrayList;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

import user.dao.UserDAO;
import user.model.User;
import user.model.UserRegForm;

public class JdbcUserDAO implements UserDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private SimpleJdbcCall infoCall;
	private SimpleJdbcCall createCall;
	
	public JdbcUserDAO() {
		
	}
	
	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.infoCall = new SimpleJdbcCall(dataSource).withProcedureName("getUserInfo");
		this.createCall = new SimpleJdbcCall(dataSource).withProcedureName("createNewUser");
	}

	public User getUserByUsername(String username) {
		SqlParameterSource source = new MapSqlParameterSource()
			.addValue("USER_NAME", username);
		Map<String, Object> map = infoCall.execute(source);
		User user = new User();
		user.setUsername(username);
		user.setId((Integer)map.get("user_id"));
		user.setFirstName((String)map.get("first_name"));
		user.setLastName((String)map.get("last_name"));
		user.setEmail((String)map.get("user_email"));
		if (map.get("team_id") != null) user.setTeamId((Integer)map.get("team_id"));
		user.setDonation((Double)map.get("user_donation"));
		return user;
	}

	public boolean addUser(UserRegForm userRegForm) {
		if (!checkUnique(userRegForm.getUsername(), userRegForm.getEmail())) return false;
		else {
			SqlParameterSource source = new MapSqlParameterSource()
			.addValue("USER_NAME", userRegForm.getUsername())
			.addValue("USER_PASSWORD", userRegForm.getPassword())
			.addValue("FIRST_NAME", userRegForm.getFirstName())
			.addValue("LAST_NAME", userRegForm.getLastName())
			.addValue("USER_EMAIL", userRegForm.getEmail());
			createCall.execute(source);
			return true;
		}
	}
	
	public User verifyAndRetrieve(String username, String password) {
		Integer i = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM login WHERE userName = ? AND password = ?", 
				Integer.class, username, password);
		if (i == 1) {
			return getUserByUsername(username);
		}
		else return null;
		
	}
	
	public boolean checkUnique(String username, String email) {
		if (jdbcTemplate.queryForObject("SELECT COUNT(*) FROM login WHERE username = ?", 
				Integer.class, username) != 0) return false;
		if (jdbcTemplate.queryForObject("SELECT COUNT(*) FROM userinfo WHERE email = ?", 
				Integer.class, email) != 0) return false;
		else return true;
	}
	
	public boolean updatePassword(String userName, String oldPassword, String newPassword) {
		User user = verifyAndRetrieve(userName, oldPassword);
		if (user != null) {
			jdbcTemplate.update("UPDATE login SET password = ? WHERE id = ?", newPassword, user.getId());
			return true;
		}
		return false;
	}
	
	public UserDetails loadUserByUsername(String username) {
		String password = jdbcTemplate.queryForObject("SELECT password FROM login WHERE username = ?", String.class, username);	
		UserDetails ud = new org.springframework.security.core.userdetails.User(username, password, 
				new ArrayList<GrantedAuthority>(){{add(new SimpleGrantedAuthority("ROLE_USER"));}});
		return ud;

	}
}

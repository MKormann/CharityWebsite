package main.config;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ImportResource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Repository;

import user.dao.UserDAO;
import user.dao.impl.JdbcUserDAO;
import donations.dao.DonationDAO;
import donations.dao.impl.JdbcDonationDAO;

@Repository
@ImportResource("classpath:/database/jdbc-config.xml")
public class JdbcConfig {
	
	@Value("${url}")
	private String url;
	
	@Value("${username}")
	private String username;

	@Value("${password}")
	private String password;
	
	@Value("${driverClassName}")
	private String driverClassName;
	
	@Bean
	public DataSource dataSource() {
		try {
			Class.forName("com.mysql.jdbc.Driver");		
			return new DriverManagerDataSource(url, username, password);
		}
		catch (ClassNotFoundException e) {
			throw new RuntimeException(e);
		}
	}
	
	@Bean
	public JdbcTemplate jdbcTemplate() {
		return new JdbcTemplate(dataSource());
	}
	
	@Bean
	public UserDAO userDao() {
		return new JdbcUserDAO();
	}
	
	@Bean
	public DonationDAO donationDao() {
		return new JdbcDonationDAO();
	}
}

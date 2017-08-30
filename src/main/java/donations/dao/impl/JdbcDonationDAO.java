/*
 * Jdbc implementation of DonationDAO
 */

package donations.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import donations.dao.DonationDAO;
import donations.model.Donation;

public class JdbcDonationDAO implements DonationDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public JdbcDonationDAO() {
		
	}
	
	public List<Donation> getTeamDonations(int id) {
		return jdbcTemplate.query("SELECT CONCAT(firstName, ' ', lastName) AS name, donation FROM userinfo WHERE teamId = ? ORDER BY donation DESC", 
									new Object[]{id}, new DonationMapper());
	}
	
	public List<Donation> getTopTeams() {
		return jdbcTemplate.query("SELECT teamName AS name, donation FROM teamTotals ORDER BY donation DESC LIMIT 10", 
									new DonationMapper());
	}
	
	//Row Mapper class to map donations
	private static final class DonationMapper implements RowMapper<Donation> {
		
		public Donation mapRow(ResultSet rs, int rowNum) throws SQLException {
			Donation donation = new Donation();
			donation.setName(rs.getString("name"));
			donation.setDonation(rs.getDouble("donation"));
			return donation;
		}
	}
}

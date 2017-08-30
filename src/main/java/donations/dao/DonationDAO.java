package donations.dao;

import java.util.List;

import donations.model.Donation;

public interface DonationDAO {

	/*
	 * Retrieve a list of an entire team's names and donation amounts
	 */
	public List<Donation> getTeamDonations(int id);
	
	/*
	 * Retrieve a list of all teams' total donations
	 */
	public List<Donation> getTopTeams();
	
}

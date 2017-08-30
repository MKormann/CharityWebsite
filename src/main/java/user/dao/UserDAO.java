/*
 * Interface for classes to access User information
 */

package user.dao;

import org.springframework.security.core.userdetails.UserDetailsService;

import user.model.User;
import user.model.UserRegForm;

public interface UserDAO extends UserDetailsService {
	
	/*
	 * Search for and retrieve user by ID number
	 */
	public User getUserByUsername(String username);
	
	/*
	 * Register new user
	 */
	public boolean addUser(UserRegForm userRegForm);
	
	/*
	 * Verify login via username and password and return user
	 */
	public User verifyAndRetrieve(String username, String password);
	
	/*
	 * Checks if given username and email are unique among registered users
	 */
	public boolean checkUnique(String username, String email);
	
	/*
	 * Update user password
	 */
	public boolean updatePassword(String username, String oldPassword, String newPassword);
}

/**
 * 
 */

function comparePass(p1, p2) {
	if (p1.val() != p2.val()) {
		return "Passwords must match.";
	} else {
		return " ";
	}
}
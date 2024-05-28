package altia.bilbomatica.portalparticipate.websocket.beans;

import java.io.Serializable;

public class Users implements Serializable {
	
	// Attributes.
	private static final long serialVersionUID = 566903014380263125L;
	private static Users instance = null;
	private String userName;
	private String userEmail;

	// Constructors.
	private Users() {
	}

	public static synchronized Users getInstance() {
		if (instance == null) {
			instance = new Users();
		}
		return instance;
	}

	// Getters.
	public String getUserName() {
		return userName;
	}

	public String getUserEmail() {
		return userEmail;
	}
	
	// Setters.
	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
}

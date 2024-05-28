package altia.bilbomatica.portalparticipate.websocket.service;

import java.io.IOException;

public interface CommunityService {

	// Forces to implement the getMessageAuthor.
	public void getMessageAuthor(String query);
	
	// Forces to implement the writeMessageHistory.
	public void writeMessageHistory(String messageForCustomer) throws IOException;
	
	// Forces to implement the readMessageHistory.
	public void readMessageHistory() throws IOException;

}

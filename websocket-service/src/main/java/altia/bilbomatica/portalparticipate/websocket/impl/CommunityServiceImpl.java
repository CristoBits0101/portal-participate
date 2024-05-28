package altia.bilbomatica.portalparticipate.websocket.impl;

import java.util.ArrayList;
import java.util.List;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.BufferedReader;
import java.io.FileReader;

import org.apache.juli.logging.Log;
import org.apache.juli.logging.LogFactory;

import altia.bilbomatica.portalparticipate.websocket.beans.Users;
import altia.bilbomatica.portalparticipate.websocket.chat.CommunityChat;
import altia.bilbomatica.portalparticipate.websocket.service.CommunityService;

public class CommunityServiceImpl implements CommunityService {
	
	// Instantiate an object of the Log class to handle errors.
	private static final Log log = LogFactory.getLog(CommunityChat.class);
	
	// Almacena todos los mensajes 
    private static List<String> messagesToPublish = new ArrayList<>();
	
	// File path where client messages are stored.
	private static final String FILE_PATH = "C:\\magnolia\\03_Workspaces\\ide\\message_history.txt";

	// Constructors.
	public CommunityServiceImpl() {
	}

	// Implement the getMessageAuthor of publications according to query.
	public void getMessageAuthor(String query) {

		// Instances.
		Users user = Users.getInstance();

		// Checks if the query is not null and is not empty.
		if (query != null && !query.isEmpty()) {

			// Splits the query into an array of parameters separated by '&'.
			String[] params = query.split("&");

			// Go through the URI parameters.
			for (String param : params) {

				// If the array contains userName at the current position.
				if (param.contains("userName=")) {

					// We divide the string based on equals.
					String[] data = param.split("=");

					// Verify that the new array has at least 2 elements when splitting the string.
					if (data.length == 2)
						user.setUserName(data[1].substring(0, 1).toUpperCase() + data[1].substring(1).toLowerCase());
				}

				// If the array contains userEmail at the current position.
				if (param.contains("userEmail=")) {

					// We divide the string based on equals.
					String[] data = param.split("=");

					// Verify that the new array has at least 2 elements when splitting the string.
					if (data.length == 2)
						user.setUserEmail(data[1].toLowerCase());
				}
			}
		}
	}

	// Save customer messages.
	public void writeMessageHistory(String messageForCustomer) throws IOException {
		try {
	        FileWriter fileWriter = new FileWriter(FILE_PATH, true);
	        PrintWriter printWriter = new PrintWriter(fileWriter);
	        printWriter.print(messageForCustomer);
	        printWriter.println();
	        printWriter.close();
		} catch (IOException e) {
			log.debug("The message could not be sent to the client.", e);
		}
	}
	
	// Load customer messages.
	public void readMessageHistory() throws IOException {
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine())!= null) {
                messagesToPublish.add(line);
            }
        } catch (IOException e) {
            log.debug("Error reading the content of the file: ", e);
        }
	}
	
	// Send customer messages.
    @SuppressWarnings("unused")
	public static void sendAllMessages() { 
        for (String message : messagesToPublish) {
        	message += " #FileMessage#";
        	CommunityChat.publishMessage(message);
        }
	        // Empties the list after all messages are sent..
	        messagesToPublish.clear();
    }
}

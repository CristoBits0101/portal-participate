package altia.bilbomatica.portalparticipate.websocket.chat;

import java.io.IOException;

import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.apache.juli.logging.Log;
import org.apache.juli.logging.LogFactory;

import altia.bilbomatica.portalparticipate.websocket.beans.Users;
import altia.bilbomatica.portalparticipate.websocket.impl.CommunityServiceImpl;

@ServerEndpoint(value = "/community/chat")
public class CommunityChat {

	// Instantiate an object of the Log class to handle errors.
	private static final Log log = LogFactory.getLog(CommunityChat.class);

	// Stores a collection of unique connections.
	private static final Set<CommunityChat> connections = new CopyOnWriteArraySet<>();

	// Attribute that stores the WebSocket session.
	private Session websocketSession;

	// Attribute that stores the user's nickname.
	private Users user;
	private static CommunityServiceImpl communityServiceImpl;

	// Empty constructor of the class.
    public CommunityChat() {
    	user = Users.getInstance();
    	communityServiceImpl = new CommunityServiceImpl();
    }

	// Establishes WebSocket connection when client window opens.
	@OnOpen
	public void startConnection(Session session) throws IOException {

		// Create a websocket session by opening the browser window that contains the entpoint in the URL.
		this.websocketSession = session;

		// Add a session for the client.
		connections.add(this);
		
		// We pass the messageForCustomer to the controller.
		communityServiceImpl.readMessageHistory();
		
		// Send all loaded messages.
		CommunityServiceImpl.sendAllMessages();

		// Extract the query from the current URL to get the parameters passed in the request.
		String query = session.getRequestURI().getQuery();
		
		// We pass the query to the controller.
		communityServiceImpl.getMessageAuthor(query);

	    // Message construction only if user values ​​are set.
	    if (user.getUserName()!= null && user.getUserEmail()!= null) {
	        String message = user.getUserName() + " " + user.getUserEmail() + " connected";
	        publishMessage(message);
	    } else {
	        // Handle the case where user data is not available.
	        log.error("User data not established.");
	    }
	}

	// Closes WebSocket connection when client window closes.
	@OnClose
	public void endConnection() {
		
		// Remove the user session.
		connections.remove(this);
		
		// We call the function that is responsible for sending messages to the client.
		String message = user.getUserName() + " " + user.getUserEmail() + " " + "disconnected";
		publishMessage(message);
	}

	// It receives and delivers messages bidirectional.
	@OnMessage
	public void handleMessage(String message) {
		publishMessage(message);
	}

	// It handles errors.
	@OnError
	public void onError(Throwable t) throws Throwable {
	    log.error("Chat Error: " + t.toString(), t);
	}

	// Send all messages to the client.
	public static void publishMessage(String messageForCustomer) {
		for (CommunityChat connection : connections) {
			try {
	            
	            // Send messages to clients.
				synchronized (connection) {
					if (connection.websocketSession.isOpen()) {
						
						// Clear messages to clients.
						if (messageForCustomer.contains("#FileMessage#")) {
							String cleanedMessage = messageForCustomer.replace("#FileMessage#", "");
							connection.websocketSession.getBasicRemote().sendText(cleanedMessage);
						} else {
							connection.websocketSession.getBasicRemote().sendText(messageForCustomer);
						}	
					}
				}
				
				// If it does not contain, we pass messageForCustomer to the controller.
				if (!messageForCustomer.contains("#FileMessage#"))
			        communityServiceImpl.writeMessageHistory(messageForCustomer);

			} catch (IOException e) {
				log.debug("The message could not be sent to the client.", e);
			}
		}
	}
}

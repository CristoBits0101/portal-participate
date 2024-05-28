package altia.bilbomatica.portal.participate.forum.rest;

import altia.bilbomatica.portal.participate.forum.beans.Comment;
import altia.bilbomatica.portal.participate.forum.service.CommentService;

public class CommentEndpoint implements CommentService {
	
	// Forces to implement the createComment.
	public boolean createComment(Comment commentDetails) {
		return false;
	}

	// Forces to implement the updateComment.
	public boolean updateComment(Comment commentDetails, String uuid) {
		return false;
	}

	// Forces to implement the deleteComment.
	public boolean deleteComment(String uuid) {
		return false;
	}
	
}

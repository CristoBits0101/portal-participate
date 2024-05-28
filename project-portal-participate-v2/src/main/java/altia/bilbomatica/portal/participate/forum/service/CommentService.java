package altia.bilbomatica.portal.participate.forum.service;

import altia.bilbomatica.portal.participate.forum.beans.Comment;

public interface CommentService {

	// Forces to implement the createComment.
	public boolean createComment(Comment commentDetails);

	// Forces to implement the updateComment.
	public boolean updateComment(Comment commentDetails, String uuid);

	// Forces to implement the deleteComment.
	public boolean deleteComment(String uuid);
	
}

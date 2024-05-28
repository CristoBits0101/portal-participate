package altia.bilbomatica.portal.participate.forum.beans;

public class Comment {
	
	// Attributes.
	private String commentVisitor;
	private String comment;

	// Constructors.
	public Comment() {
		
	}

    public Comment(String commentVisitor, String comment) {
        this.setCommentVisitor(commentVisitor);
        this.setComment(comment);
    }

	// Getters.
	public String getCommentVisitor() {
		return commentVisitor;
	}

	public String getComment() {
		return comment;
	}

	// Setters.
	public void setCommentVisitor(String commentVisitor) {
		this.commentVisitor = commentVisitor;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
}

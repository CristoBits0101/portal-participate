package altia.bilbomatica.portal.participate.forum.beans;

public class Post {

	// Attributes.
	private String postAuthor;
	private String title;
	private String message;

	// Constructors.
	public Post() {
	}

    public Post(String postAuthor, String title, String message) {
        this.postAuthor = postAuthor;
        this.title = title;
        this.message = message;
    }

	// Getters.
	public String getPostAuthor() {
		return postAuthor;
	}

	public String getTitle() {
		return title;
	}

	public String getMessage() {
		return message;
	}

	// Setters.
	public void setPostAuthor(String postAuthor) {
		this.postAuthor = postAuthor;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}

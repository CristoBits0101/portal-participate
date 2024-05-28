package altia.bilbomatica.portal.participate.forum.service;

import altia.bilbomatica.portal.participate.forum.beans.Post;

public interface PostsService {

	// Forces to implement the store of publications according to postDetails.
	public boolean storePost(Post postDetails);

	// Forces to implement the modify of publications according to their identification and postDetails.
	public boolean modifyPost(Post postDetails, String uuid);

	// Forces to implement the deletion of publications according to their identification.
	public boolean destroyPost(String uuid);

}

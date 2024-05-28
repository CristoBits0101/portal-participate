package altia.bilbomatica.portal.participate.forum.impl;

import altia.bilbomatica.portal.participate.forum.beans.*;
import altia.bilbomatica.portal.participate.forum.service.PostsService;
import javax.jcr.RepositoryException;
import javax.jcr.Session;
import javax.jcr.Node;
import info.magnolia.context.MgnlContext;

public class PostsServiceImpl implements PostsService {

	/*
	 * Try to save a new post.
	 * 
	 * @return boolean.
	 */
	@Override
	public boolean storePost(Post postDetails) {
		
		try {

			// 1. Access a workspace with javax.jcr.Session.
			Session session = MgnlContext.getJCRSession("forum");

			// 2. We get the root node of the workspace.
			Node rootNode = session.getRootNode();

			// 3. We create a new node.
			int index = 1;
			
			// 4. If the knot exists we increase it.
	        while (rootNode.hasNode("Post_" + index)) {
	            index++;
	        }
			
	        // 5. We add the node.
			Node postNode = rootNode.addNode("Post_" + index, "forum");

			// 6. Add the properties to the node.
			postNode.setProperty("postAuthor", postDetails.getPostAuthor());
			postNode.setProperty("title", postDetails.getTitle());
			postNode.setProperty("message", postDetails.getMessage());

			// 7. We store the node in the JCR.
			rootNode.getSession().save();

			// 8. We return with a boolean that the operation has completed successfully.
			return true;

		} catch (RepositoryException e) {

			// We return the unsuccessful operation using a boolean.
			return false;

		}
	}

	/*
	 * Try modifying a post by its by its uuid.
	 * 
	 * @return boolean.
	 */
	@Override
	public boolean modifyPost(Post postDetails, String uuid) {
		
		try {

			// 1. Access a workspace with javax.jcr.Session.
			Session session = MgnlContext.getJCRSession("forum");

			// 2. We obtain the node of the post that the user wants to update.
			Node postNode = session.getNodeByIdentifier(uuid);

			// 3. Add the properties to the node.
			postNode.setProperty("postAuthor", postDetails.getPostAuthor());
			postNode.setProperty("title", postDetails.getTitle());
			postNode.setProperty("message", postDetails.getMessage());

			// 4. We store the node in the JCR.
			postNode.getSession().save();

			// 5. We return with a boolean that the operation has completed successfully.
			return true;

		} catch (RepositoryException e) {

			// We return the unsuccessful operation using a boolean.
			return false;

		}
	}

	/*
	 * Try deleting a post by its by its uuid.
	 * 
	 * @return boolean.
	 */
	public boolean destroyPost(String uuid) {
		
		try {

			// 1. Access a workspace with javax.jcr.Session.
			Session session = MgnlContext.getJCRSession("forum");

			// 2. We obtain the node of the post that the user wants to delete.
			Node nod = session.getNodeByIdentifier(uuid);

			// 3. We check that there has been no error when obtaining the node.
			if (nod == null)
				return false;

			// 4. We delete the node.
			nod.remove();

			// 5. Get a session from a node and save changes.
			nod.getSession().save();

			// 6. We close session of workspace forum.
			session.save();

			// 7. We return with a boolean that the operation has completed successfully.
			return true;

		} catch (RepositoryException e) {

			// We return the unsuccessful operation using a boolean.
			return false;

		}
	}
}

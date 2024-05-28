package altia.bilbomatica.portal.participate.forum.rest;

import altia.bilbomatica.portal.participate.forum.beans.*;
import altia.bilbomatica.portal.participate.forum.impl.*;

//Magnolia dependencies for managing endpoints.
import info.magnolia.rest.AbstractEndpoint;
import info.magnolia.rest.EndpointDefinition;

//Dependencies to create a rest service.
import javax.ws.rs.Path;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.DELETE;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("/posts/v1")
public class PostsEndpoint<D extends EndpointDefinition> extends AbstractEndpoint<D> {

	// Instances.
	PostsServiceImpl post = new PostsServiceImpl();
	CommnetServiceImpl commnet = new CommnetServiceImpl();

	public PostsEndpoint(D endpointDefinition) {
		super(endpointDefinition);
	}

	/*
	 * CREATE
	 * 
	 * http://localhost:8080/magnoliaAuthor/.rest/posts/v1/store/
	 * http://localhost:8080/magnoliaPublic/.rest/posts/v1/store/
	 * 
	 * @param postDetails.
	 * 
	 * @return JsonResponse.
	 */
	@Path("/store")
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response store(Post postDetails) {
		return Response
				.ok()
				.entity(new ResponseStatus(post.storePost(postDetails)))
				.build();
	}

	/*
	 * CREATE
	 * 
	 * http://localhost:8080/magnoliaAuthor/.rest/posts/v1/create/
	 * http://localhost:8080/magnoliaPublic/.rest/posts/v1/create/
	 * 
	 * @param commentDetails.
	 * 
	 * @return JsonResponse.
	 */
	@Path("/create")
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response create(Comment commentDetails) {
		return Response
				.ok()
				.entity(new ResponseStatus(commnet.createComment(commentDetails)))
				.build();
	}

	/*
	 * UPDATE
	 * 
	 * http://localhost:8080/magnoliaAuthor/.rest/posts/v1/update/
	 * http://localhost:8080/magnoliaPublic/.rest/posts/v1/update/
	 * 
	 * @param postDetails, uuid.
	 * 
	 * @return JsonResponse.
	 */
	@Path("/modify")
	@PUT
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response modify(Post postDetails, @QueryParam("uuid") String uuid) {
		return Response
				.ok()
				.entity(new ResponseStatus(post.modifyPost(postDetails, uuid)))
				.build();
	}

	/*
	 * DELETE
	 * 
	 * http://localhost:8080/magnoliaAuthor/.rest/posts/v1/destroy/
	 * http://localhost:8080/magnoliaPublic/.rest/posts/v1/destroy/
	 * 
	 * @param uuid.
	 * 
	 * @return JsonResponse.
	 */
	@Path("/destroy")
	@DELETE
	@Produces(MediaType.APPLICATION_JSON)
	public Response destroy(@QueryParam("uuid") String uuid) {
		return Response
				.ok()
				.entity(new ResponseStatus(post.destroyPost(uuid)))
				.build();
	}
}

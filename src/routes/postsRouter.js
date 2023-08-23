import { Router } from "express";
import { addPost, deletePost, getAllPosts, getNumbNewPosts, getPosts, updatePost } from "../controllers/postsController.js";
import { validateSchema } from "../middlewares/validateShema.js";
import validateToken from "../middlewares/validateToken.js";
import validateUser from "../middlewares/validateUser.js";
import { addPostSchema } from "../schema/postSchema.js";
import { postUpdateSchema } from "../schema/postUpdateSchema.js";


const postsRouter = Router();

postsRouter.post('/addpost', validateToken, validateSchema(addPostSchema), addPost);

postsRouter.get('/posts/:page', getPosts);

postsRouter.put('/edit/:id', validateUser, validateSchema(postUpdateSchema), updatePost);

postsRouter.delete('/posts/:id', validateUser, deletePost);

postsRouter.get('/posts', getAllPosts);

postsRouter.get('/newposts/:timestamp/:id', getNumbNewPosts)

export default postsRouter
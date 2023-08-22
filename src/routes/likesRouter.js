import { Router } from "express";
import { getLikes, handleLikePost } from "../controllers/likesController.js";


const likeRouter = Router();


likeRouter.get('/likes/:postid/:userid', getLikes);
likeRouter.post('/likes',handleLikePost);

export default likeRouter;
import { Router } from "express";
import { getComment, postComment } from "../controllers/commentsController.js";


const commentRouter = Router();


commentRouter.post('/:postid/:userid', postComment);
commentRouter.get('/:postid',   getComment);


export default commentRouter;
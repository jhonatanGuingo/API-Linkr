import { Router } from "express";
import { getLikes } from "../controllers/likesController.js";


const likeRouter = Router();


likeRouter.get('/likes/:postid/:userid', getLikes);

export default likeRouter;
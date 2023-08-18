import { Router } from "express";
import { getTrending } from "../controllers/hashtagController.js";

const hashtagRouter = Router();

hashtagRouter.get('/hashtag', getTrending)

export default hashtagRouter;
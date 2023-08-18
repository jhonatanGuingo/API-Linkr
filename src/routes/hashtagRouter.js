import { Router } from "express";
import { getTrending } from "../controllers/hashtagController.js";
import { postHashtag } from "../controllers/hashtagController.js";
import { getPostsbyHashtag } from "../controllers/hashtagController.js";

const hashtagRouter = Router();

hashtagRouter.get('/hashtag', getTrending);
hashtagRouter.post('/hashtag', postHashtag);
hashtagRouter.get('/hashtag/:hashtag', getPostsbyHashtag);


export default hashtagRouter;
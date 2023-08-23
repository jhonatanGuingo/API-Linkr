import { Router } from "express";
import authRouter from "./authRouter.js";
import hashtagRouter from "./hashtagRouter.js";
import likeRouter from "./likesRouter.js";
import postsRouter from "./postsRouter.js";
import commentRouter from "./commentRouter.js";

const router = Router();

router.use(authRouter);
router.use(hashtagRouter);
router.use(likeRouter);
router.use(postsRouter);
router.use(commentRouter);


export default router;
import { Router } from "express";
import authRouter from "./authRouter.js";
import hashtagRouter from "./hashtagRouter.js";
import likeRouter from "./likesRouter.js";
import postsRouter from "./postsRouter.js";

const router = Router();

router.use(authRouter)
router.use(hashtagRouter);
router.use(likeRouter)
router.use(postsRouter)


export default router;
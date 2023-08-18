import { Router } from "express";
import authRouter from "./authRouter.js";
import likeRouter from "./likesRouter.js";

const router = Router();

router.use(authRouter)
router.use(likeRouter)

export default router;
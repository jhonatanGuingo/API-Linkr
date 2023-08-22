import { Router } from "express";
import { SearchBar } from "../controllers/userController.js";

const userRouter = Router();

userRouter.get('/users/:user', SearchBar);

export default userRouter;
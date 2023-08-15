import { Router } from "express"
import { loginSchema, signUpSchema } from "../schema/authSchema.js"
import { validateSchema } from "../middlewares/validateShema.js"
import { postLogin, postSignUp } from "../controllers/authController.js"

const authRouter = Router()

authRouter.post("/signup", validateSchema(signUpSchema), postSignUp)
authRouter.post("/signin", validateSchema(loginSchema), postLogin)

export default authRouter
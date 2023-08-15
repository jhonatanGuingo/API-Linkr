import joi from "joi"

export const signUpSchema = joi.object({
    email: joi.string().email().required(),
    password: joi.string().required(),
    userName: joi.string().required(),
    image: joi.string().uri().required(),
});

export const loginSchema = joi.object({
    email: joi.string().email().required(),
    password: joi.string().required()
});
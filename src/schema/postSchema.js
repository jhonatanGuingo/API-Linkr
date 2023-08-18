import Joi from "joi";


export const addPostSchema = Joi.object({
    link: Joi.string().uri().required(),
    description: Joi.string()
})
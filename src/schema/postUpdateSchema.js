import Joi from "joi";


export const postUpdateSchema = Joi.object({
    description: Joi.string()
})
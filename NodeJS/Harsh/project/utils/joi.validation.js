const PasswordPrompt = require("inquirer/lib/prompts/password");
const Joi = require("joi");

const validateUser = (user) => {
    const joiSchema = Joi.object({
        _id: Joi.number().required(),
        userName: Joi.string().min(1).max(50).required(),
        Password: Joi.string().min(1).max(255).required(),
        email: Joi.string().min(1).max(255).required().email(),
        phoneNumber: Joi.number().required(),
        role: Joi.string().required()
    });
    return joiSchema.validate(user, schema)
}

module.exports = { validateUser };
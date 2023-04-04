const Joi = require('joi');
const { password, objectId } = require('./custom.validation');

const createUser = {
    body: Joi.object().keys({
        idsv: Joi.string().required(),
        password: Joi.string().required().custom(password),
    })
}

const getUsers = {
    query: Joi.object().keys({
        idsv: Joi.string(),
        sortBy: Joi.string(),
        limit: Joi.number().integer(),
        page: Joi.number().integer(),
    }),
}

const getUserById = {
    params: Joi.object().keys({
        userId: Joi.string().custom(objectId),
    }),
}

const updateUser = {
    params: Joi.object().keys({
        userId: Joi.required().custom(objectId),
    }),
    body: Joi.object()
        .keys({
            idsv: Joi.string().required(),
            password: Joi.string().required().custom(password),
        })
        .min(1)
}

const deleteUser = {
    params: Joi.object().keys({
        userId: Joi.required().custom(objectId),
    }),
}

module.exports = {
    createUser,
    getUsers,
    getUserById,
    updateUser,
    deleteUser,
};
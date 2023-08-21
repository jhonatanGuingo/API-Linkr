import { v4 as uuid } from "uuid"
import bcrypt from "bcrypt"
import { db } from "../database/databaseConnection.js";
//POST - signup
export async function postSignUp(request, response) {
    const { userName, password, email, image } = request.body;
    const encryptedPassword = bcrypt.hashSync(password, 10);
    const existingUser = await db.query(`SELECT * FROM users WHERE email=$1;`, [email])

    if (existingUser.rowCount !== 0) {
        return response.status(409).send("Usuário já está cadastrado")
    }

    try {
        await db.query(`INSERT INTO users ("userName", email, password, image) VALUES ($1, $2, $3, $4);`, [userName, email, encryptedPassword, image])
        return response.status(201).send("Usuário Cadastrado!")
    } catch (err) {
        return response.status(500).send(err.message)
    }
};

//POST - signin
export async function postLogin(request, response) {
    const token = uuid()
    const { email, password } = request.body
    const existingUser = await db.query(`SELECT * FROM users WHERE email=$1;`, [email])
    const {image} = existingUser.rows[0]
    const {id} = existingUser.rows[0]
    
    if (existingUser.rowCount === 0) {
        return response.status(401).send("Usuário não cadastrado")
    }

    const correctPassword = bcrypt.compareSync(password, existingUser.rows[0].password)
    if (!correctPassword) {
        return response.status(401).send("Senha incorreta")
    }

    try {
        await db.query(`INSERT INTO session ("userId", token) VALUES ($1, $2);`, [existingUser.rows[0].id, token])
        response.status(200).send({ token: token, image: image, userId: id })
    } catch (err) {
        response.status(500).send(err.message)
    }
}
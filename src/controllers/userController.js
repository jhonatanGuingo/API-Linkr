import { db } from "../database/databaseConnection.js";

export async function SearchBar(req, res){
    const {user} = req.params;
    console.log(user)
    try {
        const searchUser = await db.query(`SELECT users."userName", users.image FROM users WHERE "userName" LIKE $1`, [`${user}%`]);
        console.log(searchUser.rows)
        if(searchUser.rowCount){
           return res.status(200).send(searchUser.rows);
        }else{
            return res.status(404).send('Nenhum usuario encontrado');
        }
    } catch (err) {
        return res.status(500).send(err.message)
    }
}
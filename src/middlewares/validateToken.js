import { db } from "../database/databaseConnection.js"


export default async function validateToken(req, res, next){
    //req.headers : {Authorization: Bearer token}
    const {authorization} = req.headers;
    const token = authorization?.replace("Bearer ", "");
    if(!token){
        return res.status(401).send(`Não autorizado!`)
    }
    try{
        const user = await db.query(`SELECT "userId" FROM session WHERE token = $1`, [token])
        if(user.rowCount === 0){
            return res.status(401).send('Não autorizado!')
        }
        res.locals.user = user.rows[0] //{userId: }
        next()
        //return res.send(user.rows[0])
    }catch(err){
        res.status(500).send(err.message)
    }
}
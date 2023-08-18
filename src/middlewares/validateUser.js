import { db } from "../database/databaseConnection.js"


export default async function validateUser(req, res, next){
    //req.headers : {Authorization: Bearer token}
    //params: {id: postId}
    const {authorization} = req.headers;
    const token = authorization?.replace("Bearer ", "");
    const {id} = req.params
    if(!token){
        return res.status(401).send(`Não autorizado!`)
    }
    try{
        const user = await db.query(`SELECT "userId" FROM session WHERE token = $1`, [token])
        if(user.rowCount === 0){
            return res.status(401).send('Não autorizado!')
        }
        const post = await db.query(`SELECT "userId" FROM posts WHERE id = $1`, [id])
        if(post.rowCount === 0){
            return res.status(404).send('Este post não existe')
        }
        if(user.rows[0].userId !== post.rows[0].userId){
            return res.status(401).send('Este post não pertence ao usuário logado!')
        }
        res.locals.user = user.rows[0] //{userId: }
        next()
        //return res.send(user.rows[0])
    }catch(err){
        res.status(500).send(err.message)
    }
}
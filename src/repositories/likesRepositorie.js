import { db } from "../database/databaseConnection.js";


export async function getlikeNumber(postid) {
    try{
    const query = `
    SELECT likes.*, username AS name
    FROM likes
    JOIN users ON id_user = users.id
    WHERE id_post = $1
    ORDER BY createdat DESC;
    `
    const count = await db.query(query,[postid]);
    return {
        count: count.rowCount,
        lastLikes: [count.rows[0].name,count.rows[1].name]
    }
    }
    catch(err){
        return {err};
    }

}


export async function liked(postid,userid){
    try{
        const req = await db.query('SELECT * FROM likes WHERE id_post = $1 AND id_user = $2',[postid,userid])
        let liked = false;
        if(req.rowCount > 0){
            liked = true
        }
        return liked;
    }
    catch(err){
        return {err};
    }

}
import { db } from "../database/databaseConnection.js";


export async function getlikeNumber(postid) {
    try {
        const query = `
    SELECT likes.*, "userName" AS name
    FROM likes
    JOIN users ON id_user = users.id
    WHERE id_post = $1
    ORDER BY createdat DESC;
    `
        const count = await db.query(query, [postid]);
        return {
            count: count.rowCount,
            lastLikes: count.rows
        }
    }
    catch (err) {
        return { err };
    }

}


export async function liked(postid, userid) {
    try {
        const req = await db.query('SELECT * FROM likes WHERE id_post = $1 AND id_user = $2', [postid, userid])
        let liked = false;
        if (req.rowCount > 0) {
            liked = true
        }
        return liked;
    }
    catch (err) {
        return { err };
    }

}


export async function handleLike(postid, userid, bool) {
    try {
        if (!bool) {
            db.query('DELETE FROM likes WHERE id_post = $1 AND id_user = $2', [postid, userid])
            return true;
        }
        else {
            db.query('INSERT INTO likes (id_post,id_user) VALUES($1,$2)', [postid, userid]);
            return true;
        }
    }
    catch(err){
        return {err};
    }
}
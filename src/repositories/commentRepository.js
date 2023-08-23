import { db } from "../database/databaseConnection.js";


export async function PostCom(userid,postid,text){
    try{
        await db.query('INSERT INTO comments (id_user,id_post,comment) VALUES($1,$2,$3)',[userid,postid,text]);
        return 0;
    }
    catch(err){
        return {err}
    }
}


export async function GetCom(postid){
    try{
        const query=`
        SELECT comments.*, users."userName" AS name, users.image AS image
        FROM comments
        JOIN users ON comments.id_user = users.id
        WHERE comments.id_post = $1;
        `
        const res = await db.query(query,[postid])
        return res.rows;
    }
    catch(err){
        return {err}
    }
}
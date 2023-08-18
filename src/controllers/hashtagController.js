import { db } from "../database/databaseConnection.js";

export async function getTrending(req,res){
    try {
        const trendingTopics = await db.query(`SELECT "nameHashtag", 
        COUNT(*) as count 
        FROM hashtags 
        GROUP BY "nameHashtag" 
        ORDER BY count DESC LIMIT 10`)

        res.status(200).send(trendingTopics.rows)
    } catch (err) {
        return res.status(500).send(err.message) 
    }
}

export async function postHashtag(req, res){
    const {postId, nameHashtag} = req.body;
    const existingPost = await db.query(`SELECT * FROM posts WHERE id = $1`, [postId])

    if(existingPost.rowCount === 0 ){
        return res.status(404).send("Post não existe")
    }

    try {
        await db.query(`INSERT INTO hashtags ("nameHashtag", "postId") VALUES ($1, $2)`, [nameHashtag, postId]);
        return res.status(201).send("Hashtag salva")
    } catch (err) {
        return res.status(500).send(err.message)
    }

}

export async function getPostsbyHashtag(req,res){
    const {hashtag} = req.params;
    try {
        const searchPostsByHashtag = await db.query(`SELECT posts."id" AS "postId", posts."link", posts."description", users."image", users."userName"
        FROM posts
        JOIN hashtags ON hashtags."postId" = posts.id 
        JOIN users ON users.id = posts."userId"
        WHERE "nameHashtag" = $1`, [hashtag])

        return res.status(201).send(searchPostsByHashtag.rows);

    } catch (err) {
        return res.status(500).send(err.message)
    }

}
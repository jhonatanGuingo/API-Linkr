import { db } from "../database/databaseConnection.js";

export async function getTrending(req,res){
    try {
        const trendingTopics = await db.query(`SELECT "nameHashtag", 
        COUNT(*) as count 
        FROM "hashtags" 
        GROUP BY "nameHashtag" 
        ORDER BY count DESC LIMIT 10`)

        res.status(200).send(trendingTopics.rows)
    } catch (err) {
        res.send(err.message); 
    }
}
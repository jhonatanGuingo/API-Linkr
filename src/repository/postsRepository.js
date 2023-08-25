import { db } from "../database/databaseConnection.js"


export const insertPost = (body, locals) => {//locals = res.locals; body = req.body
    //req.body: {link: , description: }
    //res.locals.user: {userId}
    const {user} = locals
    const {link, description} = body

    return db.query(`INSERT INTO posts ("userId", description, link) VALUES ($1, $2, $3)`, [user.userId, description, link])
}

export const getLastPost = () => {
    return db.query(`SELECT id FROM posts ORDER BY "createdAt" DESC LIMIT 1`)
}

export const selectPosts = (page) => {
    //precisa devolver: userImage, userName, description e link
    const limit = (page * 10) - 10
    return (
        db.query(`SELECT posts."userId", posts."id" AS "postId", posts."link", posts."description", users."image", users."userName"
            FROM posts
            JOIN users
            ON posts."userId" = users."id"
            ORDER BY posts."createdAt" DESC
            LIMIT 10
            OFFSET $1`, [limit])
    )
}

export const updateUserPost = (description, postId) => {
    return db.query(`UPDATE posts SET "description" = $1 WHERE id = $2`, [description, postId])
}

export const deteleUserPost = (postId) => {
    return db.query(`DELETE FROM posts WHERE id = $1`, [postId])
}

export const selectNumNewPosts = (date, id) => {
    return db.query(`SELECT COUNT(*) as "numNewPosts" FROM posts WHERE "createdAt" > $1 AND "userId" <> $2`, [date, id])
}


export const selectUserPosts = (userId) => {

    return (
        db.query(`SELECT posts."userId", posts."id" AS "postId", posts."link", posts."description", users."image", users."userName"
        FROM posts
        JOIN users
        ON posts."userId" = users."id"
        WHERE posts."userId" = $1
        ORDER BY posts."createdAt" DESC`, [userId])
    )
}
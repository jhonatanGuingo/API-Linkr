import { db } from "../database/databaseConnection.js"


export const insertPost = (body, locals) => {//locals = res.locals; body = req.body
    //req.body: {link: , description: }
    //res.locals.user: {userId}
    const {user} = locals
    const {link, description} = body

    return db.query(`INSERT INTO posts ("userId", description, link) VALUES ($1, $2, $3)`, [user.userId, description, link])
}

export const selectPosts = (page) => {
    //precisa devolver: userImage, userName, description e link
    const limit = (page * 20) - 20
    return (
        db.query(`SELECT posts."userId", posts."id" AS "postId", posts."link", posts."description", users."image", users."userName"
            FROM posts
            JOIN users
            ON posts."userId" = users."id"
            ORDER BY posts."createdAt" DESC
            LIMIT 20
            OFFSET $1`, [limit])
    )
}

export const updateUserPost = (description, postId) => {
    return db.query(`UPDATE posts SET "description" = $1 WHERE id = $2`, [description, postId])
}

export const deteleUserPost = (postId) => {
    return db.query(`DELETE FROM posts WHERE id = $1`, [postId])
}
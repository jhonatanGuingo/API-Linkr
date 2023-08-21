import { db } from "../database/databaseConnection.js"
import { deteleUserPost, insertPost, selectPosts, updateUserPost } from "../repository/postsRepository.js"

export async function addPost (req, res){
    //req.body: {link: , description: }
    //res.locals.user: {userId}
    try{
        await insertPost(req.body, res.locals)
        return res.status(201).send('Post criado com sucesso!')
    }catch(err){
        return res.status(500).send(err.message)
    }
}

export async function getPosts (req, res){
    //precisa devolver: userImage, userName, description e link
    //req.params: {page: 1}
    const {page} = req.params
    try{
        const posts = (await selectPosts(page)).rows
        return res.status(200).send(posts)
    }catch(err){
        return res.status(500).send(err.message)
    }
}

export async function updatePost (req, res){
    //body: {description, userId}
    //params: {id: postId}
    //res.locals.user: {userId}
    const {description} = req.body
    const {id} = req.params
    try{
        await updateUserPost(description, id)
        return res.status(200).send('Post atualizado com sucesso!')
    }catch(err){
        return req.status(500).send(err.message)
    }
}

export async function deletePost (req, res){
    //params: {id: postId}
    //req.headers : {Authorization: Bearer token}
    const {id} = req.params
    try{
        await deteleUserPost(id)
        return res.status(200).send('Post deletado com sucesso!')
    }catch(err){
        return req.status(500).send(err.message)
    }
}

export async function getAllPosts(req,res){
    try{
        const searchPosts = await db.query(`SELECT * FROM posts`);
        return res.status(200).send(searchPosts.rows);
    }catch(err){
        return res.status(500).send(err.message)
    }
}
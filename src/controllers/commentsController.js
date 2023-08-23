import { GetCom, PostCom } from "../repositories/commentRepository.js";


export async function postComment(req,res){
    const { text } = req.body;
    const { postid,userid } = req.params;
    if(!text,!postid,!userid){ return res.status(409).send('Digite seu comentário');}

    try{
        const post = await PostCom(userid,postid,text);
        if(post.err){ return res.status(500).send(post.err) }
        return res.sendStatus(201);
    }
    catch(err){
        return res.status(500).send(err)
    }
}

export async function getComment(req,res){
    const { postid } = req.params;

    try{
        const comments = await GetCom(postid);
        return res.status(200).send(comments);
    }
    catch(err){
        return res.status(500).send(err);
    }
}
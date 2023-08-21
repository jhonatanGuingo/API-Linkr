import { getlikeNumber, liked } from "../repositories/likesRepositorie.js";

export async function getLikes(req,res){
  const { postid, userid } = req.params;
  console.log(postid)
  if(!userid || !postid ){return res.status(409).send('missing ids')}
    try{
    const likes = await getlikeNumber(postid);
    if(likes.err){return res.status(500).send(likes.err)};

    const likedu = await liked(postid,userid);
    if(likedu.err){return res.status(500).send(likedu.err)};

    return res.status(200).send({likes,likedu})
    }
    catch(err){
        return res.status(500).send(err)
    }

}


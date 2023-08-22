import { getlikeNumber, handleLike, liked } from "../repositories/likesRepositorie.js";

export async function getLikes(req, res) {
  const { postid, userid } = req.params;

  if (!userid || !postid) { return res.status(409).send('missing ids') }
  try {
    const likesNumber = await getlikeNumber(postid);
    if (likesNumber.err) { return res.status(500).send(likesNumber.err) };

    const likeUsers = await liked(postid, userid);
    if (likeUsers.err) { return res.status(500).send(likeUsers.err) };

    return res.status(200).send({ likesNumber, likeUsers })
  }
  catch (err) {
    return res.status(500).send(err)
  }
}


export async function handleLikePost(req, res) {
  const { postid, userid, bool } = req.body;

  try{
    const like = handleLike(postid,userid,bool)
    if(like.err){return res.status(500).send(like.err);}
    return res.sendStatus(200);
  }
  catch(err){
    return res.status(500).send(err);
  }
}


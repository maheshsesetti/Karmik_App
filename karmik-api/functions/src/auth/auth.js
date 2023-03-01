const admin = require("firebase-admin");

const db = admin.firestore();
const {validateSignUPData, validateLoginData} = require("../utils/helper");

exports.signUp = (req, res) => {
  const newUser = {
    email: req.body.email,
    password: req.body.password,
    confirmPassword: req.body.confirmPassword,
  };
  const { valid, errors } = validateSignUPData(newUser);
  if (!valid) {
    console.log("status is 400");
    return res.status(400).json(errors);
  }
  let token;
  let userId;
  db.collection("user")
    .where("email", "==", newUser.email)
    .get()
    .then((doc) => {
      console.log("doc is started" + doc);
      if (doc.exists) {
        console.log("status code is 400");
        return res.status(400).send({ data: "The user id already taken" });
      } else {
        console.log("creating user" + newUser.email);
        let email = newUser.email;
        let password = newUser.password;
        const userRecord = admin.auth().createUser({
          email,
          password,
        });
        return userRecord;
      }
    })
    .then((data) => {
      console.log("id is " + data.uid);
      userId = data.uid;
      token = admin.auth().createCustomToken(userId)
      return token;
    })
    .then((idToken) => {
      token = idToken
      const userCredentials = {
        userId,
        email: newUser.email,
        createdAt: new Date().toISOString(),
      };
      db.doc(`/users/${userId}`).set(userCredentials);
    })
    .then(() => {
      return res.status(201).json({ token });
    })
    .catch((err) => {
      if (err.code == "auth/email-already-in-use") {
        return res.status(400).json({ email: "Email Already Exist!" });
      }
      return res.status(500).json({ error: err.message });
    });
};

exports.signIn = (req, res) => {
  const user={
    email:req.body.email,
    password:req.body.password,
  }
  const {valid,errors}=validateLoginData(user);
  if(!valid){
    return res.status(400).json(errors)
  }
  let email = user.email;
  let password = user.password;
  admin.auth().getUserByEmail(email);
  admin.auth().signInWithEmailAndPassword(
    email,
    password
  )
  .then(data=>{
    console.log(JSON.stringify(data));
    const customToken = admin.auth().createCustomToken(data.uid);
    return customToken;
  }).then(token=>{
    return res.json({token});
  }).catch(err=>{
    if(err.code=="auth/wrong-password"|| err.code=="auth/user-not-found"){
      return res.status(403).json({message:"wrong credentials,Please try again"});
    }
    return res.status(500).json({error:err.code});
  })
}

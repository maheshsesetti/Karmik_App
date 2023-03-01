const admin = require("firebase-admin");
const { getAuth } = require("firebase/auth");

const db = admin.firestore();
const firebase =require("firebase/auth");
const { validateSignUPData, validateLoginData } = require("../utils/helper");

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
        return res.status(400).json({ data: "The user id already taken" });
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
      token = admin.auth().createCustomToken(userId);
      return token;
    })
    .then((idToken) => {
      token = idToken;
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
  const user = {
    email: req.body.email,
    password: req.body.password,
  };
  const { valid, errors } = validateLoginData(user);
  if (!valid) {
    return res.status(400).json(errors);
  }
  let email = user.email;
  let password = user.password;
  console.log(email);
  admin.auth().getUserByEmail(email);
  const auth = getAuth();
  firebase.signInWithEmailAndPassword(auth,email,password)
    .then((data) => {
      console.log(JSON.stringify(data));
      admin.auth().createCustomToken(data.user.uid);
      return res.json(data);;
    })
    .catch((err) => {
      if (
        err.code == "auth/wrong-password" ||
        err.code == "auth/user-not-found"
      ) {
        return res
          .status(403)
          .json({ message: "wrong credentials,Please try again" });
      }
      return res.status(500).json({ error: err.message });
    });
};

exports.logout = (req, res) => {
  firebase.signOut().then(function () {
      res.send(null)
      res.end()
  }).catch(function (error) {
    return res.status(500).json({ error: err.message });
  });
}

exports.isAuth = (req, res) => {
  var user = firebase.createUser;
  if (user) {
      user.getIdToken(true).then(function (idToken) {
          res.send(idToken)
          res.end()
      }).catch(function (error) {
        return res.status(500).json({ error: error.message });
      });
  } else {
      //Handle error
  }
}

exports.fbAuth = (req,res,next)=>{
  const token = req.header('Authorization').replace('Bearer', '').trim()
    var user = firebase.currentUser;
    if (user) {
        admin.auth().verifyIdToken(token)
        .then(function (decodedToken) {
            if(decodedToken.uid === user.uid)
            {
                req.user = user.uid
                return next()
            }
        }).catch(function (error) {
            //Handle error
        });
    } else {
        console.log("There is no current user.");
    }
}

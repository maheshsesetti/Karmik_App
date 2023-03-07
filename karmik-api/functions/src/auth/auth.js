const admin = require("firebase-admin");
const { getAuth } = require("firebase/auth");

const db = admin.firestore();
const firebase = require("firebase/auth");
const { validateSignUPData, validateLoginData } = require("../utils/helper");

exports.signUp = (req, res) => {
  const newUser = {
    email: req.body.email,
    emailVerified: false,
    phoneNumber: req.body.phone,
    password: req.body.password,
    confirmPassword: req.body.confirmPassword,
    displayName: req.body.name,
    userProfile: req.body.user.userProfile ?? "",
    disabled: false,
    role: "User",
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

        const userRecord = admin.auth().createUser({
          email: req.body.user.email,
          emailVerified: false,
          phoneNumber: req.body.user.phone,
          password: req.body.user.password,
          confirmPassword: req.body.user.confirmPassword,
          displayName: req.body.user.name,
          userProfile: req.body.user.userProfile ?? "",
          disabled: false,
          role: "User",
        });
        return userRecord;
      }
    })
    .then((data) => {
      console.log("id is " + data.uid);
      userId = data.uid;
      const expiresIn = 86400;
      token = admin.auth().createCustomToken(userId, { expiresIn });
      return token;
    })
    .then((idToken) => {
      token = idToken;
      const userCredentials = {
        userId,
        email: newUser.email,
        createdAt: new Date().toISOString(),
        password: newUser.password,
        confirmPassword: newUser.confirmPassword,
        displayName: newUser.displayName,
        phoneNumber: newUser.phoneNumber,
        userProfile: newUser.userProfile,
        role: "User",
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
  firebase
    .signInWithEmailAndPassword(auth, email, password)
    .then((data) => {
      console.log(JSON.stringify(data));
      admin.auth().createCustomToken(data.user.uid);
      return res.json(data);
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
  firebase
    .signOut()
    .then(function () {
      res.send(null);
      res.end();
    })
    .catch(function (error) {
      return res.status(500).json({ error: err.message });
    });
};

exports.isUserDetails = async (req, res) => {
  try {
    const header = req["currentUser"];
    if (header) {
      console.log(header["uid"]);
      const user = await admin.auth().getUserByEmail(req.body.email);
      res.json(user);
    } else {
      res.status(403).send("Unauthorized");
    }
  } catch (error) {
    console.error(error);
    res.status(401).send("Unauthorized");
  }
};

exports.UpdateProfile = async (req, res) => {
  const header = req["currentUser"];
  console.log(header);
  if (!header) {
    res.status(403).send("Unauthorized");
  } else {
    const newUser = {
      email: req.body.email,
      emailVerified: false,
      phoneNumber: req.body.phone,
      password: req.body.password,
      confirmPassword: req.body.confirmPassword,
      displayName: req.body.name,
      userProfile: req.body.userProfile ?? "",
      disabled: false,
    };
    const { valid, errors } = validateSignUPData(newUser);
    if (!valid) {
      console.log("status is 400");
      return res.status(400).json(errors);
    }
    let userId;
    db.collection("user")
      .where("email", "==", newUser.email)
      .get()
      .then((doc) => {
        console.log("doc is started" + req.params.id);
        if (doc.exists) {
          console.log("status code is 400");
          return res.status(400).json({ data: "The user id already taken" });
        } else {
          console.log("creating user" + newUser);
          const userRecord = admin.auth().updateUser(req.params.id, newUser);
          return userRecord;
        }
      })
      .then((data) => {
        console.log("id is " + data.uid);
        userId = data.uid;
      })
      .then((userRecord) => {
        userId = req.params.id;
        const userCredentials = {
          userId: userId,
          email: newUser.email,
          createdAt: new Date().toISOString(),
          password: newUser.password,
          confirmPassword: newUser.confirmPassword,
          displayName: newUser.displayName,
          phoneNumber: newUser.phoneNumber,
          userProfile: newUser.userProfile,
        };
        db.doc(`/users/${req.params.id}`).update(userCredentials);
      })
      .then(() => {
        return res
          .status(201)
          .json({ message: "Profile updated successfully" });
      })
      .catch((err) => {
        if (err.code == "auth/email-already-in-use") {
          return res.status(400).json({ email: "Email Already Exist!" });
        }
        return res.status(500).json({ error: err.message });
      });
  }
};

exports.RefreshToken = async (req, res) => {
  // Exchange a refresh token for a new authentication token
  admin
    .auth()
    .createCustomToken(req.body.uid)
    .then((refreshToken) => {
      // Use the refresh token to generate a new authentication token
      return admin.auth().createCustomToken(req.body.uid, { refreshToken });
    })
    .then((customToken) => {
      // Use the new authentication token
      res.json({ token: customToken });
    })
    .catch((error) => {
      console.log("Error refreshing token:", error);
    });
};

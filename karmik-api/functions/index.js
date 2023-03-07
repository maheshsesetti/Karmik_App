const functions = require("firebase-functions");

const admin = require("firebase-admin");

const serviceAccount = require("./serviceAccountKey.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

const firebaseConfig = {
  apiKey: "AIzaSyCmG7cypNguiUvEhuUm_9dACkCVN0jzMlI",
  authDomain: "karmik-app-72110.firebaseapp.com",
  projectId: "karmik-app-72110",
  storageBucket: "karmik-app-72110.appspot.com",
  messagingSenderId: "982011134579",
  appId: "1:982011134579:web:e4cdf0952c85121548e006",
  measurementId: "G-RHK7G0N21K",
};
const firebase = require("firebase/app");

firebase.initializeApp(firebaseConfig);

const express = require("express");
const cors = require("cors");

const app = express();
app.use(cors({ origin: true }));

const {
  signUp,
  signIn,
  logout,
  isUserDetails,
  UpdateProfile,
  RefreshToken,
} = require("./src/auth/auth");

app.use(decodeIDToken);

/**
 * Decodes the JSON Web Token sent via the frontend app
 * Makes the currentUser (firebase) data available on the body.
 */
async function decodeIDToken(req, res, next) {
  if (req.headers?.authorization?.startsWith("Bearer ")) {
    const idToken = req.headers.authorization.split("Bearer ")[1];

    try {
      const decodedToken = await admin.auth().verifyIdToken(idToken);
      req["currentUser"] = decodedToken;
    } catch (err) {
      console.log(err);
    }
  }

  next();
}

app.get("/", (req, res) => res.status(200).send("Hey there!"));
app.post("/api/signup", signUp);
app.post("/api/signin", signIn);
app.get("/api/signout", logout);
app.get("/api/user/details", isUserDetails);
app.post("/api/:id/update", UpdateProfile);
app.post("/api/refresh_token", RefreshToken);

exports.app = functions.https.onRequest(app);

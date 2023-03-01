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

const { signUp, signIn,logout,isAuth } = require("./src/auth/auth");

app.get("/", (req, res) => res.status(200).send("Hey there!"));
app.post("/api/signup", signUp);
app.post("/api/signin", signIn);
app.get("/api/signout", logout);
app.get("/api/isAuth", isAuth);
exports.app = functions.https.onRequest(app);

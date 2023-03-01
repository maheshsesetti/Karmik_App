const functions = require("firebase-functions");

const admin = require("firebase-admin");

const serviceAccount = require("./serviceAccountKey.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

const express = require("express");
const cors = require("cors");

const app = express();
app.use(cors({origin : true}));

const {signUp, signIn} = require("./src/auth/auth");

app.get("/", (req, res)=> res.status(200).send("Hey there!"));
app.post("/api/signup", signUp);
app.post("/api/signin", signIn);


exports.app = functions.https.onRequest(app);

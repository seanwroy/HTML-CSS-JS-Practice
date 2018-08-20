/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



var config = {
   apiKey: "apiKey",
   authDomain: "hackthebarriers-fdb6a.firebaseapp.com",
   databaseURL: 'https://hackthebarriers-fdb6a.firebaseio.com',
   storageBucket: "bucket.appspot.com"
 };
 firebase.initializeApp(config);

 // Get a reference to the database service
 var database = firebase.database();
var admin = require('firebase-admin');

var serviceAccount = require('C:/Users/incog/Downloads/hackthebarriers-fdb6a.json');

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: 'https://hackthebarriers-fdb6a.firebaseio.com'
});

function thing(){
    var username=getElementById("name");
    console.log(username)
}
<?php

$con = mysqli_connect('localhost','horacio','carrillo123','group2');

$id = mysqli_real_escape_string($con, $_GET['id']);
$text = mysqli_real_escape_string($con, $_GET['text']);
$email = mysqli_real_escape_string($con, $_GET['email']);

if (!$con) {
  die('Could not connect: ' . mysqli_error($con));
}
$command="INSERT INTO COMMENTS (Poster_email, Post_ID, Text) VALUES (";
$values="'$email','$id','$text')";
$sql= $command . $values;
if (mysqli_query($con, $sql)) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($con);
}
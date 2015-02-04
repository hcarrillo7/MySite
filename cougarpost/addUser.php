<?php

$name = $_GET['name'];
$image = $_GET['image'];
$email = $_GET['email'];

$con = mysqli_connect('localhost','horacio','carrillo123','group2');
if (!$con) {
  die('Could not connect: ' . mysqli_error($con));
}
$command="INSERT INTO USERS (Email, Name, Img) VALUES (";
$values="'". $email.'\',\''.$name.'\',\''.$image.'\')';
$sql= $command . $values;
if (mysqli_query($con, $sql)) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($con);
}
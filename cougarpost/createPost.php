<?php

$con = mysqli_connect('localhost','horacio','carrillo123','group2');
if (!$con) {
  die('Could not connect: ' . mysqli_error($con));
}

$thumb = mysqli_real_escape_string($con, $_POST['thumb']);
$title = mysqli_real_escape_string($con, $_POST['title']);
$sDesc = mysqli_real_escape_string($con, $_POST['sDesc']);
$lDesc = mysqli_real_escape_string($con, $_POST['lDesc']);
$img1 = mysqli_real_escape_string($con, $_POST['img1']);
$img2 = mysqli_real_escape_string($con, $_POST['img2']);
$img3 = mysqli_real_escape_string($con, $_POST['img3']);
$email = mysqli_real_escape_string($con, $_POST['email']);

$command="INSERT INTO POSTS (Poster_email, Title, Thumb_url, Short_desc, Long_desc) VALUES (";
$values="'$email','$title','$thumb','$sDesc','$lDesc')";
$sql= $command . $values;
if (mysqli_query($con, $sql)) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($con);
}
//insert images into table if they were input.
$command="INSERT INTO IMAGES (Post_ID, Url) VALUES (";
$title = mysqli_insert_id($con);
if (!empty ($img1)) {
	$values="'". $title."','".$img1."')";
}
if (!empty ($img2)) {
	$values= $values.", ('". $title."','".$img2."')";
}
if (!empty ($img3)) {
	$values= $values.", ('". $title."','".$img3."')";
}
$sql= $command . $values;
if (mysqli_query($con, $sql)) {
	echo "New record created successfully";
} else {
	echo "Error: " . $sql . "<br>" . mysqli_error($con);
}


mysqli_close($con);
?>
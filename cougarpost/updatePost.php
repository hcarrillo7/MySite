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
$id = "";
$id = mysqli_real_escape_string($con, $_POST['id']);
$command="UPDATE POSTS SET Title = '$title', Thumb_url = ".
	"'$thumb', Short_desc = '$sDesc', Long_desc = '$lDesc' ".
	"where Post_ID = '$id'";
	
if (mysqli_query($con, $command)) {
    echo "Record updated successfully";
} else {
    echo "Error: " . $command . "<br>" . mysqli_error($con);
}
//remove the old images then add new ones.
$command = "delete from IMAGES where Post_id = " . mysqli_real_escape_string($con, $_POST['id']);

if (mysqli_query($con, $command)) {
    echo "New record created successfully";
} else {
    echo "Error: " . $command . "<br>" . mysqli_error($con);
}


$command="INSERT INTO IMAGES (Post_ID, Url) VALUES (";
$title = mysqli_real_escape_string($con, $_POST['id']);
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
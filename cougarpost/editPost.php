<?php
$q = intval($_GET['q']);

$con = mysqli_connect('localhost','horacio','carrillo123','group2');
if (!$con) {
  die('Could not connect: ' . mysqli_error($con));
}
$sql="SELECT Name, Img, Title, Thumb_url, Short_desc, Long_desc, Url FROM USERS, POSTS, IMAGES WHERE POSTS.Post_ID = IMAGES.POST_ID AND Email = Poster_email AND POSTS.Post_ID = " . $q;
$result = mysqli_query($con,$sql);

if($row = mysqli_fetch_array($result)) {
	echo $row['Thumb_url'];
	echo "-_-" . $row['Title'];
	echo "-_-" . $row['Short_desc'];
	echo "-_-" . $row['Long_desc'];  
	echo "-_-" . $row['Url'];  
	if($row = mysqli_fetch_array($result)) {//if there are two images in database for this post.
		echo "-_-" . $row['Url'];
		if($row = mysqli_fetch_array($result)) {//if there are 3 images in database for this post.
			echo "-_-" . $row['Url'];
		}
		else {
			echo "-_-http://www.pjrc.com/mp3/gallery/empty.gif";
		}
	}
	else {
		echo "-_-http://www.pjrc.com/mp3/gallery/empty.gif-_-http://www.pjrc.com/mp3/gallery/empty.gif";
	}
	echo "-_-" . $row['Name'];
	echo "-_-" . $row['Img'];
}
?>
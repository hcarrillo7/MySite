<?php

$thumb = intval($_GET['thumb']);
$title = intval($_GET['title']);
$sDesc = intval($_GET['sDesc']);
$lDesc = intval($_GET['lDesc']);
$img1 = intval($_GET['img1']);
$img2 = intval($_GET['img2']);
$img3 = intval($_GET['img3']);

$con = mysqli_connect('localhost','horacio','carrillo123','group2');
if (!$con) {
  die('Could not connect: ' . mysqli_error($con));
}
$command="INSERT INTO POSTS (Poster_email, Title, Thumb_url, Short_desc, Long_desc, Create_date, Expire_date) VALUES"
mysqli_select_db($con,"group2");
$sql= "$command  ";
$result = mysqli_query($con,$sql);

while($row = mysqli_fetch_array($result)) {
  echo "<div class='col-lg-2 col-md-3 col-sm-4 col-xs-12'><div class='thumbnail mock'><img src='";
  echo $row['Thumb_url'] . "'alt='...'><div class='caption'><h3 id='post_title'>";
  echo $row['Title'] . "</h3><p>";
  echo $row['Short_desc'] . "</p><p><button class='btn btn-primary' role='button'";
  echo "onclick='loadSinglePost(\"" . $row['Post_ID'] . "\")'>View</button></p></div></div></div>";
}

mysqli_close($con);
?>
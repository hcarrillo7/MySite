<?php
$q = intval($_GET['q']);

$con = mysqli_connect('localhost','horacio','carrillo123','group2');
if (!$con) {
  die('Could not connect: ' . mysqli_error($con));
}

mysqli_select_db($con,"group2");
$sql="SELECT Post_ID, Title, Thumb_url, Short_desc FROM POSTS";
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
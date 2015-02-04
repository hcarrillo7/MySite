<?php

$age = intval($_GET['a']);
$sort = intval($_GET['s']);

$filter1 = "";
$filter2 = "";

$con = mysqli_connect('localhost','horacio','carrillo123','group2');
if (!$con) {
  die('Could not connect: ' . mysqli_error($con));
}
switch ($age) {
	case 1:
		$filter1 = "WHERE Create_date >= CURDATE() - INTERVAL 3 MONTH";
		break;
	case 2:
		$filter1 = "WHERE Create_date >= CURDATE() - INTERVAL 1 DAY";
		break;
	case 3:
		$filter1 = "WHERE Create_date >= CURDATE() - INTERVAL 1 WEEK";
		break;
	case 4:
		$filter1 = "WHERE Create_date >= CURDATE() - INTERVAL 1 MONTH";
		break;
	case 5:
		$filter1 = "WHERE Create_date <= CURDATE()";
}

switch ($sort) {
	case 1:
		$filter2 = " ORDER BY Create_date";
		break;
	case 2:
		$filter2 = " ORDER BY Title";
		break;
	case 3:
		$filter2 = " ORDER BY Create_date";
		break;
	case 4:
		$filter2 = " ORDER BY Poster_email";
}

$sql="SELECT Post_ID, Title, Thumb_url, Short_desc FROM POSTS $filter1 $filter2";
$result = mysqli_query($con,$sql);

while($row = mysqli_fetch_array($result)) {
  echo "<div class='item'><div class='thumbnail mock'><img src='";
  echo $row['Thumb_url'] . "'alt='...'><div class='caption'><h3 id='post_title'>";
  echo $row['Title'] . "</h3><p>";
  echo $row['Short_desc'] . "</p><p><button class='btn btn-primary' role='button'";
  echo "onclick='loadSinglePost(\"" . $row['Post_ID'] . "\")'>View</button></p></div></div></div>";
}

mysqli_close($con);
?>
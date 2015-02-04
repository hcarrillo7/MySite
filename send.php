<?php

$name = $_POST['name'];
$email = $_POST['email'];
$message = $_POST['message'];


$to = "hcarrillo92@gmail.com";

$subject = "HoracioCarrillo.me email from $name";

$message = "Message from: $email \n\n $message";

mail($to,$subject,$message);

echo "Thanks for your submission. I will try to get back to you as soon as possible."; 
?>
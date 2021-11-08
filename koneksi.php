<?php
$conn = mysqli_connect('localhost','root','','dataprodi');
	if (mysqli_connect_error()) {
		printf("Connect Failed", mysqli_connect_error());
		exit();
	}
?>
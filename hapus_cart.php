<?php 
    session_start();
    unset($_SESSION['cart'][$_GET['id_buku']]);
    header('location: keranjang.php');
?>
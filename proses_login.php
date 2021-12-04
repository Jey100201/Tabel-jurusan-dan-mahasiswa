<?php
if ($_POST){
    $username = $_POST['username'];
    $password = $_POST['password'];
    if (empty($username)){
        echo "<script>alert('username tidak boleh kosong');location.href='login.php';</script>";
    }
    elseif (empty($password)){
        echo "<script>alert('password tidak boleh kosong');location.href='login.php';</script>";
    }
    else {
        include "koneksi.php";
        $qry_login = mysqli_query($conn, "select * from mahasiswa where username = '".$username."'and password = '".$password."'");
        if (mysqli_num_rows($qry_login)>0){
            $data_login = mysqli_fetch_array($qry_login);
            session_start();
            $_SESSION['id_mhs']=$data_login['id_mhs'];
            $_SESSION['nama']=$data_login['nama'];
            $_SESSION['status_login']=true;
            header("location: home.php");
        }
        else {
            echo "<script>alert('username dan password tidak benar');location.href='login.php';</script>";
        }
    }
}
?>
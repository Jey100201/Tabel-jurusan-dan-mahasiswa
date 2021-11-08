<?php
    if($_GET['id_jurusan']){
        include "koneksi.php";
        $qry_hapus=mysqli_query($conn, "delete from jurusan where id_jurusan='".$_GET['id_jurusan']."'");
        if($qry_hapus){
            echo "<script>alert('sukses hapus jurusan');location.href='tampil_jurusan.php';</script>";
        }
        else {
            echo "<script>alert('gagal hapus jurusan');location.href='tampil_jurusan.php';</script>";
        }
    }
?>
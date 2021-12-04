<?php
	if($_POST){
		$judul_buku = $_POST['judul_buku'];
		$deskripsi = $_POST['deskripsi'];
		if(empty($judul_buku)){
			echo "<script>alert('Judul Buku Tidak Boleh Kosong');location.href='tambah_buku.php';</script>";
		}
	elseif (empty($deskripsi)){
		echo "<script>alert('Deskripsi Tidak Boleh Kosong');location.href='tambah_buku.php';</script>";		
	}
	else {
		include "koneksi.php";
		$insert = mysqli_query($conn, "insert into buku (judul_buku, deskripsi) value ('".$judul_buku."','".$deskripsi."')");
		if($insert){
			echo "<script>alert('sukses menambahkan data buku');location.href='tambah_buku.php';</script>";
		}
		else {
			echo "<script>alert('gagal menambahkan data buku');location.href='tambah_buku.php';</script>";
		}
	}
	}
?>
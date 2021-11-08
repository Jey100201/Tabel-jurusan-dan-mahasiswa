<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
</head>
<body>
    <h3>Data Jurusan</h3>
    <table class="table table-hover table-striped">
        <thead>
            <tr>
                <th>NO</th><th>Jurusan</th><th>Angkatan</th>
                <th>Aksi</th>
            </tr>
        </thead>
        <tbody>
            <?php 
            include "koneksi.php";
            $qry_jurusan=mysqli_query($conn,"select * from jurusan");
            $no=0;
            while ($data_jurusan=mysqli_fetch_array($qry_jurusan)) {
                $no++;?>
                <tr>
                <td><?=$no?></td><td><?=$data_jurusan['nama_jurusan']?></td><td><?=$data_jurusan['angkatan']?></td>
                <td><a href="hapus_jurusan.php?id_jurusan=<?=$data_jurusan['id_jurusan']?>" onclick="return confirm('Apakah anda yakin menghapus data ini?')" class="btn btn-danger">Hapus</a></td>
                </tr>
                <?php
            }
            ?>
        </tbody>
    </table>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
    
</body>
</html>
<?php 
    include "header.php";
?>
<h2>Daftar Buku Di Keranjang</h2>
<table class="table table-hover table striped">
    <thead>
        <tr>
            <th>NO</th><th>JUDUL BUKU</th><th>JUMLAH</th><th>AKSI</th>
        </tr>
    </thead>
    <tbody>
        <?php 
        foreach (@$_SESSION['cart'] as $key_produk => $val_produk): ?> 
            <tr>
                <td><?=$key_produk+1?></td><td><?=$val_produk['judul_buku']?></td><td><?=$val_produk['qty']?></td>
                <td><a href="hapus_cart.php=<?=$key_produk?>" class="btn btn-danger"><strong>X</strong></a></td>
            </tr>
        <?php endforeach ?>
        ?>
    </tbody>
</table>
<a href="checkout.php" class="btn btn-primary">Check Out</a>
<?php 
include "footer.php";
?>
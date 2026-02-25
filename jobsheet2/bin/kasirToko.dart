import 'package:jobsheet2/jobsheet2.dart' as jobsheet2;

void main() {
  print('===== Tugas Praktikum 3: Aplikasi Kasir Toko =====');
  // 6. null aware operator (??)
  String? inputNama;
  String namaKasir = inputNama ?? "AdminLovi";

  // input tetapkan di awal
  double hargaBuku = 50000;
  int jumlahBeli = 2;
  bool isMember = true;

  // 7. increment (++)
  jumlahBeli++; // jumlah beli jadi 3 karena ada tambahan item promo

  // memanggil logika perhitungan dari lib
  double totalBayar = jobsheet2.hitungTotalPajak(hargaBuku, jumlahBeli);
  bool layakBonus = jobsheet2.cekKelayakanBonus(totalBayar, isMember);
  String pesan = jobsheet2.dapatkanPesan(layakBonus);

  // 8. type Test (is)
  String cekTipe = (totalBayar is double) ? "Valid berupa double" : "Invalid";

  print('Kasir            : $namaKasir');
  print('Status Data      : $cekTipe');
  print('Jumlah Barang    : $jumlahBeli');
  print('Total + PPN 11%  : Rp $totalBayar');
  print('Pesan Sistem     : $pesan');  
}
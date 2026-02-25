import 'package:jobsheet2/jobsheet2.dart' as jobsheet2;

void main() {
  print('===== Challenge Tambahan: Konversi unit (panjang, massa, volume, suhu) =====');

  var unit = jobsheet2.konversi();

  String kategori = 'panjang'; // pilih misalnya panjang
  double nilai = 2.5;         // angka yang mau dikonversi
  String dari = 'km';         // dari apa
  String ke = 'm';            // ke apa

  // validasi input tidak boleh negatif
  if (nilai < 0 && kategori != 'suhu') {
    print('Error, nilai $kategori tidak boleh negatif!');
  } else {
    double hasil = 0;

    // pemilihan menu
    if (kategori == 'panjang') {
      hasil = unit.hitung(nilai, dari, ke, unit.panjang);
    } else if (kategori == 'massa') {
      hasil = unit.hitung(nilai, dari, ke, unit.massa);
    } else if (kategori == 'volume') {
      hasil = unit.hitung(nilai, dari, ke, unit.volume);
    } else if (kategori == 'suhu') {
      hasil = unit.hitungSuhu(nilai, dari, ke);
    }

    print('Hasil: $nilai $dari = $hasil $ke');
  }
}
void main() {
  String nama = 'Lovie Jechonia Tonimba';
  String nim = '244107060101';

  double nilaiUnikNIM = double.parse(nim.substring(nim.length - 3));

  List<double> hargaBarang = [25000.500, 50000.0, 75000.500, 100000.0, 150000.0];
  hargaBarang.add(nilaiUnikNIM);

  String? pesanDiskon;
  double totalAwal = hitungTotal(hargaBarang);
  
  double diskon = 0;

  if (totalAwal > 200000) {
    diskon = totalAwal * 0.1;
    pesanDiskon = 'Selamat anda dapat diskon 10%';
  } else if (totalAwal >= 100000 && totalAwal <= 200000) {
    diskon = totalAwal * 0.05;
    pesanDiskon = 'Selamat anda dapat diskon 5%';
  } else {
    diskon = 0;
    pesanDiskon = 'Tidak dapat diskon';
  }

  double totalBelanja = totalAwal - diskon;

  print("=== STRUK BELANJA TOKO ===");
  print("Nama         : $nama");
  print("NIM          : $nim");
  print("Total Awal   : Rp $totalAwal");
  print("Keterangan   : ${pesanDiskon!}");
  print("Besar Diskon : Rp $diskon");
  print("Total Akhir  : Rp $totalBelanja");
}

double hitungTotal(List<double> hargaBarang) {
  double total = 0;
  for (var harga in hargaBarang) {
    total += harga;
  }
  return total;
}

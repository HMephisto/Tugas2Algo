program PenerimaanDanPengeluaranBarang;
{I.S.: Pengguna memilih salah satu nomor menu}
{F.S.: Menampilkan hasil sesuai nomor menu yang dipilih}

uses crt;

// Kamus Global
const
   MaksPenerimaanBarang = 20;
   MaksPengeluaranBarang = 20;
type
   ArrayAngkaMSK = array[1..MaksPenerimaanBarang] of integer;
   ArrayStringMSK = array[1..MaksPengeluaranBarang] of string;
   ArrayAngkaKLR = array[1..MaksPengeluaranBarang] of integer;
   ArrayStringKLR = array[1..MaksPengeluaranBarang] of string;
var
 

begin
   writeln('<< PROGRAM PENERIMAAN DAN PENGELUARAN BARANG MINIMARKET SUSAH MAJU >>');
   textcolor(15);
   writeln('1.PENERIMAAN BARANG');
   writeln('2.PENGELUARAN BARANG');
   writeln('0. Keluar');
   write('Pilihan Anda? '); readln(MenuMetode);
end.
e
program PenerimaanDanPengeluaranBarang;
{I.S.: Pengguna memilih salah satu nomor menu}
{F.S.: Menampilkan hasil sesuai nomor menu yang dipilih}

uses crt;

// Kamus Global
const
  MaksPenerimaanBarang = 20;
type
  ArrayAngkaMSK = array[1..MaksPenerimaanBarang] of integer;
  ArrayStringMSK = array[1..MaksPenerimaanBarang] of string;
var
  KodeBarangMSK, NamaBarangMSK, SupplierBarang, TanggalBarangMSK, TanggalBarangKLR, StatusBarang : ArrayStringMSK;
  JumlahBarangMSK, HargaBarangMsk : ArrayAngkaMSK;
  BanyakData, MenuPilihan : integer;

//subrutin menampilkan menu utama
procedure MenuUtama(var MenuPilihan : integer);
{I.S.: pengguna memilih salah satu nomor menu}
{F.S.: menghasilkan nomor menu yang dipilih}
begin
  writeln('<< PROGRAM PENERIMAAN DAN PENGELUARAN BARANG MINIMARKET SUSAH MAJU >>');
  textcolor(15);
  writeln('1. PENYAJIAN DATA BARANG');
  writeln('2. PENAMBAHAN DATA BARANG');
  writeln('3. PENGHAPUSAN DATA BARANG');
  writeln('4. PENGURUTAN DATA BARANG');
  writeln('5. PENCARIAN DATA BARANG');
  writeln('6. PENGELUARAN DATA BARANG');
  writeln('0. Keluar');
  write('Pilihan Anda? '); readln(MenuPilihan);
  //validasi menu metode
  while (MenuPilihan < 0) or (MenuPilihan > 6) do
  begin
    gotoxy(20,5); 
    write('Nomor Menu '); textcolor(12); write(MenuPilihan);
    textcolor(15); write(' tidak ada!');
    readln;
    gotoxy(15,5); clreol;
    textcolor(15); readln(MenuPilihan);
  end; //endwhile
end; //endprocedure

//subrutin penciptaan Kode Barang Masuk, Nama Barang Masuk, Jumlah Barang Masuk, Harga Barang Masuk, Tanggal Masuk Barang
procedure PenciptaanDataBarang(var JumlahBarangMSK, HargaBarangMsk : ArrayAngkaMSK; var KodeBarangMSK, NamaBarangMSK, SupplierBarang, TanggalBarangMSK, TanggalBarangKLR,StatusBarang: ArrayStringMSK);
{I.S.: diberikan Harga Awal Barang}
{F.S.: menghasilkan Penciptaan Harga Awal Barang}
var
  i : integer;
begin
  for i :=1 to MaksPenerimaanBarang do
    KodeBarangMSK[i] := '/';
    NamaBarangMSK[i] := '/';
    JumlahBarangMSK[i] := 0;
    HargaBarangMsk[i] := 0;
    SupplierBarang[i] := '/';
    TanggalBarangMSK[i] := '/';
    TanggalBarangKLR[i] := '/';
    StatusBarang[i] := '/';
end; //endprocedure


//subrutin menambah Data
procedure IsiPenerimaanBarang(var JumlahBarangMSK, HargaBarangMsk : ArrayAngkaMSK; var KodeBarangMSK, NamaBarangMSK, SupplierBarang, TanggalBarangMSK, StatusBarang: ArrayStringMSK; var BanyakData : integer);
{I.S.: pengguna memasukkan data penerimaan Barang}
{F.S.: Data sudah terdefinisikan}
begin
  if (BanyakData < MaksPenerimaanBarang)
    then
    begin
      BanyakData := BanyakData + 1;

      writeln('Data Penerimaan Barang');
      writeln('----------------------');
      textcolor(15);
      write('Kode Barang           :'); readln(KodeBarangMSK[BanyakData]);
      write('Nama Barang           :'); readln(NamaBarangMSK[BanyakData]);
      write('Jumlah Barang         :'); readln(JumlahBarangMSK[BanyakData]);
      write('Harga Barang          :'); readln(HargaBarangMsk[BanyakData]);
      write('Supplier Barang       :'); readln(SupplierBarang[BanyakData]);
      write('Tanggal Barang Masuk  :'); readln(TanggalBarangMSK[BanyakData]);
      StatusBarang[BanyakData] := 'Ada';
    end
    else
    begin
      clrscr; writeln('Data sudah penuh');
    end;
    writeln;
end; //endprocedure

//subrutin Tampilan Data PenerimaanBarang
procedure TampilPenerimaanBarang(var JumlahBarangMSK, HargaBarangMsk : ArrayAngkaMSK; var KodeBarangMSK, NamaBarangMSK, SupplierBarang, TanggalBarangMSK, TanggalBarangKLR, StatusBarang : ArrayStringMSK; var BanyakData : integer);
{I.S.: mengambil data barang}
{F.S.: menampilkan data barang}
var
  i : integer;
begin
  textcolor(yellow); write('<< DATA PENERIMAAN BARANG >>  ');
  textcolor(12); write('                       DATA PENERIMAAN BARANG');
  textcolor(yellow); writeln('------------------------------------------------------------------------------------------------------------------------------------');
  textcolor(yellow); writeln('| Kode Barang |    Nama Barang    |    Jumlah Barang    | Harga Barang | Supplier Barang | Tanggal Masuk | Tanggal Keluar | Status |');
  textcolor(yellow); writeln('------------------------------------------------------------------------------------------------------------------------------------');
  textcolor(15);

  for i := 1 to BanyakData do
  begin
    writeln('|', KodeBarangMSK[i]:11, '|', NamaBarangMSK[i]:17, '|         ', JumlahBarangMSK[i]:3, '         |      ', HargaBarangMsk[i]:7, '|', SupplierBarang[i], '|', TanggalBarangMSK[i], '|', TanggalBarangKLR[i], '|', StatusBarang[i], '|')
  end; //endfor
  writeln;
end; //endprocedure

//subrutin  menghapus Data penerimaan Barang di posisi baris dan kolom tertentu
procedure HapusAngka(var JumlahBarangMSK, HargaBarangMsk : ArrayAngkaMSK; var KodeBarangMSK, NamaBarangMSK, SupplierBarang, TanggalBarangMSK, TanggalBarangKLR, StatusBarang : ArrayStringMSK; var BanyakData : integer; PosisiHapus : integer);
{I.S: pengguna mengisi posisi yang ingin dihapus}
{F.S: menghapus Data yang ada pada posisi tertentu}
var
  i : integer;
begin
  if (BanyakData > 0)
    then
    begin
      if (PosisiHapus >= 1) and (PosisiHapus <= BanyakData)
        then
        begin
          textcolor(15); write('Data di posisi ke-');
          textcolor(12); write(PosisiHapus);
          textcolor(15); writeln(' berhasil dihapus');

          for i := (PosisiHapus + 1) to BanyakData do
          begin
            KodeBarangMSK[i-1] :=KodeBarangMSK[i];
            NamaBarangMSK[i-1] := NamaBarangMSK[i];
            JumlahBarangMSK[i-1] := JumlahBarangMSK[i];
            HargaBarangMsk[i-1] :=HargaBarangMsk[i];
            SupplierBarang[i-1] := SupplierBarang[i];
            TanggalBarangMSK[i-1] := TanggalBarangMSK[i];
            TanggalBarangKLR[i-1] := TanggalBarangKLR[i];
            StatusBarang[i-1] := StatusBarang[i];
          end;
          KodeBarangMSK[BanyakData] := '/';
          NamaBarangMSK[BanyakData] := '/';
          JumlahBarangMSK[BanyakData] := 0;
          HargaBarangMsk[BanyakData] := 0;
          SupplierBarang[BanyakData] := '/';
          TanggalBarangMSK[BanyakData] := '/';
          TanggalBarangKLR[BanyakData] := '/';
          StatusBarang[BanyakData] := '/';
          
          BanyakData := BanyakData - 1;
      end
      else
      begin
        clrscr;
        textcolor(15); write('Posisi hapus ke-');
        textcolor(12); write(PosisiHapus);
        textcolor(15); writeln(' tidak valid!');
      end;
    end
    else
    begin
      clrscr; textcolor(yellow); writeln('Data kosong');
    end;
    writeln;
end; //endprocedure

//subrutin

// Badan Program Utama
begin
  MenuUtama(MenuPilihan);
  PenciptaanDataBarang(JumlahBarangMSK, HargaBarangMsk, KodeBarangMSK, NamaBarangMSK, SupplierBarang, TanggalBarangMSK, TanggalBarangKLR, StatusBarang);
  while (MenuPilihan  <> 0) do
  begin
    clrscr;
    case (MenuPilihan) of
      1 : begin
            writeln('<< PENYAJIAN DATA BARANG >>');
            TampilPenerimaanBarang(JumlahBarangMSK, HargaBarangMsk, KodeBarangMSK, NamaBarangMSK, SupplierBarang, TanggalBarangMSK, TanggalBarangKLR, StatusBarang, BanyakData);
          end;
      2 : begin
            writeln('<< PENAMBAHAN DATA BARANG >>');
            IsiPenerimaanBarang(JumlahBarangMSK, HargaBarangMsk, KodeBarangMSK, NamaBarangMSK, SupplierBarang, TanggalBarangMSK, StatusBarang, BanyakData);
          end;
      3 : begin
            writeln('<< PENGHAPUSAN DATA BARANG >>');
          end;
      4 : begin
            writeln('<< PENGURUTAN DATA BARANG >>');
          end;
      5 : begin
            writeln('<< PENCARIAN DATA BARANG >>');
          end;
      6 : begin
            writeln('<< PENGELUARAN DATA BARANG >>');
          end;
    end; // endcase
    readln;
    clrscr;
    MenuUtama(MenuPilihan);
  end; // endwhile
end.

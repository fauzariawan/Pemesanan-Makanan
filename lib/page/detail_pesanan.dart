import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'halaman_utama.dart';

class DetailPesanan extends StatefulWidget {
  final List<dynamic> items;
  const DetailPesanan({Key? key, required this.items}) : super(key: key);

  @override
  _DetailPesananState createState() => _DetailPesananState();
}

class _DetailPesananState extends State<DetailPesanan> {
  List<dynamic> listOrder = [];
  int totalBelanja = 0;
  int totalQuantity = 0;
  @override
  void initState() {
    super.initState();
    for (var element in widget.items) {
      if (element['beli'] == true) {
        element['totalHarga'] = element['jumlah'] * element['price'];
        totalBelanja += int.parse(element['totalHarga'].toString());
        totalQuantity += int.parse(element['jumlah'].toString());
        listOrder.add(element);
      }
    }
    print(totalBelanja);
  }

  @override
  Widget build(BuildContext context) {
    var last = listOrder.length + 1;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail Pesanan'),
        ),
        body: listOrder.isEmpty
            ? const Center(
                child: Text('Anda Belum Memesan'),
              )
            : Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Pratinjau Transaksi',
                        style: GoogleFonts.poppins(fontSize: 16)),
                    const Divider(),
                    Expanded(
                      child: ListView.builder(
                          itemCount: listOrder.length + 1,
                          itemBuilder: (context, i) {
                            return last == i + 1
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Divider(),
                                      Text('Pratinjau Biaya',
                                          style: GoogleFonts.poppins(
                                              fontSize: 16)),
                                      const Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Total Quantity',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14)),
                                          Text(
                                            totalQuantity.toString(),
                                            style: GoogleFonts.poppins(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Total Harga',
                                            style: GoogleFonts.poppins(
                                                fontSize: 14),
                                          ),
                                          Text(
                                            NumberFormat.currency(
                                                    locale: 'id',
                                                    symbol: 'Rp ',
                                                    decimalDigits: 0)
                                                .format(
                                              totalBelanja,
                                            ),
                                            style: GoogleFonts.poppins(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      // const Spacer(),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: ElevatedButton(
                                            onPressed: () {
                                              showDialog(
                                                  barrierColor: Colors.black
                                                      .withOpacity(0.2),
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return const SpinKitCircle(
                                                      size: 50,
                                                      color: Colors.blue,
                                                    );
                                                  });
                                              Timer(const Duration(seconds: 2),
                                                  complete);
                                            },
                                            child: Text(
                                              'Bayar',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 20),
                                            )),
                                      )
                                    ],
                                  )
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        listOrder[i]['name'],
                                        style:
                                            GoogleFonts.poppins(fontSize: 14),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            NumberFormat.currency(
                                                    locale: 'id',
                                                    symbol: 'Rp ',
                                                    decimalDigits: 0)
                                                .format(
                                              listOrder[i]['price'],
                                            ),
                                          ),
                                          Text(listOrder[i]['jumlah']
                                              .toString()),
                                          Text(
                                            NumberFormat.currency(
                                                    locale: 'id',
                                                    symbol: 'Rp ',
                                                    decimalDigits: 0)
                                                .format(
                                              listOrder[i]['totalHarga'],
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      )
                                    ],
                                  );
                          }),
                    ),
                  ],
                ),
              ));
  }

  void complete() {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Pesanan Akan Segera Kami antar, Selamat Menikmati !!!'),
    ));
    Timer(const Duration(seconds: 2), halamanUtama);
  }

  void halamanUtama() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const HalamanUtama(
              title: 'Jajanan Nusantara',
            )));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'detail_pesanan.dart';

class HalamanUtama extends StatefulWidget {
  final String title;
  const HalamanUtama({Key? key, required this.title}) : super(key: key);

  @override
  _HalamanUtamaState createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  TextEditingController search = TextEditingController();
  List<dynamic> items = [
    {
      "id": 1,
      "name": "CILOK",
      "desc": "Jajanan Nusantara",
      "pic": "assets/images/cilok.jpg",
      "price": 8000
    },
    {
      "id": 2,
      "name": "EMPEK-EMPEK",
      "desc": "Jajanan Nusantara",
      "pic": "assets/images/empekempek.jpg",
      "price": 12000
    },
    {
      "id": 3,
      "name": "ES DAWET",
      "desc": "Jajanan Nusantara",
      "pic": "assets/images/esdawet.jpg",
      "price": 5000
    },
    {
      "id": 4,
      "name": "KELEPON",
      "desc": "Jajanan Nusantara",
      "pic": "assets/images/kelepon.jpg",
      "price": 7000
    },
    {
      "id": 5,
      "name": "LONTONG",
      "desc": "Jajanan Nusantara",
      "pic": "assets/images/lontong.jpg",
      "price": 10000
    },
    {
      "id": 6,
      "name": "LUPIS",
      "desc": "Jajanan Nusantara",
      "pic": "assets/images/lupis.jpg",
      "price": 5000
    },
    {
      "id": 7,
      "name": "RISOL",
      "desc": "Jajanan Nusantara",
      "pic": "assets/images/risol.jpg",
      "price": 15000
    },
    {
      "id": 8,
      "name": "SERABI DURIAN",
      "desc": "Jajanan Nusantara",
      "pic": "assets/images/sarabiduren.jpeg",
      "price": 10000
    },
  ];
  int totalPesanan = 0;
  List daftarPesanan = [];
  List<dynamic> cadangan = [
    {
      "id": 1,
      "name": "CILOK",
      "desc": "Jajanan Nusantara",
      "pic": "assets/images/cilok.jpg",
      "price": 8000
    },
    {
      "id": 2,
      "name": "EMPEK-EMPEK",
      "desc": "Jajanan Nusantara",
      "pic": "assets/images/empekempek.jpg",
      "price": 12000
    },
    {
      "id": 3,
      "name": "ES DAWET",
      "desc": "Jajanan Nusantara",
      "pic": "assets/images/esdawet.jpg",
      "price": 5000
    },
    {
      "id": 4,
      "name": "KELEPON",
      "desc": "Jajanan Nusantara",
      "pic": "assets/images/kelepon.jpg",
      "price": 7000
    },
    {
      "id": 5,
      "name": "LONTONG",
      "desc": "Jajanan Nusantara",
      "pic": "assets/images/lontong.jpg",
      "price": 10000
    },
    {
      "id": 6,
      "name": "LUPIS",
      "desc": "Jajanan Nusantara",
      "pic": "assets/images/lupis.jpg",
      "price": 5000
    },
    {
      "id": 7,
      "name": "RISOL",
      "desc": "Jajanan Nusantara",
      "pic": "assets/images/risol.jpg",
      "price": 15000
    },
    {
      "id": 8,
      "name": "SERABI DURIAN",
      "desc": "Jajanan Nusantara",
      "pic": "assets/images/sarabiduren.jpeg",
      "price": 10000
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(elevation: 0),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailPesanan(items: items)));
            },
            child: const Text('Checkout'))
      ], title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    controller: search,
                    onChanged: (search) {
                      String tes = search.toUpperCase();
                      print(tes);
                      List<dynamic> filter = cadangan
                          .where((item) => item['name'].contains(tes))
                          .toList();
                      setState(() {
                        items = filter;
                      });
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Cari Menu Favourite Kamu'),
                  )),
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(
                    Icons.search,
                    size: 30,
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, i) {
                    return Container(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                items[i]['pic'],
                                width: 100,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    items[i]["name"],
                                    style: GoogleFonts.poppins(fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(items[i]['desc']),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    NumberFormat.currency(
                                            locale: 'id',
                                            symbol: 'Rp ',
                                            decimalDigits: 0)
                                        .format(
                                      items[i]['price'],
                                    ),
                                    style: GoogleFonts.poppins(fontSize: 16),
                                  )
                                ],
                              ),
                            ],
                          ),
                          items[i]['beli'] == true
                              ? Row(
                                  children: [
                                    SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 2),
                                              textStyle: const TextStyle()),
                                          onPressed: () {
                                            setState(() {
                                              items[i]['jumlah'] = 0;
                                              items[i]['beli'] = false;
                                            });
                                          },
                                          child: const Icon(Icons.delete)),
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 2),
                                              textStyle: const TextStyle()),
                                          onPressed: () {
                                            setState(() {
                                              items[i]['jumlah'] -= 1;
                                              if (items[i]['jumlah'] == 0) {
                                                items[i]['beli'] = false;
                                              }
                                            });
                                          },
                                          child: const Icon(Icons.remove)),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(items[i]['jumlah'].toString()),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 2),
                                              textStyle: const TextStyle()),
                                          onPressed: () {
                                            setState(() {
                                              items[i]['jumlah'] += 1;
                                            });
                                          },
                                          child: const Icon(Icons.add)),
                                    ),
                                  ],
                                )
                              : ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      items[i]['beli'] = true;
                                      items[i]['jumlah'] = 1;
                                    });
                                  },
                                  child: const Text('Beli'))
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

// class Item {
//   final int id;
//   final String name;
//   final String desc;
//   final String pic;

//   Item(this.id, this.name, this.desc, this.pic);
// }

// List<Item> items = [
//   Item(1, 'Cilok', 'Makanan Asli Nusantara', 'assets/images/cilok.jpg'),
//   Item(2, 'Empek-Empek', 'Makanan Asli Nusantara',
//       'assets/images/empekempek.jpg'),
//   Item(3, 'Es Dawet', 'Makanan Asli Nusantara', 'assets/images/esdawet.jpg'),
//   Item(4, 'kelepon', 'Makanan Asli Nusantara', 'assets/images/kelepon.jpg'),
//   Item(5, 'lontong', 'Makanan Asli Nusantara', 'assets/images/lontong.jpg'),
//   Item(6, 'lupis', 'Makanan Asli Nusantara', 'assets/images/lupis.jpg'),
//   Item(7, 'risol', 'Makanan Asli Nusantara', 'assets/images/risol.jpg'),
//   Item(8, 'Sarabi Durian', 'Makanan Asli Nusantara',
//       'assets/images/sarabiduren.jpg'),
// ];

// ListView(
//           shrinkWrap: true,
//           children: [
//             GridView.builder(
//                 physics: NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     mainAxisSpacing: 2, // memberikan jarang yang bawah dan atas
//                     crossAxisSpacing: 2,
//                     // mainAxisExtent: MediaQuery.of(context).size.width > 500 ? 200 : 100,
//                     childAspectRatio: 1),
//                 itemCount: items.length,
//                 itemBuilder: (BuildContext context, i) {
//                   return AnimationConfiguration.staggeredGrid(
//                     columnCount: items.length,
//                     position: i,
//                     duration: const Duration(milliseconds: 500),
//                     child: ScaleAnimation(
//                       scale: 0.5,
//                       child: FadeInAnimation(
//                           child: Column(
//                         children: [
// Row(
//   children: [
//     Image.asset(
//       items[i]['pic'],
//       width: 100,
//     ),
//     Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(items[i]["name"]),
//         Text(items[i]['desc']),
//         Text(items[i]['price'].toString())
//       ],
//     )
//   ],
// )
//                         ],
//                       )
//                           // Column(
//                           //   children: <Widget>[
//                           //     ClipRRect(
//                           //       borderRadius: BorderRadius.circular(10.0),
//                           //       child: Image.asset(menu[i]['picture'],
//                           //           fit: BoxFit.fill,
//                           //           width: MediaQuery.of(context).size.width / 6 - 5),
//                           //     ),
//                           //     Center(
//                           //       child: Text(menu[i]['title'],
//                           //           style: TextStyle(
//                           //               fontSize: 12.0,
//                           //               fontWeight: FontWeight.bold,
//                           //               color: Warna.warna(biru)),
//                           //           textAlign: TextAlign.center),
//                           //     ),
//                           //   ],
//                           // ),
//                           ),
//                     ),
//                   );
//                 }),
//           ],
//         ),

// if (daftarPesanan.isEmpty) {
                                //   print('daftar pesanan kosong');
                                //   setState(() {
                                //     daftarPesanan.add(pesanan);
                                //   });
                                // } else {
                                //   bool ketemu = false;
                                // daftarPesanan.map((e) {
                                //   var i = daftarPesanan.indexOf(e);
                                //   if (pesanan['id'] == e['id']) {
                                //     print('id sama');
                                //     e['jumlah'] += 1;
                                //     ketemu = true;
                                //   } else {
                                //     print('id tidak sama');
                                //     if (ketemu == false &&
                                //         i == daftarPesanan.length - 1) {
                                //       daftarPesanan.add(pesanan);
                                //     }
                                //   }
                                // });

                                // for (var j = 0; j < daftarPesanan.length; j++) {
                                //   if (pesanan['id'] == daftarPesanan[j]['id']) {
                                //     daftarPesanan[j]['jumlah'] += 1;
                                //     ketemu = true;
                                //   } else {
                                //     if (ketemu == false &&
                                //         j == daftarPesanan.length - 1) {
                                //       daftarPesanan.add(pesanan);
                                //       break;
                                //     }
                                //   }
                                // }
                                // }
                                //
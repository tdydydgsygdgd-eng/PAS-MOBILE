import 'dart:convert';
import 'package:flutter_application_2/model/produk_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class ListProdukController extends GetxController {
  var isLoading = false.obs;

  // API e-commerce (bisa diganti URL dari guru jika ada)
  final String apiUrl = "https://kolzsticks.github.io/Free-Ecommerce-Products-Api/main/products.json";

  final List<ProdukModel> _dataAwal = [
    ProdukModel(
      namaProduk: "Sepatu Sneakers Pria Casual",
      harga: "Rp 350.000",
      deskripsi:
          "Sepatu sneakers kasual dengan bahan kanvas premium, nyaman dipakai sehari-hari dan anti selip.",
      review: "Model keren, pas di kaki dan bahannya sangat nyaman.",
      rating: 4.8,
      namaToko: "Fashion Official Store",
      imageUrl:
          "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500&q=80",
    ),
    ProdukModel(
      namaProduk: "Kaos Polos Cotton Combed 30s",
      harga: "Rp 65.000",
      deskripsi:
          "Kaos polos pria dan wanita bahan 100% cotton combed 30s, adem, lembut, dan menyerap keringat.",
      review: "Bahannya adem banget, jahitan rapih.",
      rating: 4.9,
      namaToko: "Apparel Basic Store",
      imageUrl:
          "https://images.unsplash.com/photo-1521572267360-ee0c2909d518?w=500&q=80",
    ),
    ProdukModel(
      namaProduk: "Jaket Hoodie Zipper Fleece",
      harga: "Rp 185.000",
      deskripsi:
          "Jaket hoodie resleting berbahan fleece tebal dan lembut, cocok untuk udara dingin dan santai.",
      review: "Bahan tebal dan hangat, warnanya juga sesuai foto.",
      rating: 4.7,
      namaToko: "Urban Streetwear",
      imageUrl:
          "https://images.unsplash.com/photo-1556905055-8f358a7a47b2?w=500&q=80",
    ),
    ProdukModel(
      namaProduk: "Smartwatch Sport Waterproof",
      harga: "Rp 450.000",
      deskripsi:
          "Jam tangan pintar dengan fitur pemantau detak jantung, notifikasi pesan, dan tahan air IP68.",
      review: "Fitur lengkap, baterai tahan lama sampai 5 hari.",
      rating: 4.9,
      namaToko: "Gadget Corner",
      imageUrl:
          "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500&q=80",
    ),
    ProdukModel(
      namaProduk: "Tas Ransel Laptop USB Port",
      harga: "Rp 220.000",
      deskripsi:
          "Tas ransel kerja dan kuliah muat laptop 15.6 inch, dilengkapi port USB charger dan bahan water repellent.",
      review: "Bagus dan kokoh, muat banyak barang bawaan.",
      rating: 4.6,
      namaToko: "Bagpack Center",
      imageUrl:
          "https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=500&q=80",
    ),
  ];
RxList<ProdukModel> listProduk = <ProdukModel>[].obs;

@override
  void onInit() {
    super.onInit();
    // Tampilkan data awal dulu agar tampilan tidak kosong
    listProduk.assignAll(_dataAwal);
    // Otomatis tarik data dari API
    fetchProdukFromApi();
  }

  Future<void> fetchProdukFromApi() async {
    try {
      isLoading.value = true;
      final response = await http
          .get(Uri.parse(apiUrl))
          .timeout(const Duration(seconds: 15));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        final List<ProdukModel> produkDariApi =
            data.map((item) => ProdukModel.fromJson(item)).toList();

        if (produkDariApi.isNotEmpty) {
          listProduk.assignAll(produkDariApi);
        }
      }
    } catch (e) {
      // Jika jaringan offline atau gagal, data tetap aman memakai _dataAwal
    } finally {
      isLoading.value = false;
    }
  }

  void hapusProduk(int index) {
    listProduk.removeAt(index);
  }

  Future<void> refreshProduk() async {
    await fetchProdukFromApi();
  }
}
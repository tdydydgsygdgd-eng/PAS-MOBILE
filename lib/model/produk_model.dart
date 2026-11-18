class ProdukModel {
  String namaProduk;
  String harga;
  String deskripsi;
  String review;
  double rating;
  String namaToko;
  String imageUrl;

  ProdukModel({
    required this.namaProduk,
    required this.harga,
    required this.deskripsi,
    required this.review,
    required this.rating,
    required this.namaToko,
    required this.imageUrl,
  });

  factory ProdukModel.fromJson(Map<String, dynamic> json) {
    String nama = json['name'] ?? json['title'] ?? 'Produk';
    String harga = (json['price'] ?? json['priceCents'] ?? 0).toString();
    String deskripsi = json['description'] ?? '';
    deskripsi = deskripsi.replaceAll(RegExp(r'<[^>]*>'), '').trim();

    String image = '';
    if (json['image'] is String) {
      image = json['image'];
    } else if (json['images'] is List && (json['images'] as List).isNotEmpty) {
      image = json['images'][0]['src'] ?? '';
    }
    if (image.isEmpty) {
      image = 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500&q=80';
    }

    double rate = 4.5;
    if (json['rating'] is Map && json['rating']['rate'] != null) {
      rate = (json['rating']['rate'] as num).toDouble();
    } else if (json['average_rating'] != null) {
      rate = double.tryParse(json['average_rating'].toString()) ?? 4.5;
    }

    String toko =
        json['category'] ?? json['store']?['name'] ?? 'Official Store';
    String review = 'Produk original dan berkualitas tinggi.';

    return ProdukModel(
      namaProduk: nama,
      harga: 'Rp ${json['price'] ?? json['priceCents'] ?? 0}',
      deskripsi: deskripsi.isNotEmpty
          ? deskripsi
          : 'Deskripsi produk berkualitas tinggi.',
      review: review,
      rating: rate,
      namaToko: toko.toUpperCase(),
      imageUrl: image,
    );
  }
}

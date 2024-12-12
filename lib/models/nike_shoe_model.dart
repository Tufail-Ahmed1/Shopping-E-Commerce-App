class NikeShoesModel {
  final Healthcheck healthcheck;
  final List<Sneaker> sneakers;

  NikeShoesModel({
    required this.healthcheck,
    required this.sneakers,
  });

  factory NikeShoesModel.fromJson(Map<String, dynamic> json) {
    return NikeShoesModel(
      healthcheck: Healthcheck.fromJson(json['healthcheck']),
      sneakers: (json['sneakers'] as List)
          .map((item) => Sneaker.fromJson(item))
          .toList(),
    );
  }
}

class Healthcheck {
  final String message;

  Healthcheck({required this.message});

  factory Healthcheck.fromJson(Map<String, dynamic> json) {
    return Healthcheck(message: json['message']);
  }
}

class Sneaker {
  final BoxCondition boxCondition;
  final BrandName brandName;
  final List<Category> category;
  final List<String> collectionSlugs;
  final String color;
  final String designer;
  final String details;
  final List<Gender> gender;
  final String gridPictureUrl;
  final bool hasPicture;
  final bool hasStock;
  final int id;
  final List<String> keywords;
  final String mainPictureUrl;
  final Midsole? midsole;
  final String name;
  final String nickname;
  final String originalPictureUrl;
  final int productTemplateId;
  final DateTime? releaseDate;
  final int? releaseDateUnix;
  final int? releaseYear;
  final int? retailPriceCents;
  final ShoeCondition shoeCondition;
  final String silhouette;
  final List<double> sizeRange;
  final String sku;
  final String slug;
  final Status status;
  final String? storyHtml;
  final UpperMaterial? upperMaterial;

  Sneaker({
    required this.boxCondition,
    required this.brandName,
    required this.category,
    required this.collectionSlugs,
    required this.color,
    required this.designer,
    required this.details,
    required this.gender,
    required this.gridPictureUrl,
    required this.hasPicture,
    required this.hasStock,
    required this.id,
    required this.keywords,
    required this.mainPictureUrl,
    required this.midsole,
    required this.name,
    required this.nickname,
    required this.originalPictureUrl,
    required this.productTemplateId,
    required this.releaseDate,
    required this.releaseDateUnix,
    required this.releaseYear,
    required this.retailPriceCents,
    required this.shoeCondition,
    required this.silhouette,
    required this.sizeRange,
    required this.sku,
    required this.slug,
    required this.status,
    required this.storyHtml,
    required this.upperMaterial,
  });

  factory Sneaker.fromJson(Map<String, dynamic> json) {
    return Sneaker(
      boxCondition: BoxCondition.values.firstWhere(
            (e) => e.name.toUpperCase() == json['boxCondition']?.toUpperCase(),
        orElse: () => BoxCondition.NO_ORIGINAL_BOX, // Default if null
      ),
      brandName: BrandName.values.firstWhere(
            (e) => e.name.toUpperCase() == json['brandName']?.toUpperCase(),
        orElse: () => BrandName.NIKE, // Default if null
      ),
      category: (json['category'] as List?)?.map((e) => Category.values.firstWhere(
            (val) => val.name.toUpperCase() == e?.toUpperCase(),
        orElse: () => Category.OTHER, // Default if null
      )).toList() ?? [],
      collectionSlugs: List<String>.from(json['collectionSlugs'] ?? []), // Empty list if null
      color: json['color'] ?? 'Unknown Color',
      designer: json['designer'] ?? 'Unknown Designer',
      details: json['details'] ?? 'No Details Available',
      gender: (json['gender'] as List?)?.map((e) => Gender.values.firstWhere(
            (val) => val.name.toUpperCase() == e?.toUpperCase(),
        orElse: () => Gender.MEN, // Default if null
      )).toList() ?? [],
      gridPictureUrl: json['gridPictureUrl'] ?? '',
      hasPicture: json['hasPicture'] ?? false,
      hasStock: json['hasStock'] ?? false,
      id: json['id'] ?? 0,
      keywords: List<String>.from(json['keywords'] ?? []), // Empty list if null
      mainPictureUrl: json['mainPictureUrl'] ?? '',
      midsole: json['midsole'] != null
          ? Midsole.values.firstWhere(
            (e) => e.name.toUpperCase() == json['midsole']?.toUpperCase(),
        orElse: () => Midsole.EMPTY,
      )
          : null,
      name: json['name'] ?? 'Unnamed',
      nickname: json['nickname'] ?? 'No Nickname',
      originalPictureUrl: json['originalPictureUrl'] ?? '',
      productTemplateId: json['productTemplateId'] ?? 0,
      releaseDate: json['releaseDate'] != null
          ? DateTime.tryParse(json['releaseDate']) // Use tryParse for safety
          : null,
      releaseDateUnix: json['releaseDateUnix'],
      releaseYear: json['releaseYear'],
      retailPriceCents: json['retailPriceCents'],
      shoeCondition: ShoeCondition.values.firstWhere(
            (e) => e.name.toUpperCase() == json['shoeCondition']?.toUpperCase(),
        orElse: () => ShoeCondition.NEW_NO_DEFECTS, // Default if null
      ),
      silhouette: json['silhouette'] ?? 'Unknown Silhouette',
      sizeRange: List<double>.from(json['sizeRange'] ?? []), // Empty list if null
      sku: json['sku'] ?? '',
      slug: json['slug'] ?? '',
      status: Status.values.firstWhere(
            (e) => e.name.toUpperCase() == json['status']?.toUpperCase(),
        orElse: () => Status.ACTIVE, // Default if null
      ),
      storyHtml: json['storyHtml'],
      upperMaterial: json['upperMaterial'] != null
          ? UpperMaterial.values.firstWhere(
            (e) => e.name.toUpperCase() == json['upperMaterial']?.toUpperCase(),
        orElse: () => UpperMaterial.EMPTY,
      )
          : null,
    );
  }
}
enum BoxCondition {
  BADLY_DAMAGED,
  GOOD_CONDITION,
  MISSING_LID,
  NO_ORIGINAL_BOX
}

enum BrandName {
  ADIDAS,
  AIR_JORDAN,
  CHAMPION,
  CONVERSE,
  GUCCI,
  NIKE,
  VANS
}

enum Category {
  BASKETBALL,
  LIFESTYLE,
  OTHER,
  RUNNING,
  SKATEBOARDING
}

enum Gender {
  MEN,
  WOMEN,
  YOUTH
}

enum Midsole {
  AIR,
  BOOST,
  EMPTY
}

enum ShoeCondition {
  NEW_NO_DEFECTS,
  NEW_WITH_DEFECTS,
  USED
}

enum Status {
  ACTIVE
}

enum UpperMaterial {
  EMPTY,
  FLYKNIT,
  LEATHER,
  PATENT_LEATHER,
  PRIMEKNIT
}

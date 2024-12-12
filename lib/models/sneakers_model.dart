
class SneakersModel {
  final Healthcheck healthcheck;
  final List<Sneaker> sneakers;

  SneakersModel({
    required this.healthcheck,
    required this.sneakers,
  });

  factory SneakersModel.fromJson(Map<String, dynamic> json) {
    return SneakersModel(
      healthcheck: Healthcheck.fromJson(json['healthcheck']),
      sneakers: List<Sneaker>.from(
        json['sneakers'].map((x) => Sneaker.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
    'healthcheck': healthcheck.toJson(),
    'sneakers': sneakers.map((x) => x.toJson()).toList(),
  };
}

class Healthcheck {
  final String message;

  Healthcheck({required this.message});

  factory Healthcheck.fromJson(Map<String, dynamic> json) {
    return Healthcheck(message: json['message']);
  }

  Map<String, dynamic> toJson() => {
    'message': message,
  };
}

class Sneaker {
  final BoxCondition boxCondition;
  final BrandName brandName;
  final List<Category> category;
  final List<String> collectionSlugs;
  final String color;
  final Designer designer;
  final String details;
  final List<Gender> gender;
  final String gridPictureUrl;
  final bool hasPicture;
  final bool hasStock;
  final int id;
  final List<String> keywords;
  final String mainPictureUrl;
  final Midsole midsole;
  final String name;
  final String nickname;
  final String originalPictureUrl;
  final int productTemplateId;
  final DateTime? releaseDate;
  final int? releaseDateUnix;
  final int? releaseYear;
  final int retailPriceCents;
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
      boxCondition: BoxCondition.values.byNameIgnoreCase(json['box_condition']),
      brandName: BrandName.values.byNameIgnoreCase(json['brand_name']),
      category: List<Category>.from(
        json['category'].map((x) => Category.values.byNameIgnoreCase(x)),
      ),
      collectionSlugs: List<String>.from(json['collection_slugs']),
      color: json['color'],
      designer: Designer.values.byNameIgnoreCase(json['designer']),
      details: json['details'],
      gender: List<Gender>.from(
        json['gender'].map((x) => Gender.values.byNameIgnoreCase(x)),
      ),
      gridPictureUrl: json['grid_picture_url'],
      hasPicture: json['has_picture'],
      hasStock: json['has_stock'],
      id: json['id'],
      keywords: List<String>.from(json['keywords']),
      mainPictureUrl: json['main_picture_url'],
      midsole: Midsole.values.byNameIgnoreCase(json['midsole']),
      name: json['name'],
      nickname: json['nickname'],
      originalPictureUrl: json['original_picture_url'],
      productTemplateId: json['product_template_id'],
      releaseDate: json['release_date'] != null
          ? DateTime.parse(json['release_date'])
          : null,
      releaseDateUnix: json['release_date_unix'],
      releaseYear: json['release_year'],
      retailPriceCents: json['retail_price_cents'],
      shoeCondition: ShoeCondition.values.byNameIgnoreCase(json['shoe_condition']),
      silhouette: json['silhouette'],
      sizeRange: List<double>.from(
        json['size_range'].map((x) => (x is int) ? (x.toDouble()) : x),
      ),
      sku: json['sku'],
      slug: json['slug'],
      status: Status.values.byNameIgnoreCase(json['status']),
      storyHtml: json['story_html'],
      upperMaterial: json['upper_material'] != null
          ? UpperMaterial.values.byNameIgnoreCase(json['upper_material'])
          : null,
    );
  }


  Map<String, dynamic> toJson() => {
    'box_condition': boxCondition.name,
    'brand_name': brandName.name,
    'category': category.map((x) => x.name).toList(),
    'collection_slugs': collectionSlugs,
    'color': color,
    'designer': designer.name,
    'details': details,
    'gender': gender.map((x) => x.name).toList(),
    'grid_picture_url': gridPictureUrl,
    'has_picture': hasPicture,
    'has_stock': hasStock,
    'id': id,
    'keywords': keywords,
    'main_picture_url': mainPictureUrl,
    'midsole': midsole.name,
    'name': name,
    'nickname': nickname,
    'original_picture_url': originalPictureUrl,
    'product_template_id': productTemplateId,
    'release_date': releaseDate?.toIso8601String(),
    'release_date_unix': releaseDateUnix,
    'release_year': releaseYear,
    'retail_price_cents': retailPriceCents,
    'shoe_condition': shoeCondition.name,
    'silhouette': silhouette,
    'size_range': sizeRange,
    'sku': sku,
    'slug': slug,
    'status': status.name,
    'story_html': storyHtml,
    'upper_material': upperMaterial?.name,
  };
}

extension EnumParsing<T> on List<T> {
  T byNameIgnoreCase(String name) {
    return firstWhere(
          (value) => value.toString().split('.').last.toLowerCase() == name.toLowerCase(),
      orElse: () => this[0], // Default value if no match
    );
  }
}

enum BoxCondition {
  GOOD_CONDITION,
  NO_ORIGINAL_BOX
}

enum BrandName {
  AIR_JORDAN
}

enum Category {
  BASKETBALL,
  LIFESTYLE
}

enum Designer {
  PETER_MOORE,
  TINKER_HATFIELD
}

enum Gender {
  MEN,
  WOMEN,
  YOUTH
}

enum Midsole {
  AIR
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
  LEATHER,
  PATENT_LEATHER
}

class ListOfRecipesModel {
  String? id;
  String? fats;
  String? name;
  String? time;
  String? image;
  List<String>? weeks;
  String? carbos;
  String? fibers;
  double? rating;
  String? country;
  int? ratings;
  String? calories;
  String? headline;
  List<String>? keywords;
  List<String>? products;
  String? proteins;
  int? favorites;
  bool  ?isFavorites ;
  int? difficulty;
  String? description;
  bool? highlighted;
  List<String>? ingredients;
  String? incompatibilities;
  List<String>? deliverableIngredients;
  List<String>? undeliverableIngredients;

  ListOfRecipesModel(
      {this.id,
        this.fats,
        this.name,
        this.time,
        this.isFavorites  ,
        this.image,
        this.weeks,
        this.carbos,
        this.fibers,
        this.rating,
        this.country,
        this.ratings,
        this.calories,
        this.headline,
        this.keywords,
        this.products,
        this.proteins,
        this.favorites,
        this.difficulty,
        this.description,
        this.highlighted,
        this.ingredients,
        this.incompatibilities,
        this.deliverableIngredients,
        this.undeliverableIngredients});

  ListOfRecipesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fats = json['fats'];
    isFavorites = json['isFavorites'];
    name = json['name'];
    time = json['time'];
    image = json['image'];
    weeks = json['weeks'].cast<String>();
    carbos = json['carbos'];
    fibers = json['fibers'];
    rating = json['rating']!=null?double.parse(json['rating'].toString()):0;
    country = json['country'];
    ratings = json['ratings'];
    calories = json['calories'];
    headline = json['headline'];
    keywords = json['keywords'].cast<String>();
    products = json['products'].cast<String>();
    proteins = json['proteins'];
    favorites = json['favorites'];
    difficulty = json['difficulty'];
    description = json['description'];
    highlighted = json['highlighted'];
    ingredients = json['ingredients'].cast<String>();
    incompatibilities = json['incompatibilities'];
    deliverableIngredients = json['deliverable_ingredients'].cast<String>();
    undeliverableIngredients = json['undeliverable_ingredients'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fats'] = fats;
    data['isFavorites'] = isFavorites;
    data['name'] = name;
    data['time'] = time;
    data['image'] = image;
    data['weeks'] = weeks;
    data['carbos'] = carbos;
    data['fibers'] = fibers;
    data['rating'] = rating;
    data['country'] = country;
    data['ratings'] = ratings;
    data['calories'] = calories;
    data['headline'] = headline;
    data['keywords'] = keywords;
    data['products'] = products;
    data['proteins'] = proteins;
    data['favorites'] = favorites;
    data['difficulty'] = difficulty;
    data['description'] = description;
    data['highlighted'] = highlighted;
    data['ingredients'] = ingredients;
    data['incompatibilities'] = incompatibilities;
    data['deliverable_ingredients'] = deliverableIngredients;
    data['undeliverable_ingredients'] = undeliverableIngredients;
    return data;
  }
}

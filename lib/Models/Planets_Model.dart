class Planets {
  String no;
  String name;
  String diameter;
  String leanthOfYear;
  String leanthOfDay;
  String numberOfMoons;
  String temperature;
  String surfaceArea;
  String gravity;
  String velocity;
  String distance;
  String description;
  String image;
  String hero;
  List<String> images;
  bool favorite;

  Planets({
    required this.no,
    required this.name,
    required this.diameter,
    required this.leanthOfYear,
    required this.leanthOfDay,
    required this.numberOfMoons,
    required this.temperature,
    required this.surfaceArea,
    required this.gravity,
    required this.velocity,
    required this.distance,
    required this.description,
    required this.image,
    required this.hero,
    required this.images,
    required this.favorite,
  });

  factory Planets.fromJson(Map<String, dynamic> json) => Planets(
        no: json["no"],
        name: json["name"],
        diameter: json["diameter"],
        leanthOfYear: json["leanthOfYear"],
        leanthOfDay: json["leanthOfDay"],
        numberOfMoons: json["numberOfMoons"],
        temperature: json["temperature"],
        surfaceArea: json["surfaceArea"],
        gravity: json["gravity"],
        velocity: json["velocity"],
        distance: json["distance"],
        description: json["description"],
        image: json["image"],
        hero: json["hero"],
        images: List<String>.from(json["images"].map((x) => x)),
        favorite: false,
      );
}

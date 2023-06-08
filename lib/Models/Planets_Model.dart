
class Planets {
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

  Planets({
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
  });

  factory Planets.fromJson(Map<String, dynamic> json) => Planets(
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
      );
}

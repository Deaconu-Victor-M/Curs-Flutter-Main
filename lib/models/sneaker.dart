/// Representation of a sneaker from the API
class Sneaker {
  /// Unique ID
  final String id;

  /// Sneaker Brand, ie: adidas (all lowercase, no spaces)
  final String brand;

  /// The sneaker's model / display name
  final String name;

  /// The sneaker's price
  final double price;

  /// Link to the sneaker's image
  final String imageLink;

  /// Brand's description for this sneaker
  ///
  /// Non-null only if it's the result from /sneaker/id
  final String? description;

  /// Official page link
  ///
  /// Non-null only if it's the result from /sneaker/id
  final String? pageUrl;

  /// Constructor
  Sneaker(
    this.id,
    this.brand,
    this.name,
    this.price,
    this.imageLink,
    this.description,
    this.pageUrl,
  );

  /// Create a [Sneaker] from json received from the API
  factory Sneaker.fromJson(dynamic json) {
    if (json.containsKey('desc') && json.containsKey('url')) {
      return Sneaker(
        json['id'],
        json['brand'],
        json['name'],
        json['price'],
        json['image'],
        json['desc'],
        json['url'],
      );
    }

    return Sneaker(
      json['id'],
      json['brand'],
      json['name'],
      json['price'],
      json['image'],
      null,
      null,
    );
  }

  @override
  String toString() {
    return "Sneaker: {brand: ${this.brand}, name: ${this.name}, price: ${this.price}}";
  }
}

class Movement {
  final double x;
  final double y;
  final double z;

  Movement({required this.x, required this.y, required this.z});

  Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
        "z": z,
      };
}

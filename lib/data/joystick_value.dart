class JoystickValue {
  final double x;
  final double y;

  JoystickValue({required this.x, required this.y});

  Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
      };
}

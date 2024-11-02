class JoystickValue {
  final int x;
  final int y;

  JoystickValue({required this.x, required this.y});

  Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
      };
}

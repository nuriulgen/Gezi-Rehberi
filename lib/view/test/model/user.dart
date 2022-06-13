class User {
  final String imagePath;
  final String name;
  final String email;

  final bool isDarkMode;

  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.isDarkMode,
  });

  User copy({
    String? imagePath,
    String? name,
    String? email,
    bool? isDarkMode,
  }) =>
      User(
        imagePath: imagePath ?? this.imagePath,
        name: name ?? this.name,
        email: email ?? this.email,
        isDarkMode: isDarkMode ?? this.isDarkMode,
      );

  static User fromJson(Map<String, dynamic> json) => User(
        imagePath: json['imagePath'],
        name: json['name'],
        email: json['email'],
        isDarkMode: json['isDarkMode'],
      );

  Map<String, dynamic> toJson() => {
        'imagePath': imagePath,
        'name': name,
        'email': email,
        'isDarkMode': isDarkMode,
      };
}

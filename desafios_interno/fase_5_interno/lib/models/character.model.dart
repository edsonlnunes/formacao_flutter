import 'package:flutter/material.dart';

class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;
  final Color color;
  final Color textColor;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
    this.color = Colors.white,
    this.textColor = Colors.black,
  });

  factory Character.fromMap(Map<String, dynamic> map) {
    return Character(
      id: map['id'] as int,
      name: map['name'] as String,
      status: map['status'] as String,
      species: map['species'] as String,
      gender: map['gender'] as String,
      image: map['image'] as String,
    );
  }

  Character copyWith({
    int? id,
    String? name,
    String? status,
    String? species,
    String? gender,
    String? image,
    Color? color,
    Color? textColor,
  }) {
    return Character(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      species: species ?? this.species,
      gender: gender ?? this.gender,
      image: image ?? this.image,
      color: color ?? this.color,
      textColor: textColor ?? this.color,
    );
  }
}

import 'package:flutter/material.dart';

import 'location.model.dart';

class CharacterDetail {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;
  final Location location;
  final Location origin;
  final int numberEpisodes;

  CharacterDetail({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
    required this.origin,
    required this.location,
    required this.numberEpisodes,
  });

  factory CharacterDetail.fromMap(Map<String, dynamic> map) {
    return CharacterDetail(
      id: map['id'] as int,
      name: map['name'] as String,
      status: map['status'] as String,
      species: map['species'] as String,
      gender: map['gender'] as String,
      image: map['image'] as String,
      location: Location.fromMap(map['location']),
      origin: Location.fromMap(map['origin']),
      numberEpisodes: (map["episode"] as List).length,
    );
  }
}

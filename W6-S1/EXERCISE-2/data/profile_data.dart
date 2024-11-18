import 'package:flutter/material.dart';
import 'package:flutter_application_1/W6-S1/EXERCISE-2/model/profile_tile_model.dart';


 
ProfileData ronanProfile = ProfileData(
    name: "Ronan",
    position: "Flutter Developer",
    avatarUrl: 'assets/IMG/b3.jpg',
    tiles: [
      TileData( icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
      TileData(icon: Icons.location_on, title: "Address", value: "123 Cambodia"),
      TileData(icon: Icons.email, title: "Mail", value: "ronan.ogogr@cadt.edu"),
    ]);

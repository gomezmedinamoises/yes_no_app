import 'dart:convert';

import 'package:yes_no_app_v1/domain/entities/message.dart';

// Convierte la respuesta API en String en un Mapa
// YesNoModel yesNoModelFromJson(String str) => YesNoModel.fromJson(json.decode(str));

// Convierte una instancia del modelo en un String
// String yesNoModelToJson(YesNoModel data) => json.encode(data.toJson());

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  // Método para mapear la respuesta de la API y convertirla en un objeto YesNoModel
  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  // Convierte un objeto YesNoModel en un JSON
  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  // Mapper para regresar un objeto de tipo Message con los valores asocionados de la API
  Message toMessageEntity() => Message(
    text: answer == 'yes' ? 'Si' : 'No', 
    fromWho: FromWho.hers,
    imageUrl: image
  );
}

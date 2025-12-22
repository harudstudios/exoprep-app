// To parse this JSON data, do
//
//     final deckDataModel = deckDataModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'decks_data_model.g.dart';

String deckDataModelToJson(DeckDataModel data) => json.encode(data.toJson());

@JsonSerializable()
class DeckDataModel {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "cards_count")
  final int? cardsCount;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "collection_id")
  final String? collectionId;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  @JsonKey(name: "deleted_at")
  final String? deletedAt;

  DeckDataModel({this.id, this.name, this.collectionId, this.cardsCount, this.createdAt, this.updatedAt, this.deletedAt});

  factory DeckDataModel.fromJson(Map<String, dynamic> json) => _$DeckDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeckDataModelToJson(this);
}

// To parse this JSON data, do
//
//     final flashCardsClassDataModel = flashCardsClassDataModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'flash_cards_class_data_model.g.dart';

String flashCardsClassDataModelToJson(FlashCardsClassDataModel data) => json.encode(data.toJson());

@JsonSerializable()
class FlashCardsClassDataModel {
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "tag")
  final String? tag;
  @JsonKey(name: "color")
  final String? color;
  @JsonKey(name: "card_count")
  final int? cardCount;
  @JsonKey(name: "deck_ids")
  final List<String>? deckIds;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  @JsonKey(name: "deleted_at")
  final String? deletedAt;

  FlashCardsClassDataModel({
    this.title,
    this.tag,
    this.color,
    this.cardCount,
    this.deckIds,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory FlashCardsClassDataModel.fromJson(Map<String, dynamic> json) => _$FlashCardsClassDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$FlashCardsClassDataModelToJson(this);
}

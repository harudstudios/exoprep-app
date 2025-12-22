// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flash_cards_collection_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlashCardsCollectionDataModel _$FlashCardsCollectionDataModelFromJson(
  Map<String, dynamic> json,
) => FlashCardsCollectionDataModel(
  title: json['title'] as String?,
  tag: json['tag'] as String?,
  color: json['color'] as String?,
  cardCount: (json['card_count'] as num?)?.toInt(),
  deckIds: (json['deck_ids'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  deletedAt: json['deleted_at'] as String?,
);

Map<String, dynamic> _$FlashCardsCollectionDataModelToJson(
  FlashCardsCollectionDataModel instance,
) => <String, dynamic>{
  'title': instance.title,
  'tag': instance.tag,
  'color': instance.color,
  'card_count': instance.cardCount,
  'deck_ids': instance.deckIds,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'deleted_at': instance.deletedAt,
};

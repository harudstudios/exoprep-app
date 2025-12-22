// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'decks_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeckDataModel _$DeckDataModelFromJson(Map<String, dynamic> json) =>
    DeckDataModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      collectionId: json['collection_id'] as String?,
      cardsCount: (json['cards_count'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'] as String?,
    );

Map<String, dynamic> _$DeckDataModelToJson(DeckDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cards_count': instance.cardsCount,
      'name': instance.name,
      'collection_id': instance.collectionId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
    };

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isar_community/isar.dart';

part 'flash_cards_class_isar_model.g.dart';

@collection
class FlashCardsClassIsarModel {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  String? title;

  @Index()
  String? tag;

  // Stored as a Hex String (e.g., "#FF448AFF") in the DB
  String? colorHex;

  int? cardCount;

  List<String>? deckIds;

  @Index()
  DateTime? createdAt;

  DateTime? updatedAt;

  DateTime? deletedAt;

  // FIX: Isar requires an empty unnamed constructor.
  // Since we added a factory constructor below, the default one was removed.
  FlashCardsClassIsarModel();

  // --- HELPER: Convert DB String to Flutter Color ---
  @ignore // Tell Isar to ignore this getter, it's just for the UI
  Color get uiColor {
    if (colorHex == null || colorHex!.isEmpty) return Colors.blue;
    try {
      // Handle simple hex (#RRGGBB) or alpha hex (#AARRGGBB)
      var hex = colorHex!.replaceFirst('#', '');
      if (hex.length == 6) {
        hex = 'FF$hex'; // Add full opacity if missing
      }
      return Color(int.parse(hex, radix: 16));
    } catch (e) {
      return Colors.blue; // Fallback
    }
  }

  // Helper to set color from UI
  set uiColor(Color newColor) {
    // Stores as #AARRGGBB
    colorHex = '#${newColor.value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
  }

  // CopyWith method
  FlashCardsClassIsarModel copyWith({
    Id? id,
    String? title,
    String? tag,
    String? colorHex,
    int? cardCount,
    List<String>? deckIds,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) {
    return FlashCardsClassIsarModel()
      ..id = id ?? this.id
      ..title = title ?? this.title
      ..tag = tag ?? this.tag
      ..colorHex = colorHex ?? this.colorHex
      ..cardCount = cardCount ?? this.cardCount
      ..deckIds = deckIds ?? this.deckIds
      ..createdAt = createdAt ?? this.createdAt
      ..updatedAt = updatedAt ?? this.updatedAt
      ..deletedAt = deletedAt ?? this.deletedAt;
  }

  // Convert from JSON
  factory FlashCardsClassIsarModel.fromJson(Map<String, dynamic> json) {
    return FlashCardsClassIsarModel()
      ..title = json['title'] as String?
      ..tag = json['tag'] as String?
      ..colorHex = json['color'] as String?
      ..cardCount = json['card_count'] as int?
      ..deckIds = (json['deck_ids'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..createdAt = json['created_at'] != null ? DateTime.parse(json['created_at'] as String) : null
      ..updatedAt = json['updated_at'] != null ? DateTime.parse(json['updated_at'] as String) : null
      ..deletedAt = json['deleted_at'] != null ? DateTime.parse(json['deleted_at'] as String) : null;
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'tag': tag,
      'color': colorHex,
      'card_count': cardCount,
      'deck_ids': deckIds,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'deleted_at': deletedAt?.toIso8601String(),
    };
  }

  // Debug log
  void printDetails() {
    log('═══════════════════════════════════════');
    log('FlashCardsClassIsarModel Instance:');
    log('───────────────────────────────────────');
    log('ID: $id');
    log('Title: ${title ?? "null"}');
    log('Tag: ${tag ?? "null"}');
    log('Color Hex: ${colorHex ?? "null"}');
    log('Card Count: ${cardCount ?? 0}');
    log('Deck IDs: ${deckIds ?? "[]"}');
    log('Created At: ${createdAt?.toIso8601String() ?? "null"}');
    log('Updated At: ${updatedAt?.toIso8601String() ?? "null"}');
    log('Deleted At: ${deletedAt?.toIso8601String() ?? "null"}');
    log('═══════════════════════════════════════');
  }

  // ToString override
  @override
  String toString() {
    return 'FlashCardsClassIsarModel(id: $id, title: $title, tag: $tag, colorHex: $colorHex, cardCount: $cardCount, deckIds: $deckIds)';
  }

  // Check if soft deleted
  bool get isDeleted => deletedAt != null;

  // Check if empty/new
  bool get isNew => id == Isar.autoIncrement;
}

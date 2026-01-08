// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flash_cards_collection_isar_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFlashCardsCollectionIsarModelCollection on Isar {
  IsarCollection<FlashCardsCollectionIsarModel>
  get flashCardsCollectionIsarModels => this.collection();
}

const FlashCardsCollectionIsarModelSchema = CollectionSchema(
  name: r'FlashCardsCollectionIsarModel',
  id: 7189028616900870334,
  properties: {
    r'cardCount': PropertySchema(
      id: 0,
      name: r'cardCount',
      type: IsarType.long,
    ),
    r'colorHex': PropertySchema(id: 1, name: r'colorHex', type: IsarType.long),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'deckIds': PropertySchema(
      id: 3,
      name: r'deckIds',
      type: IsarType.stringList,
    ),
    r'deletedAt': PropertySchema(
      id: 4,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'isDeleted': PropertySchema(
      id: 5,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'isNew': PropertySchema(id: 6, name: r'isNew', type: IsarType.bool),
    r'tag': PropertySchema(id: 7, name: r'tag', type: IsarType.string),
    r'title': PropertySchema(id: 8, name: r'title', type: IsarType.string),
    r'updatedAt': PropertySchema(
      id: 9,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _flashCardsCollectionIsarModelEstimateSize,
  serialize: _flashCardsCollectionIsarModelSerialize,
  deserialize: _flashCardsCollectionIsarModelDeserialize,
  deserializeProp: _flashCardsCollectionIsarModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'title': IndexSchema(
      id: -7636685945352118059,
      name: r'title',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'title',
          type: IndexType.value,
          caseSensitive: true,
        ),
      ],
    ),
    r'tag': IndexSchema(
      id: -8827799455852696894,
      name: r'tag',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'tag',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'createdAt': IndexSchema(
      id: -3433535483987302584,
      name: r'createdAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'createdAt',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _flashCardsCollectionIsarModelGetId,
  getLinks: _flashCardsCollectionIsarModelGetLinks,
  attach: _flashCardsCollectionIsarModelAttach,
  version: '3.3.0-dev.3',
);

int _flashCardsCollectionIsarModelEstimateSize(
  FlashCardsCollectionIsarModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.deckIds;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.tag;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.title;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _flashCardsCollectionIsarModelSerialize(
  FlashCardsCollectionIsarModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.cardCount);
  writer.writeLong(offsets[1], object.colorHex);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeStringList(offsets[3], object.deckIds);
  writer.writeDateTime(offsets[4], object.deletedAt);
  writer.writeBool(offsets[5], object.isDeleted);
  writer.writeBool(offsets[6], object.isNew);
  writer.writeString(offsets[7], object.tag);
  writer.writeString(offsets[8], object.title);
  writer.writeDateTime(offsets[9], object.updatedAt);
}

FlashCardsCollectionIsarModel _flashCardsCollectionIsarModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FlashCardsCollectionIsarModel();
  object.cardCount = reader.readLongOrNull(offsets[0]);
  object.colorHex = reader.readLongOrNull(offsets[1]);
  object.createdAt = reader.readDateTimeOrNull(offsets[2]);
  object.deckIds = reader.readStringList(offsets[3]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[4]);
  object.id = id;
  object.tag = reader.readStringOrNull(offsets[7]);
  object.title = reader.readStringOrNull(offsets[8]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[9]);
  return object;
}

P _flashCardsCollectionIsarModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readStringList(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _flashCardsCollectionIsarModelGetId(FlashCardsCollectionIsarModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _flashCardsCollectionIsarModelGetLinks(
  FlashCardsCollectionIsarModel object,
) {
  return [];
}

void _flashCardsCollectionIsarModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  FlashCardsCollectionIsarModel object,
) {
  object.id = id;
}

extension FlashCardsCollectionIsarModelQueryWhereSort
    on
        QueryBuilder<
          FlashCardsCollectionIsarModel,
          FlashCardsCollectionIsarModel,
          QWhere
        > {
  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterWhere
  >
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterWhere
  >
  anyTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'title'),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterWhere
  >
  anyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdAt'),
      );
    });
  }
}

extension FlashCardsCollectionIsarModelQueryWhere
    on
        QueryBuilder<
          FlashCardsCollectionIsarModel,
          FlashCardsCollectionIsarModel,
          QWhereClause
        > {
  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterWhereClause
  >
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterWhereClause
  >
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterWhereClause
  >
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterWhereClause
  >
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterWhereClause
  >
  idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterWhereClause
  >
  titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'title', value: [null]),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterWhereClause
  >
  titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'title',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterWhereClause
  >
  titleEqualTo(String? title) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'title', value: [title]),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterWhereClause
  >
  titleNotEqualTo(String? title) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'title',
                lower: [],
                upper: [title],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'title',
                lower: [title],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'title',
                lower: [title],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'title',
                lower: [],
                upper: [title],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterWhereClause
  >
  titleGreaterThan(String? title, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'title',
          lower: [title],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterWhereClause
  >
  titleLessThan(String? title, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'title',
          lower: [],
          upper: [title],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterWhereClause
  >
  titleBetween(
    String? lowerTitle,
    String? upperTitle, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'title',
          lower: [lowerTitle],
          includeLower: includeLower,
          upper: [upperTitle],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterWhereClause
  >
  titleStartsWith(String TitlePrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'title',
          lower: [TitlePrefix],
          upper: ['$TitlePrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterWhereClause
  >
  titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'title', value: ['']),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterWhereClause
  >
  titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'title', upper: ['']),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'title', lower: ['']),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'title', lower: ['']),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'title', upper: ['']),
            );
      }
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterWhereClause
  >
  tagIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'tag', value: [null]),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterWhereClause
  >
  tagIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'tag',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterWhereClause
  >
  tagEqualTo(String? tag) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'tag', value: [tag]),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterWhereClause
  >
  tagNotEqualTo(String? tag) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'tag',
                lower: [],
                upper: [tag],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'tag',
                lower: [tag],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'tag',
                lower: [tag],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'tag',
                lower: [],
                upper: [tag],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterWhereClause
  >
  createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'createdAt', value: [null]),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterWhereClause
  >
  createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'createdAt',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterWhereClause
  >
  createdAtEqualTo(DateTime? createdAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'createdAt', value: [createdAt]),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterWhereClause
  >
  createdAtNotEqualTo(DateTime? createdAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'createdAt',
                lower: [],
                upper: [createdAt],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'createdAt',
                lower: [createdAt],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'createdAt',
                lower: [createdAt],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'createdAt',
                lower: [],
                upper: [createdAt],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterWhereClause
  >
  createdAtGreaterThan(DateTime? createdAt, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'createdAt',
          lower: [createdAt],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterWhereClause
  >
  createdAtLessThan(DateTime? createdAt, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'createdAt',
          lower: [],
          upper: [createdAt],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterWhereClause
  >
  createdAtBetween(
    DateTime? lowerCreatedAt,
    DateTime? upperCreatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'createdAt',
          lower: [lowerCreatedAt],
          includeLower: includeLower,
          upper: [upperCreatedAt],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension FlashCardsCollectionIsarModelQueryFilter
    on
        QueryBuilder<
          FlashCardsCollectionIsarModel,
          FlashCardsCollectionIsarModel,
          QFilterCondition
        > {
  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  cardCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'cardCount'),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  cardCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'cardCount'),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  cardCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'cardCount', value: value),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  cardCountGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'cardCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  cardCountLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'cardCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  cardCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'cardCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  colorHexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'colorHex'),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  colorHexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'colorHex'),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  colorHexEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'colorHex', value: value),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  colorHexGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'colorHex',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  colorHexLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'colorHex',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  colorHexBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'colorHex',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'createdAt'),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'createdAt'),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  createdAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  createdAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  createdAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  deckIdsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'deckIds'),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  deckIdsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'deckIds'),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  deckIdsElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'deckIds',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  deckIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'deckIds',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  deckIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'deckIds',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  deckIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'deckIds',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  deckIdsElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'deckIds',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  deckIdsElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'deckIds',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  deckIdsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'deckIds',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  deckIdsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'deckIds',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  deckIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'deckIds', value: ''),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  deckIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'deckIds', value: ''),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  deckIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'deckIds', length, true, length, true);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  deckIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'deckIds', 0, true, 0, true);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  deckIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'deckIds', 0, false, 999999, true);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  deckIdsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'deckIds', 0, true, length, include);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  deckIdsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'deckIds', length, include, 999999, true);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  deckIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'deckIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'deletedAt'),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'deletedAt'),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'deletedAt', value: value),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  deletedAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'deletedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  deletedAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'deletedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  deletedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'deletedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isDeleted', value: value),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  isNewEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isNew', value: value),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  tagIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'tag'),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  tagIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'tag'),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  tagEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'tag',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  tagGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'tag',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  tagLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'tag',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  tagBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'tag',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  tagStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'tag',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  tagEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'tag',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  tagContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'tag',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  tagMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'tag',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  tagIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'tag', value: ''),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  tagIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'tag', value: ''),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'title'),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'title'),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  titleEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  titleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  titleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  titleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'title',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  titleStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  titleEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'title',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'updatedAt'),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'updatedAt'),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  updatedAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  updatedAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterFilterCondition
  >
  updatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'updatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension FlashCardsCollectionIsarModelQueryObject
    on
        QueryBuilder<
          FlashCardsCollectionIsarModel,
          FlashCardsCollectionIsarModel,
          QFilterCondition
        > {}

extension FlashCardsCollectionIsarModelQueryLinks
    on
        QueryBuilder<
          FlashCardsCollectionIsarModel,
          FlashCardsCollectionIsarModel,
          QFilterCondition
        > {}

extension FlashCardsCollectionIsarModelQuerySortBy
    on
        QueryBuilder<
          FlashCardsCollectionIsarModel,
          FlashCardsCollectionIsarModel,
          QSortBy
        > {
  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  sortByCardCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardCount', Sort.asc);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  sortByCardCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardCount', Sort.desc);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  sortByColorHex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorHex', Sort.asc);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  sortByColorHexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorHex', Sort.desc);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  sortByIsNew() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isNew', Sort.asc);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  sortByIsNewDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isNew', Sort.desc);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  sortByTag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tag', Sort.asc);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  sortByTagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tag', Sort.desc);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension FlashCardsCollectionIsarModelQuerySortThenBy
    on
        QueryBuilder<
          FlashCardsCollectionIsarModel,
          FlashCardsCollectionIsarModel,
          QSortThenBy
        > {
  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  thenByCardCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardCount', Sort.asc);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  thenByCardCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardCount', Sort.desc);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  thenByColorHex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorHex', Sort.asc);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  thenByColorHexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorHex', Sort.desc);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  thenByIsNew() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isNew', Sort.asc);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  thenByIsNewDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isNew', Sort.desc);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  thenByTag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tag', Sort.asc);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  thenByTagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tag', Sort.desc);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QAfterSortBy
  >
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension FlashCardsCollectionIsarModelQueryWhereDistinct
    on
        QueryBuilder<
          FlashCardsCollectionIsarModel,
          FlashCardsCollectionIsarModel,
          QDistinct
        > {
  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QDistinct
  >
  distinctByCardCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cardCount');
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QDistinct
  >
  distinctByColorHex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorHex');
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QDistinct
  >
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QDistinct
  >
  distinctByDeckIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deckIds');
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QDistinct
  >
  distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QDistinct
  >
  distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QDistinct
  >
  distinctByIsNew() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isNew');
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QDistinct
  >
  distinctByTag({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tag', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QDistinct
  >
  distinctByTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<
    FlashCardsCollectionIsarModel,
    FlashCardsCollectionIsarModel,
    QDistinct
  >
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension FlashCardsCollectionIsarModelQueryProperty
    on
        QueryBuilder<
          FlashCardsCollectionIsarModel,
          FlashCardsCollectionIsarModel,
          QQueryProperty
        > {
  QueryBuilder<FlashCardsCollectionIsarModel, int, QQueryOperations>
  idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FlashCardsCollectionIsarModel, int?, QQueryOperations>
  cardCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cardCount');
    });
  }

  QueryBuilder<FlashCardsCollectionIsarModel, int?, QQueryOperations>
  colorHexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorHex');
    });
  }

  QueryBuilder<FlashCardsCollectionIsarModel, DateTime?, QQueryOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<FlashCardsCollectionIsarModel, List<String>?, QQueryOperations>
  deckIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deckIds');
    });
  }

  QueryBuilder<FlashCardsCollectionIsarModel, DateTime?, QQueryOperations>
  deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<FlashCardsCollectionIsarModel, bool, QQueryOperations>
  isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<FlashCardsCollectionIsarModel, bool, QQueryOperations>
  isNewProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isNew');
    });
  }

  QueryBuilder<FlashCardsCollectionIsarModel, String?, QQueryOperations>
  tagProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tag');
    });
  }

  QueryBuilder<FlashCardsCollectionIsarModel, String?, QQueryOperations>
  titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<FlashCardsCollectionIsarModel, DateTime?, QQueryOperations>
  updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flash_cards_class_isar_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFlashCardsClassIsarModelCollection on Isar {
  IsarCollection<FlashCardsClassIsarModel> get flashCardsClassIsarModels =>
      this.collection();
}

const FlashCardsClassIsarModelSchema = CollectionSchema(
  name: r'FlashCardsClassIsarModel',
  id: -5014676257885542560,
  properties: {
    r'cardCount': PropertySchema(
      id: 0,
      name: r'cardCount',
      type: IsarType.long,
    ),
    r'colorHex': PropertySchema(
      id: 1,
      name: r'colorHex',
      type: IsarType.string,
    ),
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

  estimateSize: _flashCardsClassIsarModelEstimateSize,
  serialize: _flashCardsClassIsarModelSerialize,
  deserialize: _flashCardsClassIsarModelDeserialize,
  deserializeProp: _flashCardsClassIsarModelDeserializeProp,
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

  getId: _flashCardsClassIsarModelGetId,
  getLinks: _flashCardsClassIsarModelGetLinks,
  attach: _flashCardsClassIsarModelAttach,
  version: '3.3.0-dev.3',
);

int _flashCardsClassIsarModelEstimateSize(
  FlashCardsClassIsarModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.colorHex;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
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

void _flashCardsClassIsarModelSerialize(
  FlashCardsClassIsarModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.cardCount);
  writer.writeString(offsets[1], object.colorHex);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeStringList(offsets[3], object.deckIds);
  writer.writeDateTime(offsets[4], object.deletedAt);
  writer.writeBool(offsets[5], object.isDeleted);
  writer.writeBool(offsets[6], object.isNew);
  writer.writeString(offsets[7], object.tag);
  writer.writeString(offsets[8], object.title);
  writer.writeDateTime(offsets[9], object.updatedAt);
}

FlashCardsClassIsarModel _flashCardsClassIsarModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FlashCardsClassIsarModel();
  object.cardCount = reader.readLongOrNull(offsets[0]);
  object.colorHex = reader.readStringOrNull(offsets[1]);
  object.createdAt = reader.readDateTimeOrNull(offsets[2]);
  object.deckIds = reader.readStringList(offsets[3]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[4]);
  object.id = id;
  object.tag = reader.readStringOrNull(offsets[7]);
  object.title = reader.readStringOrNull(offsets[8]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[9]);
  return object;
}

P _flashCardsClassIsarModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
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

Id _flashCardsClassIsarModelGetId(FlashCardsClassIsarModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _flashCardsClassIsarModelGetLinks(
  FlashCardsClassIsarModel object,
) {
  return [];
}

void _flashCardsClassIsarModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  FlashCardsClassIsarModel object,
) {
  object.id = id;
}

extension FlashCardsClassIsarModelQueryWhereSort
    on
        QueryBuilder<
          FlashCardsClassIsarModel,
          FlashCardsClassIsarModel,
          QWhere
        > {
  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterWhere>
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterWhere>
  anyTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'title'),
      );
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterWhere>
  anyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdAt'),
      );
    });
  }
}

extension FlashCardsClassIsarModelQueryWhere
    on
        QueryBuilder<
          FlashCardsClassIsarModel,
          FlashCardsClassIsarModel,
          QWhereClause
        > {
  QueryBuilder<
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
    QAfterWhereClause
  >
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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

extension FlashCardsClassIsarModelQueryFilter
    on
        QueryBuilder<
          FlashCardsClassIsarModel,
          FlashCardsClassIsarModel,
          QFilterCondition
        > {
  QueryBuilder<
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
    QAfterFilterCondition
  >
  colorHexEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'colorHex',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
    QAfterFilterCondition
  >
  colorHexGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'colorHex',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
    QAfterFilterCondition
  >
  colorHexLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'colorHex',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
    QAfterFilterCondition
  >
  colorHexBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'colorHex',
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
    QAfterFilterCondition
  >
  colorHexStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'colorHex',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
    QAfterFilterCondition
  >
  colorHexEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'colorHex',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
    QAfterFilterCondition
  >
  colorHexContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'colorHex',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
    QAfterFilterCondition
  >
  colorHexMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'colorHex',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
    QAfterFilterCondition
  >
  colorHexIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'colorHex', value: ''),
      );
    });
  }

  QueryBuilder<
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
    QAfterFilterCondition
  >
  colorHexIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'colorHex', value: ''),
      );
    });
  }

  QueryBuilder<
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
    QAfterFilterCondition
  >
  deckIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'deckIds', length, true, length, true);
    });
  }

  QueryBuilder<
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
    QAfterFilterCondition
  >
  deckIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'deckIds', 0, true, 0, true);
    });
  }

  QueryBuilder<
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
    QAfterFilterCondition
  >
  deckIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'deckIds', 0, false, 999999, true);
    });
  }

  QueryBuilder<
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
    QAfterFilterCondition
  >
  deckIdsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'deckIds', 0, true, length, include);
    });
  }

  QueryBuilder<
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
    QAfterFilterCondition
  >
  deckIdsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'deckIds', length, include, 999999, true);
    });
  }

  QueryBuilder<
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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
    FlashCardsClassIsarModel,
    FlashCardsClassIsarModel,
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

extension FlashCardsClassIsarModelQueryObject
    on
        QueryBuilder<
          FlashCardsClassIsarModel,
          FlashCardsClassIsarModel,
          QFilterCondition
        > {}

extension FlashCardsClassIsarModelQueryLinks
    on
        QueryBuilder<
          FlashCardsClassIsarModel,
          FlashCardsClassIsarModel,
          QFilterCondition
        > {}

extension FlashCardsClassIsarModelQuerySortBy
    on
        QueryBuilder<
          FlashCardsClassIsarModel,
          FlashCardsClassIsarModel,
          QSortBy
        > {
  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  sortByCardCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardCount', Sort.asc);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  sortByCardCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardCount', Sort.desc);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  sortByColorHex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorHex', Sort.asc);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  sortByColorHexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorHex', Sort.desc);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  sortByIsNew() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isNew', Sort.asc);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  sortByIsNewDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isNew', Sort.desc);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  sortByTag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tag', Sort.asc);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  sortByTagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tag', Sort.desc);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension FlashCardsClassIsarModelQuerySortThenBy
    on
        QueryBuilder<
          FlashCardsClassIsarModel,
          FlashCardsClassIsarModel,
          QSortThenBy
        > {
  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  thenByCardCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardCount', Sort.asc);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  thenByCardCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardCount', Sort.desc);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  thenByColorHex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorHex', Sort.asc);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  thenByColorHexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorHex', Sort.desc);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  thenByIsNew() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isNew', Sort.asc);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  thenByIsNewDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isNew', Sort.desc);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  thenByTag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tag', Sort.asc);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  thenByTagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tag', Sort.desc);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension FlashCardsClassIsarModelQueryWhereDistinct
    on
        QueryBuilder<
          FlashCardsClassIsarModel,
          FlashCardsClassIsarModel,
          QDistinct
        > {
  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QDistinct>
  distinctByCardCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cardCount');
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QDistinct>
  distinctByColorHex({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorHex', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QDistinct>
  distinctByDeckIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deckIds');
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QDistinct>
  distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QDistinct>
  distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QDistinct>
  distinctByIsNew() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isNew');
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QDistinct>
  distinctByTag({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tag', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QDistinct>
  distinctByTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, FlashCardsClassIsarModel, QDistinct>
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension FlashCardsClassIsarModelQueryProperty
    on
        QueryBuilder<
          FlashCardsClassIsarModel,
          FlashCardsClassIsarModel,
          QQueryProperty
        > {
  QueryBuilder<FlashCardsClassIsarModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, int?, QQueryOperations>
  cardCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cardCount');
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, String?, QQueryOperations>
  colorHexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorHex');
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, DateTime?, QQueryOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, List<String>?, QQueryOperations>
  deckIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deckIds');
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, DateTime?, QQueryOperations>
  deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, bool, QQueryOperations>
  isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, bool, QQueryOperations>
  isNewProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isNew');
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, String?, QQueryOperations>
  tagProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tag');
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, String?, QQueryOperations>
  titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<FlashCardsClassIsarModel, DateTime?, QQueryOperations>
  updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetProjectModelCollection on Isar {
  IsarCollection<ProjectModel> get projectModels => this.collection();
}

const ProjectModelSchema = CollectionSchema(
  name: r'ProjectModel',
  id: 1822059982794199752,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'hasTimeGoal': PropertySchema(
      id: 1,
      name: r'hasTimeGoal',
      type: IsarType.bool,
    ),
    r'projectName': PropertySchema(
      id: 2,
      name: r'projectName',
      type: IsarType.string,
    ),
    r'tagColor': PropertySchema(id: 3, name: r'tagColor', type: IsarType.long),
    r'timeGoalDurationMinutes': PropertySchema(
      id: 4,
      name: r'timeGoalDurationMinutes',
      type: IsarType.long,
    ),
    r'timeGoalFrequency': PropertySchema(
      id: 5,
      name: r'timeGoalFrequency',
      type: IsarType.string,
      enumMap: _ProjectModeltimeGoalFrequencyEnumValueMap,
    ),
    r'timeGoalOneTimeDeadlineDate': PropertySchema(
      id: 6,
      name: r'timeGoalOneTimeDeadlineDate',
      type: IsarType.dateTime,
    ),
    r'timeGoalOneTimeHasDeadlineDate': PropertySchema(
      id: 7,
      name: r'timeGoalOneTimeHasDeadlineDate',
      type: IsarType.bool,
    ),
    r'timeGoalOneTimeStartDate': PropertySchema(
      id: 8,
      name: r'timeGoalOneTimeStartDate',
      type: IsarType.dateTime,
    ),
    r'timeGoalRepeatingFrequency': PropertySchema(
      id: 9,
      name: r'timeGoalRepeatingFrequency',
      type: IsarType.string,
      enumMap: _ProjectModeltimeGoalRepeatingFrequencyEnumValueMap,
    ),
    r'updatedAt': PropertySchema(
      id: 10,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _projectModelEstimateSize,
  serialize: _projectModelSerialize,
  deserialize: _projectModelDeserialize,
  deserializeProp: _projectModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'projectName': IndexSchema(
      id: 7457588439029069741,
      name: r'projectName',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'projectName',
          type: IndexType.value,
          caseSensitive: true,
        ),
      ],
    ),
    r'tagColor': IndexSchema(
      id: 3923155393009563304,
      name: r'tagColor',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'tagColor',
          type: IndexType.value,
          caseSensitive: false,
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

  getId: _projectModelGetId,
  getLinks: _projectModelGetLinks,
  attach: _projectModelAttach,
  version: '3.3.0-dev.3',
);

int _projectModelEstimateSize(
  ProjectModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.projectName.length * 3;
  {
    final value = object.timeGoalFrequency;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  {
    final value = object.timeGoalRepeatingFrequency;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  return bytesCount;
}

void _projectModelSerialize(
  ProjectModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeBool(offsets[1], object.hasTimeGoal);
  writer.writeString(offsets[2], object.projectName);
  writer.writeLong(offsets[3], object.tagColor);
  writer.writeLong(offsets[4], object.timeGoalDurationMinutes);
  writer.writeString(offsets[5], object.timeGoalFrequency?.name);
  writer.writeDateTime(offsets[6], object.timeGoalOneTimeDeadlineDate);
  writer.writeBool(offsets[7], object.timeGoalOneTimeHasDeadlineDate);
  writer.writeDateTime(offsets[8], object.timeGoalOneTimeStartDate);
  writer.writeString(offsets[9], object.timeGoalRepeatingFrequency?.name);
  writer.writeDateTime(offsets[10], object.updatedAt);
}

ProjectModel _projectModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ProjectModel(
    createdAt: reader.readDateTimeOrNull(offsets[0]),
    hasTimeGoal: reader.readBoolOrNull(offsets[1]) ?? false,
    id: id,
    projectName: reader.readString(offsets[2]),
    tagColor: reader.readLong(offsets[3]),
    timeGoalDurationMinutes: reader.readLongOrNull(offsets[4]),
    timeGoalFrequency:
        _ProjectModeltimeGoalFrequencyValueEnumMap[reader.readStringOrNull(
          offsets[5],
        )],
    timeGoalOneTimeDeadlineDate: reader.readDateTimeOrNull(offsets[6]),
    timeGoalOneTimeHasDeadlineDate: reader.readBoolOrNull(offsets[7]) ?? false,
    timeGoalOneTimeStartDate: reader.readDateTimeOrNull(offsets[8]),
    timeGoalRepeatingFrequency:
        _ProjectModeltimeGoalRepeatingFrequencyValueEnumMap[reader
            .readStringOrNull(offsets[9])],
    updatedAt: reader.readDateTimeOrNull(offsets[10]),
  );
  return object;
}

P _projectModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (_ProjectModeltimeGoalFrequencyValueEnumMap[reader
              .readStringOrNull(offset)])
          as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (_ProjectModeltimeGoalRepeatingFrequencyValueEnumMap[reader
              .readStringOrNull(offset)])
          as P;
    case 10:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ProjectModeltimeGoalFrequencyEnumValueMap = {
  r'onetime': r'onetime',
  r'recurring': r'recurring',
};
const _ProjectModeltimeGoalFrequencyValueEnumMap = {
  r'onetime': TimeGoalFrequency.onetime,
  r'recurring': TimeGoalFrequency.recurring,
};
const _ProjectModeltimeGoalRepeatingFrequencyEnumValueMap = {
  r'daily': r'daily',
  r'weekly': r'weekly',
  r'monthly': r'monthly',
};
const _ProjectModeltimeGoalRepeatingFrequencyValueEnumMap = {
  r'daily': TimeGoalRepeatingFrequency.daily,
  r'weekly': TimeGoalRepeatingFrequency.weekly,
  r'monthly': TimeGoalRepeatingFrequency.monthly,
};

Id _projectModelGetId(ProjectModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _projectModelGetLinks(ProjectModel object) {
  return [];
}

void _projectModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  ProjectModel object,
) {
  object.id = id;
}

extension ProjectModelQueryWhereSort
    on QueryBuilder<ProjectModel, ProjectModel, QWhere> {
  QueryBuilder<ProjectModel, ProjectModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterWhere> anyProjectName() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'projectName'),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterWhere> anyTagColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'tagColor'),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterWhere> anyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdAt'),
      );
    });
  }
}

extension ProjectModelQueryWhere
    on QueryBuilder<ProjectModel, ProjectModel, QWhereClause> {
  QueryBuilder<ProjectModel, ProjectModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
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

  QueryBuilder<ProjectModel, ProjectModel, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<ProjectModel, ProjectModel, QAfterWhereClause>
  projectNameEqualTo(String projectName) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'projectName',
          value: [projectName],
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterWhereClause>
  projectNameNotEqualTo(String projectName) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'projectName',
                lower: [],
                upper: [projectName],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'projectName',
                lower: [projectName],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'projectName',
                lower: [projectName],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'projectName',
                lower: [],
                upper: [projectName],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterWhereClause>
  projectNameGreaterThan(String projectName, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'projectName',
          lower: [projectName],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterWhereClause>
  projectNameLessThan(String projectName, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'projectName',
          lower: [],
          upper: [projectName],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterWhereClause>
  projectNameBetween(
    String lowerProjectName,
    String upperProjectName, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'projectName',
          lower: [lowerProjectName],
          includeLower: includeLower,
          upper: [upperProjectName],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterWhereClause>
  projectNameStartsWith(String ProjectNamePrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'projectName',
          lower: [ProjectNamePrefix],
          upper: ['$ProjectNamePrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterWhereClause>
  projectNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'projectName', value: ['']),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterWhereClause>
  projectNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'projectName', upper: ['']),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'projectName',
                lower: [''],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'projectName',
                lower: [''],
              ),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'projectName', upper: ['']),
            );
      }
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterWhereClause> tagColorEqualTo(
    int tagColor,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'tagColor', value: [tagColor]),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterWhereClause>
  tagColorNotEqualTo(int tagColor) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'tagColor',
                lower: [],
                upper: [tagColor],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'tagColor',
                lower: [tagColor],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'tagColor',
                lower: [tagColor],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'tagColor',
                lower: [],
                upper: [tagColor],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterWhereClause>
  tagColorGreaterThan(int tagColor, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'tagColor',
          lower: [tagColor],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterWhereClause> tagColorLessThan(
    int tagColor, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'tagColor',
          lower: [],
          upper: [tagColor],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterWhereClause> tagColorBetween(
    int lowerTagColor,
    int upperTagColor, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'tagColor',
          lower: [lowerTagColor],
          includeLower: includeLower,
          upper: [upperTagColor],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterWhereClause>
  createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'createdAt', value: [null]),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterWhereClause>
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

  QueryBuilder<ProjectModel, ProjectModel, QAfterWhereClause> createdAtEqualTo(
    DateTime? createdAt,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'createdAt', value: [createdAt]),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterWhereClause>
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

  QueryBuilder<ProjectModel, ProjectModel, QAfterWhereClause>
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

  QueryBuilder<ProjectModel, ProjectModel, QAfterWhereClause> createdAtLessThan(
    DateTime? createdAt, {
    bool include = false,
  }) {
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

  QueryBuilder<ProjectModel, ProjectModel, QAfterWhereClause> createdAtBetween(
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

extension ProjectModelQueryFilter
    on QueryBuilder<ProjectModel, ProjectModel, QFilterCondition> {
  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'createdAt'),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'createdAt'),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
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

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
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

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
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

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  hasTimeGoalEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hasTimeGoal', value: value),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
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

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
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

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  projectNameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'projectName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  projectNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'projectName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  projectNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'projectName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  projectNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'projectName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  projectNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'projectName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  projectNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'projectName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  projectNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'projectName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  projectNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'projectName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  projectNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'projectName', value: ''),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  projectNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'projectName', value: ''),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  tagColorEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'tagColor', value: value),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  tagColorGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'tagColor',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  tagColorLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'tagColor',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  tagColorBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'tagColor',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalDurationMinutesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'timeGoalDurationMinutes'),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalDurationMinutesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'timeGoalDurationMinutes'),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalDurationMinutesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'timeGoalDurationMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalDurationMinutesGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'timeGoalDurationMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalDurationMinutesLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'timeGoalDurationMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalDurationMinutesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'timeGoalDurationMinutes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalFrequencyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'timeGoalFrequency'),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalFrequencyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'timeGoalFrequency'),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalFrequencyEqualTo(
    TimeGoalFrequency? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'timeGoalFrequency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalFrequencyGreaterThan(
    TimeGoalFrequency? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'timeGoalFrequency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalFrequencyLessThan(
    TimeGoalFrequency? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'timeGoalFrequency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalFrequencyBetween(
    TimeGoalFrequency? lower,
    TimeGoalFrequency? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'timeGoalFrequency',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalFrequencyStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'timeGoalFrequency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalFrequencyEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'timeGoalFrequency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalFrequencyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'timeGoalFrequency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalFrequencyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'timeGoalFrequency',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalFrequencyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'timeGoalFrequency', value: ''),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalFrequencyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'timeGoalFrequency', value: ''),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalOneTimeDeadlineDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'timeGoalOneTimeDeadlineDate'),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalOneTimeDeadlineDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(
          property: r'timeGoalOneTimeDeadlineDate',
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalOneTimeDeadlineDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'timeGoalOneTimeDeadlineDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalOneTimeDeadlineDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'timeGoalOneTimeDeadlineDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalOneTimeDeadlineDateLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'timeGoalOneTimeDeadlineDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalOneTimeDeadlineDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'timeGoalOneTimeDeadlineDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalOneTimeHasDeadlineDateEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'timeGoalOneTimeHasDeadlineDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalOneTimeStartDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'timeGoalOneTimeStartDate'),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalOneTimeStartDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'timeGoalOneTimeStartDate'),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalOneTimeStartDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'timeGoalOneTimeStartDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalOneTimeStartDateGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'timeGoalOneTimeStartDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalOneTimeStartDateLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'timeGoalOneTimeStartDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalOneTimeStartDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'timeGoalOneTimeStartDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalRepeatingFrequencyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'timeGoalRepeatingFrequency'),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalRepeatingFrequencyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(
          property: r'timeGoalRepeatingFrequency',
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalRepeatingFrequencyEqualTo(
    TimeGoalRepeatingFrequency? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'timeGoalRepeatingFrequency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalRepeatingFrequencyGreaterThan(
    TimeGoalRepeatingFrequency? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'timeGoalRepeatingFrequency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalRepeatingFrequencyLessThan(
    TimeGoalRepeatingFrequency? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'timeGoalRepeatingFrequency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalRepeatingFrequencyBetween(
    TimeGoalRepeatingFrequency? lower,
    TimeGoalRepeatingFrequency? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'timeGoalRepeatingFrequency',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalRepeatingFrequencyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'timeGoalRepeatingFrequency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalRepeatingFrequencyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'timeGoalRepeatingFrequency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalRepeatingFrequencyContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'timeGoalRepeatingFrequency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalRepeatingFrequencyMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'timeGoalRepeatingFrequency',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalRepeatingFrequencyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'timeGoalRepeatingFrequency',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  timeGoalRepeatingFrequencyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          property: r'timeGoalRepeatingFrequency',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'updatedAt'),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'updatedAt'),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
  updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
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

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
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

  QueryBuilder<ProjectModel, ProjectModel, QAfterFilterCondition>
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

extension ProjectModelQueryObject
    on QueryBuilder<ProjectModel, ProjectModel, QFilterCondition> {}

extension ProjectModelQueryLinks
    on QueryBuilder<ProjectModel, ProjectModel, QFilterCondition> {}

extension ProjectModelQuerySortBy
    on QueryBuilder<ProjectModel, ProjectModel, QSortBy> {
  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy> sortByHasTimeGoal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasTimeGoal', Sort.asc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy>
  sortByHasTimeGoalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasTimeGoal', Sort.desc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy> sortByProjectName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectName', Sort.asc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy>
  sortByProjectNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectName', Sort.desc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy> sortByTagColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tagColor', Sort.asc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy> sortByTagColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tagColor', Sort.desc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy>
  sortByTimeGoalDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeGoalDurationMinutes', Sort.asc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy>
  sortByTimeGoalDurationMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeGoalDurationMinutes', Sort.desc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy>
  sortByTimeGoalFrequency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeGoalFrequency', Sort.asc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy>
  sortByTimeGoalFrequencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeGoalFrequency', Sort.desc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy>
  sortByTimeGoalOneTimeDeadlineDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeGoalOneTimeDeadlineDate', Sort.asc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy>
  sortByTimeGoalOneTimeDeadlineDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeGoalOneTimeDeadlineDate', Sort.desc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy>
  sortByTimeGoalOneTimeHasDeadlineDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeGoalOneTimeHasDeadlineDate', Sort.asc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy>
  sortByTimeGoalOneTimeHasDeadlineDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeGoalOneTimeHasDeadlineDate', Sort.desc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy>
  sortByTimeGoalOneTimeStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeGoalOneTimeStartDate', Sort.asc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy>
  sortByTimeGoalOneTimeStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeGoalOneTimeStartDate', Sort.desc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy>
  sortByTimeGoalRepeatingFrequency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeGoalRepeatingFrequency', Sort.asc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy>
  sortByTimeGoalRepeatingFrequencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeGoalRepeatingFrequency', Sort.desc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension ProjectModelQuerySortThenBy
    on QueryBuilder<ProjectModel, ProjectModel, QSortThenBy> {
  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy> thenByHasTimeGoal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasTimeGoal', Sort.asc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy>
  thenByHasTimeGoalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasTimeGoal', Sort.desc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy> thenByProjectName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectName', Sort.asc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy>
  thenByProjectNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectName', Sort.desc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy> thenByTagColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tagColor', Sort.asc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy> thenByTagColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tagColor', Sort.desc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy>
  thenByTimeGoalDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeGoalDurationMinutes', Sort.asc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy>
  thenByTimeGoalDurationMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeGoalDurationMinutes', Sort.desc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy>
  thenByTimeGoalFrequency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeGoalFrequency', Sort.asc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy>
  thenByTimeGoalFrequencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeGoalFrequency', Sort.desc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy>
  thenByTimeGoalOneTimeDeadlineDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeGoalOneTimeDeadlineDate', Sort.asc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy>
  thenByTimeGoalOneTimeDeadlineDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeGoalOneTimeDeadlineDate', Sort.desc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy>
  thenByTimeGoalOneTimeHasDeadlineDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeGoalOneTimeHasDeadlineDate', Sort.asc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy>
  thenByTimeGoalOneTimeHasDeadlineDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeGoalOneTimeHasDeadlineDate', Sort.desc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy>
  thenByTimeGoalOneTimeStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeGoalOneTimeStartDate', Sort.asc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy>
  thenByTimeGoalOneTimeStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeGoalOneTimeStartDate', Sort.desc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy>
  thenByTimeGoalRepeatingFrequency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeGoalRepeatingFrequency', Sort.asc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy>
  thenByTimeGoalRepeatingFrequencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeGoalRepeatingFrequency', Sort.desc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension ProjectModelQueryWhereDistinct
    on QueryBuilder<ProjectModel, ProjectModel, QDistinct> {
  QueryBuilder<ProjectModel, ProjectModel, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QDistinct> distinctByHasTimeGoal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasTimeGoal');
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QDistinct> distinctByProjectName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'projectName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QDistinct> distinctByTagColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tagColor');
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QDistinct>
  distinctByTimeGoalDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeGoalDurationMinutes');
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QDistinct>
  distinctByTimeGoalFrequency({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'timeGoalFrequency',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QDistinct>
  distinctByTimeGoalOneTimeDeadlineDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeGoalOneTimeDeadlineDate');
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QDistinct>
  distinctByTimeGoalOneTimeHasDeadlineDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeGoalOneTimeHasDeadlineDate');
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QDistinct>
  distinctByTimeGoalOneTimeStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeGoalOneTimeStartDate');
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QDistinct>
  distinctByTimeGoalRepeatingFrequency({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'timeGoalRepeatingFrequency',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<ProjectModel, ProjectModel, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension ProjectModelQueryProperty
    on QueryBuilder<ProjectModel, ProjectModel, QQueryProperty> {
  QueryBuilder<ProjectModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ProjectModel, DateTime?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<ProjectModel, bool, QQueryOperations> hasTimeGoalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasTimeGoal');
    });
  }

  QueryBuilder<ProjectModel, String, QQueryOperations> projectNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'projectName');
    });
  }

  QueryBuilder<ProjectModel, int, QQueryOperations> tagColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tagColor');
    });
  }

  QueryBuilder<ProjectModel, int?, QQueryOperations>
  timeGoalDurationMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeGoalDurationMinutes');
    });
  }

  QueryBuilder<ProjectModel, TimeGoalFrequency?, QQueryOperations>
  timeGoalFrequencyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeGoalFrequency');
    });
  }

  QueryBuilder<ProjectModel, DateTime?, QQueryOperations>
  timeGoalOneTimeDeadlineDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeGoalOneTimeDeadlineDate');
    });
  }

  QueryBuilder<ProjectModel, bool, QQueryOperations>
  timeGoalOneTimeHasDeadlineDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeGoalOneTimeHasDeadlineDate');
    });
  }

  QueryBuilder<ProjectModel, DateTime?, QQueryOperations>
  timeGoalOneTimeStartDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeGoalOneTimeStartDate');
    });
  }

  QueryBuilder<ProjectModel, TimeGoalRepeatingFrequency?, QQueryOperations>
  timeGoalRepeatingFrequencyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeGoalRepeatingFrequency');
    });
  }

  QueryBuilder<ProjectModel, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}

import 'package:flutter/foundation.dart';

import 'field_types.dart';

@immutable
class FieldProperties {
  final FieldTypes type;
  final bool visible;

  const FieldProperties(this.type, {this.visible = true});

  FieldProperties copyWith({
    FieldTypes? type,
    bool? visible
  }) =>
      FieldProperties(type ?? this.type, visible: visible ?? this.visible);

  Map<String, dynamic> toJson() =>
      {
        'type': type.name,
        'visible': visible,
      };

  factory FieldProperties.fromJson(Map<String, dynamic> json) =>
      FieldProperties(
        FieldTypes.values.byName(json['type'] as String),
        visible: json['visible'] as bool,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FieldProperties &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          visible == other.visible;

  @override
  int get hashCode => type.hashCode ^ visible.hashCode;

  @override
  String toString() {
    return 'FieldProperties{type: $type, visible: $visible}';
  }
}

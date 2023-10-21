// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'home_entity.freezed.dart';
part 'home_entity.g.dart';

@freezed
class HomeEntity with _$NewsEntity {
  const factory HomeEntity({
    String? title,
    String? description,
    String? url,
    @JsonKey(name: 'urlToImage') String? imageUrl,
    String? publishedAt,
    String? content,
  }) = _NewsEntity;

  factory HomeEntity.fromJson(Map<String, Object?> json) =>
      _$NewsEntityFromJson(json);
}

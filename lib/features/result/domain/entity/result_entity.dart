// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'result_entity.freezed.dart';
part 'result_entity.g.dart';

@freezed
class ResultEntity with _$ResultEntity {
  const factory ResultEntity({
    String? title,
    String? description,
    String? url,
    @JsonKey(name: 'urlToImage') String? imageUrl,
    String? publishedAt,
    String? content,
  }) = _ResultEntity;

  factory ResultEntity.fromJson(Map<String, Object?> json) =>
      _$ResultEntityFromJson(json);
}

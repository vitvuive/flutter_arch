// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CounterLog _$$_CounterLogFromJson(Map<String, dynamic> json) =>
    _$_CounterLog(
      count: json['count'] as int,
      lastUpdate: DateTime.parse(json['lastUpdate'] as String),
    );

Map<String, dynamic> _$$_CounterLogToJson(_$_CounterLog instance) =>
    <String, dynamic>{
      'count': instance.count,
      'lastUpdate': instance.lastUpdate.toIso8601String(),
    };

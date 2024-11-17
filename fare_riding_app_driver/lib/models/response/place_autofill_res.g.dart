// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_autofill_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceAutofillResponse _$PlaceAutofillResponseFromJson(
        Map<String, dynamic> json) =>
    PlaceAutofillResponse(
      predictions: (json['predictions'] as List<dynamic>?)
          ?.map((e) => Prediction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlaceAutofillResponseToJson(
        PlaceAutofillResponse instance) =>
    <String, dynamic>{
      'predictions': instance.predictions,
    };

Prediction _$PredictionFromJson(Map<String, dynamic> json) => Prediction(
      description: json['description'] as String?,
      matchedSubstrings: (json['matched_substrings'] as List<dynamic>?)
          ?.map((e) => MatchedSubstring.fromJson(e as Map<String, dynamic>))
          .toList(),
      placeId: json['place_id'] as String?,
      reference: json['reference'] as String?,
      structuredFormatting: json['structured_formatting'] == null
          ? null
          : StructuredFormatting.fromJson(
              json['structured_formatting'] as Map<String, dynamic>),
      terms: (json['terms'] as List<dynamic>?)
          ?.map((e) => Term.fromJson(e as Map<String, dynamic>))
          .toList(),
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PredictionToJson(Prediction instance) =>
    <String, dynamic>{
      'description': instance.description,
      'matched_substrings': instance.matchedSubstrings,
      'place_id': instance.placeId,
      'reference': instance.reference,
      'structured_formatting': instance.structuredFormatting,
      'terms': instance.terms,
      'types': instance.types,
    };

MatchedSubstring _$MatchedSubstringFromJson(Map<String, dynamic> json) =>
    MatchedSubstring(
      length: (json['length'] as num?)?.toInt(),
      offset: (json['offset'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MatchedSubstringToJson(MatchedSubstring instance) =>
    <String, dynamic>{
      'length': instance.length,
      'offset': instance.offset,
    };

StructuredFormatting _$StructuredFormattingFromJson(
        Map<String, dynamic> json) =>
    StructuredFormatting(
      mainText: json['main_text'] as String?,
      mainTextMatchedSubstrings:
          (json['main_text_matched_substrings'] as List<dynamic>?)
              ?.map((e) => MatchedSubstring.fromJson(e as Map<String, dynamic>))
              .toList(),
      secondaryText: json['secondary_text'] as String?,
    );

Map<String, dynamic> _$StructuredFormattingToJson(
        StructuredFormatting instance) =>
    <String, dynamic>{
      'main_text': instance.mainText,
      'main_text_matched_substrings': instance.mainTextMatchedSubstrings,
      'secondary_text': instance.secondaryText,
    };

Term _$TermFromJson(Map<String, dynamic> json) => Term(
      offset: (json['offset'] as num?)?.toInt(),
      value: json['value'] as String?,
    );

Map<String, dynamic> _$TermToJson(Term instance) => <String, dynamic>{
      'offset': instance.offset,
      'value': instance.value,
    };

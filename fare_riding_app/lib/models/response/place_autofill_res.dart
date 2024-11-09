import 'package:json_annotation/json_annotation.dart';

part 'place_autofill_res.g.dart';

@JsonSerializable()
class PlaceAutofillResponse {
  final List<Prediction>? predictions;

  PlaceAutofillResponse({this.predictions});

  factory PlaceAutofillResponse.fromJson(Map<String, dynamic> json) => _$PlaceAutofillResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceAutofillResponseToJson(this);
}

@JsonSerializable()
class Prediction {
  final String? description;
  @JsonKey(name: 'matched_substrings')
  final List<MatchedSubstring>? matchedSubstrings;
  @JsonKey(name: 'place_id')
  final String? placeId;
  final String? reference;
  @JsonKey(name: 'structured_formatting')
  final StructuredFormatting? structuredFormatting;
  final List<Term>? terms;
  final List<String>? types;

  Prediction({
    this.description,
    this.matchedSubstrings,
    this.placeId,
    this.reference,
    this.structuredFormatting,
    this.terms,
    this.types,
  });

  factory Prediction.fromJson(Map<String, dynamic> json) => _$PredictionFromJson(json);

  Map<String, dynamic> toJson() => _$PredictionToJson(this);
}

@JsonSerializable()
class MatchedSubstring {
  final int? length;
  final int? offset;

  MatchedSubstring({this.length, this.offset});

  factory MatchedSubstring.fromJson(Map<String, dynamic> json) => _$MatchedSubstringFromJson(json);

  Map<String, dynamic> toJson() => _$MatchedSubstringToJson(this);
}

@JsonSerializable()
class StructuredFormatting {
  @JsonKey(name: 'main_text')
  final String? mainText;
  @JsonKey(name: 'main_text_matched_substrings')
  final List<MatchedSubstring>? mainTextMatchedSubstrings;
  @JsonKey(name: 'secondary_text')
  final String? secondaryText;

  StructuredFormatting({
    this.mainText,
    this.mainTextMatchedSubstrings,
    this.secondaryText,
  });

  factory StructuredFormatting.fromJson(Map<String, dynamic> json) => _$StructuredFormattingFromJson(json);

  Map<String, dynamic> toJson() => _$StructuredFormattingToJson(this);
}

@JsonSerializable()
class Term {
  final int? offset;
  final String? value;

  Term({this.offset, this.value});

  factory Term.fromJson(Map<String, dynamic> json) => _$TermFromJson(json);

  Map<String, dynamic> toJson() => _$TermToJson(this);
}

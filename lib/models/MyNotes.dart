/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// ignore_for_file: public_member_api_docs

import 'ModelProvider.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the MyNotes type in your schema. */
@immutable
class MyNotes extends Model {
  static const classType = const _MyNotesModelType();
  final String id;
  final String? _MyNote;
  final String? _Desc;
  final TemporalDateTime? _Created;
  final List<MyImages>? _Images;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get MyNote {
    return _MyNote;
  }
  
  String? get Desc {
    return _Desc;
  }
  
  TemporalDateTime? get Created {
    return _Created;
  }
  
  List<MyImages>? get Images {
    return _Images;
  }
  
  const MyNotes._internal({required this.id, MyNote, Desc, Created, Images}): _MyNote = MyNote, _Desc = Desc, _Created = Created, _Images = Images;
  
  factory MyNotes({String? id, String? MyNote, String? Desc, TemporalDateTime? Created, List<MyImages>? Images}) {
    return MyNotes._internal(
      id: id == null ? UUID.getUUID() : id,
      MyNote: MyNote,
      Desc: Desc,
      Created: Created,
      Images: Images != null ? List<MyImages>.unmodifiable(Images) : Images);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MyNotes &&
      id == other.id &&
      _MyNote == other._MyNote &&
      _Desc == other._Desc &&
      _Created == other._Created &&
      DeepCollectionEquality().equals(_Images, other._Images);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("MyNotes {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("MyNote=" + "$_MyNote" + ", ");
    buffer.write("Desc=" + "$_Desc" + ", ");
    buffer.write("Created=" + (_Created != null ? _Created!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  MyNotes copyWith({String? id, String? MyNote, String? Desc, TemporalDateTime? Created, List<MyImages>? Images}) {
    return MyNotes(
      id: id ?? this.id,
      MyNote: MyNote ?? this.MyNote,
      Desc: Desc ?? this.Desc,
      Created: Created ?? this.Created,
      Images: Images ?? this.Images);
  }
  
  MyNotes.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _MyNote = json['MyNote'],
      _Desc = json['Desc'],
      _Created = json['Created'] != null ? TemporalDateTime.fromString(json['Created']) : null,
      _Images = json['Images'] is List
        ? (json['Images'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => MyImages.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'MyNote': _MyNote, 'Desc': _Desc, 'Created': _Created?.format(), 'Images': _Images?.map((e) => e?.toJson())?.toList()
  };

  static final QueryField ID = QueryField(fieldName: "myNotes.id");
  static final QueryField MYNOTE = QueryField(fieldName: "MyNote");
  static final QueryField DESC = QueryField(fieldName: "Desc");
  static final QueryField CREATED = QueryField(fieldName: "Created");
  static final QueryField IMAGES = QueryField(
    fieldName: "Images",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (MyImages).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "MyNotes";
    modelSchemaDefinition.pluralName = "MyNotes";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MyNotes.MYNOTE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MyNotes.DESC,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MyNotes.CREATED,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: MyNotes.IMAGES,
      isRequired: false,
      ofModelName: (MyImages).toString(),
      associatedKey: MyImages.MYNOTESID
    ));
  });
}

class _MyNotesModelType extends ModelType<MyNotes> {
  const _MyNotesModelType();
  
  @override
  MyNotes fromJson(Map<String, dynamic> jsonData) {
    return MyNotes.fromJson(jsonData);
  }
}
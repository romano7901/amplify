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

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the MyImages type in your schema. */
@immutable
class MyImages extends Model {
  static const classType = const _MyImagesModelType();
  final String id;
  final String? _imKey;
  final String? _mynotesID;
  final String? _imURL;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get imKey {
    return _imKey;
  }
  
  String? get mynotesID {
    return _mynotesID;
  }
  
  String? get imURL {
    return _imURL;
  }
  
  const MyImages._internal({required this.id, imKey, mynotesID, imURL}): _imKey = imKey, _mynotesID = mynotesID, _imURL = imURL;
  
  factory MyImages({String? id, String? imKey, String? mynotesID, String? imURL}) {
    return MyImages._internal(
      id: id == null ? UUID.getUUID() : id,
      imKey: imKey,
      mynotesID: mynotesID,
      imURL: imURL);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MyImages &&
      id == other.id &&
      _imKey == other._imKey &&
      _mynotesID == other._mynotesID &&
      _imURL == other._imURL;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("MyImages {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("imKey=" + "$_imKey" + ", ");
    buffer.write("mynotesID=" + "$_mynotesID" + ", ");
    buffer.write("imURL=" + "$_imURL");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  MyImages copyWith({String? id, String? imKey, String? mynotesID, String? imURL}) {
    return MyImages(
      id: id ?? this.id,
      imKey: imKey ?? this.imKey,
      mynotesID: mynotesID ?? this.mynotesID,
      imURL: imURL ?? this.imURL);
  }
  
  MyImages.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _imKey = json['imKey'],
      _mynotesID = json['mynotesID'],
      _imURL = json['imURL'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'imKey': _imKey, 'mynotesID': _mynotesID, 'imURL': _imURL
  };

  static final QueryField ID = QueryField(fieldName: "myImages.id");
  static final QueryField IMKEY = QueryField(fieldName: "imKey");
  static final QueryField MYNOTESID = QueryField(fieldName: "mynotesID");
  static final QueryField IMURL = QueryField(fieldName: "imURL");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "MyImages";
    modelSchemaDefinition.pluralName = "MyImages";
    
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
      key: MyImages.IMKEY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MyImages.MYNOTESID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MyImages.IMURL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _MyImagesModelType extends ModelType<MyImages> {
  const _MyImagesModelType();
  
  @override
  MyImages fromJson(Map<String, dynamic> jsonData) {
    return MyImages.fromJson(jsonData);
  }
}
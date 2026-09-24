
import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String? authorId;
  String? authorEmail;
  String? content;
  List<String>? likes;
  PostModel({required this.authorId,
    required this.authorEmail,
    required this.likes,
    required this.content
  });
  factory PostModel.fromFireStore(Map<String,dynamic>map){
    return PostModel(
      authorId :map['authorId'],
      authorEmail :map['authorEmail'],
      likes: map['likes'] != null ? List<String>.from(map['likes']) : [],
      content :map['content'],
    );
  }
  Map<String,dynamic>toFireStore(){
    return{
      'authorId': authorId,
      'authorEmail': authorEmail,
      'likes': likes,
      'content': content,
      'createdAT' : FieldValue.serverTimestamp(),

    };
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModel {
  final String id; 
  final bool checked;
  final DateTime createdAt;
  final String itemId; 
  final String name;
  final String ownerId;
  final DateTime updatedAt;

  ItemModel({
    required this.id,
    required this.checked,
    required this.createdAt,
    required this.itemId,
    required this.name,
    required this.ownerId,
    required this.updatedAt,
  });

  factory ItemModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data()!;

    return ItemModel(
      id: snapshot.id,
      checked: data['checked'] as bool,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      itemId: data['id'] as String,
      name: data['name'] as String,
      ownerId: data['ownerId'] as String,
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'checked': checked,
      'createdAt': Timestamp.fromDate(createdAt),
      'id': itemId,
      'name': name,
      'ownerId': ownerId,
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }
}

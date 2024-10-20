import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class WardrobeItemModel {
  final File image;
  final String category;

  WardrobeItemModel({
    required this.image,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'imagePath': image.path, // store the image path, not the file itself
      'category': category,
    };
  }

  factory WardrobeItemModel.fromMap(Map<String, dynamic> map) {
    return WardrobeItemModel(
      image: File(map['imagePath']),
      category: map['category'],
    );
  }

  // Save an item to the appropriate category list in SharedPreferences
  static Future<void> addItemToPreferences(WardrobeItemModel item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? items = prefs.getStringList(item.category);
    items ??= [];
    items.add(item.image.path);
    await prefs.setStringList(item.category, items);
  }

  // Retrieve all items for a given category
  static Future<List<WardrobeItemModel>> loadItemsByCategory(
      String category) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? items = prefs.getStringList(category);

    if (items == null) return [];

    return items
        .map((imagePath) => WardrobeItemModel(
              image: File(imagePath),
              category: category,
            ))
        .toList();
  }

  // Remove an item from a specific category in SharedPreferences and delete the image file
  static Future<void> removeItemFromPreferences(WardrobeItemModel item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve the list for the specific category
    List<String>? items = prefs.getStringList(item.category);

    if (items != null) {
      // Remove the item's image path from the list
      items.remove(item.image.path);

      // Delete the image file from local storage
      final File imageFile = item.image;
      if (await imageFile.exists()) {
        await imageFile.delete(); // This deletes the file from the device
      }

      // If the list is empty after removal, delete the key from SharedPreferences
      if (items.isEmpty) {
        await prefs.remove(item.category);
      } else {
        // Otherwise, update the list
        await prefs.setStringList(item.category, items);
      }
    }
  }
}

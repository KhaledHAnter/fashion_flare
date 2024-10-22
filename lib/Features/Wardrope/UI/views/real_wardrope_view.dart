import 'dart:developer';
import 'dart:io';
import 'package:tflite_v2/tflite_v2.dart';

import '../../../../Core/Helper/extentions.dart';
import '../../../../Core/routing/routes.dart';
import '../../../../Core/widgets/app_text.dart';
import '../../../../Core/widgets/custom_button.dart';
import '../../data/models/wardrope_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class RealWardropeView extends StatefulWidget {
  const RealWardropeView({super.key});

  @override
  State<RealWardropeView> createState() => _RealWardropeViewState();
}

class _RealWardropeViewState extends State<RealWardropeView> {
  late PageController pc1;
  late PageController pc2;
  late PageController pc3;
  File? _imageFile;

  var _recognitions;
  var v = "";

  @override
  void initState() {
    pc1 = PageController(initialPage: 1, viewportFraction: .5);
    pc2 = PageController(initialPage: 1, viewportFraction: .5);
    pc3 = PageController(initialPage: 1, viewportFraction: .5);
    _loadAllItems();
    loadmodel().then((value) {
      setState(() {});
    });
    super.initState();
  }

  loadmodel() async {
    await Tflite.loadModel(
      model: "assets/ML/model_unquant.tflite",
      labels: "assets/ML/labels.txt",
    );
  }

  Future<String?> detectimage(File image) async {
    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _recognitions = recognitions;
      v = recognitions![0]['label'].toString();
      // dataList = List<Map<String, dynamic>>.from(jsonDecode(v));
    });
    print(_recognitions);
    return v;
  }

  List<WardrobeItemModel> _tShirtItems = [];
  List<WardrobeItemModel> _trousersItems = [];
  List<WardrobeItemModel> _shoesItems = [];

  Future<void> _loadAllItems() async {
    // Load items for each category
    List<WardrobeItemModel> tShirtItems =
        await WardrobeItemModel.loadItemsByCategory('T-Shirt');
    List<WardrobeItemModel> trousersItems =
        await WardrobeItemModel.loadItemsByCategory('Trousers');
    List<WardrobeItemModel> shoesItems =
        await WardrobeItemModel.loadItemsByCategory('Shoes');

    setState(() {
      _tShirtItems = tShirtItems;
      _trousersItems = trousersItems;
      _shoesItems = shoesItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * .25,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(8.r),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomButton(
                          text: "Pick From Gallery",
                          onTap: () async {
                            await _pickAndSaveImageFromGallery(context);
                          },
                        ),
                        CustomButton(
                          text: "Pick From Camera",
                          onTap: () async {
                            await _pickAndSaveImageFromCamera(context);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
        child: const Icon(
          FontAwesomeIcons.camera,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 50.h),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                const Spacer(
                  flex: 3,
                ),
                AppText(
                  text: "Wardrobe".toUpperCase(),
                  size: 26.sp,
                  weight: FontWeight.w700,
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      context.pushNamed(Routes.wardrobeView);
                    },
                    child: const Text("Test mode"))
              ],
            ),
            Gap(8.h),
            AppText(text: "Long press on item to remove", size: 16.sp),
            const Spacer(),
            _tShirtItems.isEmpty &&
                    _trousersItems.isEmpty &&
                    _shoesItems.isEmpty
                ? Center(
                    child: AppText(
                    text: "No items found",
                    size: 18.sp,
                    weight: FontWeight.w600,
                  ))
                : Column(children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .22,
                      width: double.infinity,
                      child: PageView.builder(
                        physics: const BouncingScrollPhysics(),
                        controller: pc1,
                        itemCount: _tShirtItems.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: GestureDetector(
                              onTap: () {
                                context.pushNamed(
                                    Routes.wardrobeItemDetailsView,
                                    arguments: _tShirtItems[index]);
                              },
                              onLongPress: () =>
                                  _removeItem(context, _tShirtItems[index]),
                              child: Container(
                                constraints: BoxConstraints(minHeight: 250.h),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: _tShirtItems.isEmpty
                                      ? const SizedBox.shrink()
                                      : Image.file(
                                          _tShirtItems[index].image,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Gap(8.h),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .22,
                      width: double.infinity,
                      child: PageView.builder(
                        physics: const BouncingScrollPhysics(),
                        controller: pc2,
                        itemCount: _trousersItems.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: GestureDetector(
                              onTap: () {
                                context.pushNamed(
                                    Routes.wardrobeItemDetailsView,
                                    arguments: _trousersItems[index]);
                              },
                              onLongPress: () =>
                                  _removeItem(context, _trousersItems[index]),
                              child: Container(
                                constraints: BoxConstraints(minHeight: 250.h),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: _trousersItems.isEmpty
                                      ? const SizedBox.shrink()
                                      : Image.file(
                                          _trousersItems[index].image,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Gap(8.h),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .22,
                      width: double.infinity,
                      child: PageView.builder(
                        physics: const BouncingScrollPhysics(),
                        controller: pc3,
                        itemCount: _shoesItems.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: GestureDetector(
                              onTap: () {
                                context.pushNamed(
                                    Routes.wardrobeItemDetailsView,
                                    arguments: _shoesItems[index]);
                              },
                              onLongPress: () =>
                                  _removeItem(context, _shoesItems[index]),
                              child: Container(
                                constraints: BoxConstraints(minHeight: 250.h),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: _shoesItems.isEmpty
                                      ? const SizedBox.shrink()
                                      : Image.file(
                                          _shoesItems[index].image,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ]),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Future<void> _pickAndSaveImageFromGallery(BuildContext context) async {
    File? pickedImage = await _pickImageFromGallery();
    if (pickedImage != null) {
      String? mlCategory = await detectimage(pickedImage);
      log(v);
      if (mlCategory != null) {
        bool? mlCategoryTrue =
            await _showCategoryConfirmDialog(context, mlCategory);
        if (mlCategoryTrue!) {
          File? savedImage = await _saveImageLocally(pickedImage);
          if (savedImage != null) {
            WardrobeItemModel newItem = WardrobeItemModel(
              image: savedImage,
              category: mlCategory,
            );

            // Add the item to the corresponding category list in SharedPreferences
            await WardrobeItemModel.addItemToPreferences(newItem);

            setState(() {
              _imageFile = savedImage;
            });

            print("Image and category saved: ${newItem.toMap()}");
          }
        } else {
          String? category = await _showCategoryDialog(context);
          if (category != null) {
            File? savedImage = await _saveImageLocally(pickedImage);
            if (savedImage != null) {
              WardrobeItemModel newItem = WardrobeItemModel(
                image: savedImage,
                category: category,
              );

              // Add the item to the corresponding category list in SharedPreferences
              await WardrobeItemModel.addItemToPreferences(newItem);

              setState(() {
                _imageFile = savedImage;
              });

              print("Image and category saved: ${newItem.toMap()}");
            }
          }
        }
      } else {
        String? category = await _showCategoryDialog(context);
        if (category != null) {
          File? savedImage = await _saveImageLocally(pickedImage);
          if (savedImage != null) {
            WardrobeItemModel newItem = WardrobeItemModel(
              image: savedImage,
              category: category,
            );

            // Add the item to the corresponding category list in SharedPreferences
            await WardrobeItemModel.addItemToPreferences(newItem);

            setState(() {
              _imageFile = savedImage;
            });

            print("Image and category saved: ${newItem.toMap()}");
          }
        }
      }
    }
    _loadAllItems();
    context.pop();
  }

  Future<void> _pickAndSaveImageFromCamera(BuildContext context) async {
    File? pickedImage = await _pickImageFromCamera();
    if (pickedImage != null) {
      String? category = await _showCategoryDialog(context);
      if (category != null) {
        File? savedImage = await _saveImageLocally(pickedImage);
        if (savedImage != null) {
          WardrobeItemModel newItem = WardrobeItemModel(
            image: savedImage,
            category: category,
          );

          // Add the item to the corresponding category list in SharedPreferences
          await WardrobeItemModel.addItemToPreferences(newItem);

          setState(() {
            _imageFile = savedImage;
          });

          print("Image and category saved: ${newItem.toMap()}");
        }
      }
    }
    _loadAllItems();
    context.pop();
  }

  Future<bool?> _showDeleteConfirmationDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Item'),
          content: const Text('Are you sure you want to delete this item?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Cancel
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Confirm delete
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _removeItem(BuildContext context, WardrobeItemModel item) async {
    bool? confirmDelete = await _showDeleteConfirmationDialog(context);

    if (confirmDelete == true) {
      // Proceed with deletion if confirmed
      await WardrobeItemModel.removeItemFromPreferences(item);

      // Reload the items after removal
      await _loadAllItems();
    }
  }
}

Future<File?> _pickImageFromCamera() async {
  final ImagePicker picker = ImagePicker();
  final XFile? pickedImage = await picker.pickImage(source: ImageSource.camera);

  if (pickedImage != null) {
    return File(pickedImage.path);
  }
  return null;
}

Future<File?> _pickImageFromGallery() async {
  final ImagePicker picker = ImagePicker();
  final XFile? pickedImage =
      await picker.pickImage(source: ImageSource.gallery);

  if (pickedImage != null) {
    return File(pickedImage.path);
  }
  return null;
}

Future<File?> _saveImageLocally(File imageFile) async {
  try {
    final directory = await getApplicationDocumentsDirectory();
    final String imagePath =
        path.join(directory.path, path.basename(imageFile.path));
    return await imageFile.copy(imagePath);
  } catch (e) {
    return null;
  }
}

Future<String?> _showCategoryDialog(BuildContext context) async {
  String? selectedCategory;
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Select Item Category'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: const Text('T-Shirt'),
              onTap: () {
                selectedCategory = 'T-Shirt';
                Navigator.of(context).pop(selectedCategory);
              },
            ),
            ListTile(
              title: const Text('Trousers'),
              onTap: () {
                selectedCategory = 'Trousers';
                Navigator.of(context).pop(selectedCategory);
              },
            ),
            ListTile(
              title: const Text('Shoes'),
              onTap: () {
                selectedCategory = 'Shoes';
                Navigator.of(context).pop(selectedCategory);
              },
            ),
          ],
        ),
      );
    },
  );
}

Future<bool?> _showCategoryConfirmDialog(
    BuildContext context, String category) async {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'The selected category is',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        content: SizedBox(
          height: 100,
          child: Center(
            child: Text(
              category,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
              foregroundColor: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text(
              'No',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
              foregroundColor: Colors.black,
              backgroundColor: Colors.green.shade300,
            ),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text(
              'Yes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      );
    },
  );
}

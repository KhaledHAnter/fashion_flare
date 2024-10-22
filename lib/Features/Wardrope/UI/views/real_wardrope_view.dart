import 'dart:developer';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fashion_flare/Core/Helper/constants.dart';
import 'package:tflite_v2/tflite_v2.dart';
import 'package:uuid/uuid.dart';

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
import 'package:http/http.dart' as http;

class RealWardropeView extends StatefulWidget {
  const RealWardropeView({super.key});

  @override
  State<RealWardropeView> createState() => _RealWardropeViewState();
}

class _RealWardropeViewState extends State<RealWardropeView> {
  late PageController pc1;
  late PageController pc2;
  late PageController pc3;

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
        backgroundColor: kPrimaryColor,
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
        if (mlCategoryTrue != null && mlCategoryTrue) {
          File? processedImage;

          try {
            // Try to remove the background using the RemoveBG API
            processedImage = await _removeBackground(pickedImage);
          } catch (e) {
            print("Background removal failed: $e");
          }

          // If background removal fails, use the original image
          processedImage ??= pickedImage;

          // Save the image (whether it's processed or the original)
          File? savedImage = await _saveImageLocally(processedImage);

          if (savedImage != null) {
            WardrobeItemModel newItem = WardrobeItemModel(
              image: savedImage,
              category: mlCategory,
            );

            // Add the item to the corresponding category list in SharedPreferences
            await WardrobeItemModel.addItemToPreferences(newItem);

            print("Image and category saved: ${newItem.toMap()}");
          }
        } else {
          String? category = await _showCategoryDialog(context);
          if (category != null) {
            File? processedImage;

            try {
              // Try to remove the background using the RemoveBG API
              processedImage = await _removeBackground(pickedImage);
            } catch (e) {
              print("Background removal failed: $e");
            }

            // If background removal fails, use the original image
            processedImage ??= pickedImage;

            // Save the image (whether it's processed or the original)
            File? savedImage = await _saveImageLocally(processedImage);

            if (savedImage != null) {
              WardrobeItemModel newItem = WardrobeItemModel(
                image: savedImage,
                category: category,
              );

              // Add the item to the corresponding category list in SharedPreferences
              await WardrobeItemModel.addItemToPreferences(newItem);

              print("Image and category saved: ${newItem.toMap()}");
            }
          }
        }
      } else {
        String? category = await _showCategoryDialog(context);
        if (category != null) {
          File? processedImage;

          try {
            // Try to remove the background using the RemoveBG API
            processedImage = await _removeBackground(pickedImage);
          } catch (e) {
            print("Background removal failed: $e");
          }

          // If background removal fails, use the original image
          processedImage ??= pickedImage;

          // Save the image (whether it's processed or the original)
          File? savedImage = await _saveImageLocally(processedImage);

          if (savedImage != null) {
            WardrobeItemModel newItem = WardrobeItemModel(
              image: savedImage,
              category: category,
            );

            // Add the item to the corresponding category list in SharedPreferences
            await WardrobeItemModel.addItemToPreferences(newItem);

            print("Image and category saved: ${newItem.toMap()}");
          }
        }
      }
    }
    _loadAllItems();
    if (context.mounted) {
      context.pop();
    }
  }

  Future<void> _pickAndSaveImageFromCamera(BuildContext context) async {
    File? pickedImage = await _pickImageFromCamera();
    if (pickedImage != null) {
      String? mlCategory = await detectimage(pickedImage);
      log(v);
      if (mlCategory != null) {
        bool? mlCategoryTrue =
            await _showCategoryConfirmDialog(context, mlCategory);
        if (mlCategoryTrue != null && mlCategoryTrue) {
          File? processedImage;

          try {
            // Try to remove the background using the RemoveBG API
            processedImage = await _removeBackground(pickedImage);
          } catch (e) {
            print("Background removal failed: $e");
          }

          // If background removal fails, use the original image
          processedImage ??= pickedImage;

          // Save the image (whether it's processed or the original)
          File? savedImage = await _saveImageLocally(processedImage);

          if (savedImage != null) {
            WardrobeItemModel newItem = WardrobeItemModel(
              image: savedImage,
              category: mlCategory,
            );

            // Add the item to the corresponding category list in SharedPreferences
            await WardrobeItemModel.addItemToPreferences(newItem);

            print("Image and category saved: ${newItem.toMap()}");
          }
        } else {
          String? category = await _showCategoryDialog(context);
          if (category != null) {
            File? processedImage;

            try {
              // Try to remove the background using the RemoveBG API
              processedImage = await _removeBackground(pickedImage);
            } catch (e) {
              print("Background removal failed: $e");
            }

            // If background removal fails, use the original image
            processedImage ??= pickedImage;

            // Save the image (whether it's processed or the original)
            File? savedImage = await _saveImageLocally(processedImage);

            if (savedImage != null) {
              WardrobeItemModel newItem = WardrobeItemModel(
                image: savedImage,
                category: category,
              );

              // Add the item to the corresponding category list in SharedPreferences
              await WardrobeItemModel.addItemToPreferences(newItem);

              print("Image and category saved: ${newItem.toMap()}");
            }
          }
        }
      } else {
        String? category = await _showCategoryDialog(context);
        if (category != null) {
          File? processedImage;

          try {
            // Try to remove the background using the RemoveBG API
            processedImage = await _removeBackground(pickedImage);
          } catch (e) {
            print("Background removal failed: $e");
          }

          // If background removal fails, use the original image
          processedImage ??= pickedImage;

          // Save the image (whether it's processed or the original)
          File? savedImage = await _saveImageLocally(processedImage);

          if (savedImage != null) {
            WardrobeItemModel newItem = WardrobeItemModel(
              image: savedImage,
              category: category,
            );

            // Add the item to the corresponding category list in SharedPreferences
            await WardrobeItemModel.addItemToPreferences(newItem);

            print("Image and category saved: ${newItem.toMap()}");
          }
        }
      }
    }
    _loadAllItems();
    if (context.mounted) {
      context.pop();
    }
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

Future<bool> _checkInternetConnection() async {
  var connectivityResult = await Connectivity().checkConnectivity();

  // Check if the device is connected to either Wi-Fi or mobile data
  if (connectivityResult.contains(ConnectivityResult.mobile) ||
      connectivityResult.contains(ConnectivityResult.wifi)) {
    return true; // Device is connected to the internet
  } else {
    return false; // No internet connection
  }
}

Future<File?> _removeBackground(File imageFile) async {
  bool isConnected = await _checkInternetConnection();
  log(isConnected.toString());
  if (!isConnected) {
    return null;
  }
  const apiKey =
      'ApZ9RRq5PcU7D9z22VWtx5M5'; // Replace with your RemoveBG API key
  final url = Uri.parse('https://api.remove.bg/v1.0/removebg');

  try {
    // Prepare the request
    var request = http.MultipartRequest('POST', url);
    request.headers['X-Api-Key'] = apiKey;

    // Add the image file to the request
    request.files.add(
      await http.MultipartFile.fromPath('image_file', imageFile.path),
    );

    // Send the request to RemoveBG API
    var response = await request.send();

    // Check if the response is successful
    if (response.statusCode == 200) {
      // Get the bytes from the response
      var bytes = await response.stream.toBytes();

      // Generate a unique file name using a UUID
      String uniqueFileName = const Uuid().v4(); // Generates a unique ID
      String tempDir =
          Directory.systemTemp.path; // Using the system's temporary directory
      String filePath =
          '$tempDir/no_bg_image_$uniqueFileName.png'; // Unique file path

      // Write the bytes to the file
      File file = File(filePath);
      await file.writeAsBytes(bytes);

      return file; // Return the file with background removed
    } else {
      print('Error: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Exception occurred during RemoveBG API call: $e');
    return null;
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethods {
  Future addWallpaper(
      Map<String, dynamic> wallpaperInfoMap, String id, String category) async {
    return await FirebaseFirestore.instance
        .collection(category)
        .doc(id)
        .set(wallpaperInfoMap);
  }
}

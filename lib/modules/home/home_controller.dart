import 'package:get/get.dart';

class HomeController extends GetxController {

  var selectedNavIndex = 0.obs;

  void changeNavIndex(int index) {
    print("BottomNav tapped → index: $index");
    selectedNavIndex.value = index;
    print("Updated selectedNavIndex → ${selectedNavIndex.value}");
  }

  /// ----------------------------
  /// Loading States
  /// ----------------------------

  var loadingHeader = true.obs;
  var loadingChannels = true.obs;

  /// ----------------------------
  /// Category Tabs
  /// ----------------------------

  final categories = [
    "Sports",
    "News",
    "Movies",
    "Kids",
    "Entertainment",
  ].obs;

  var selectedCategory = 0.obs;

  void changeCategory(int index) {
    selectedCategory.value = index;
  }

  /// ----------------------------
  /// Bottom Navigation
  /// ----------------------------

  // var selectedNavIndex = 0.obs;
  //
  // void changeNavIndex(int index) {
  //   selectedNavIndex.value = index;
  // }

  /// ----------------------------
  /// Channels Data
  /// ----------------------------

  final channels = [
    {
      "name": "ESPN HD",
      "logo":
      "https://images.unsplash.com/photo-1618835350763-ee971e156096?q=80&w=1074"
    },
    {
      "name": "FOX Sports",
      "logo":
      "https://images.unsplash.com/photo-1607627000458-210e8d2bdb1d?q=80&w=1149"
    },
    {
      "name": "NBC Sports",
      "logo":
      "https://images.unsplash.com/photo-1620629469394-63161e3a9f8d?q=80&w=1331"
    },
    {
      "name": "Sky Sports",
      "logo":
      "https://images.unsplash.com/photo-1742805382148-48e9953ad797?q=80&w=1332"
    },
  ].obs;

  /// ----------------------------
  /// Init
  /// ----------------------------

  @override
  void onInit() {
    super.onInit();
    loadHome();
  }

  /// ----------------------------
  /// Fake Loading
  /// ----------------------------

  void loadHome() async {

    await Future.delayed(const Duration(seconds: 1));
    loadingHeader.value = false;

    await Future.delayed(const Duration(seconds: 1));
    loadingChannels.value = false;

  }

}
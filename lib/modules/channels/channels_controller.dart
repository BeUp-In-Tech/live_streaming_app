import 'package:get/get.dart';

class ChannelsController extends GetxController {

  var selectedCategory = 0.obs;
  var loadingChannels = true.obs;

  final categories = [
    "All Channels",
    "NBA League Pass",
    "NFL Sunday",
    "Formula 1",
  ].obs;

  final channels = [
    {
      "name": "NBA TV HD",
      "desc": "Warriors vs. Celtics (Live)",
      "logo": "https://images.unsplash.com/photo-1444491741275-3747c53c99b4?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "name": "ESPN HD",
      "desc": "SportsCenter with Scott Van Pelt",
      "logo": "https://plus.unsplash.com/premium_photo-1719430631552-c0846035ee4b?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "name": "NFL Network",
      "desc": "Good Morning Football",
      "logo": "https://images.unsplash.com/photo-1560089000-7433a4ebbd64?q=80&w=735&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "name": "Bally Sports West",
      "desc": "Angels vs. Rangers",
      "logo": "https://images.unsplash.com/photo-1556817411-31ae72fa3ea0?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "name": "F1 TV Pro",
      "desc": "Practice 1 - Abu Dhabi GP",
      "logo": "https://images.unsplash.com/photo-1489944440615-453fc2b6a9a9?q=80&w=1323&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
  ].obs;

  @override
  void onInit() {
    super.onInit();
    loadChannels();
  }

  void loadChannels() async {

    await Future.delayed(const Duration(seconds: 2));

    loadingChannels.value = false;

  }
}
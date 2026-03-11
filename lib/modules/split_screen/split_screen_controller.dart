import 'package:get/get.dart';

class SplitScreenController extends GetxController {
  final streams = [
    {
      "title": "ESPN HD",
      "desc": "NBA: Lakers vs Celtics",
      "image":
          "https://images.unsplash.com/photo-1540575467063-178a50c2df87?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "title": "Sky Sports Main Event",
      "desc": "NBA: Lakers vs Celtics",
      "image":
          "https://images.unsplash.com/photo-1565992441121-4367c2967103?q=80&w=627&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "title": "TNT Sports 1",
      "desc": "ATP Tour Masters",
      "image":
          "https://plus.unsplash.com/premium_photo-1685118419397-c8ed456734ec?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
  ].obs;

  var selectedAudio = 0.obs;

  void selectAudio(int index) {
    selectedAudio.value = index;
  }
}

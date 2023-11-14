import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hotel_app/screeens/hotel_search/model/room_model.dart';

class SearchFilterController extends GetxController {
  RxInt rooms = 0.obs;
  RxInt adults = 0.obs;
  RxInt children = 0.obs;
  RxBool state = false.obs;
  // RxList<int> childrenAges = (List<int>.of([])).obs;
  RxList<RoomModel> roomList = (List<RoomModel>.of([])).obs;

  updateChildAge(i, j, value) {
    print('i: ${i}');
    print('value: ${value}');
    int extractedAge = extractInt(value);
    roomList[i].children[j] = extractedAge;
    update();
  }

  int extractInt(String input) {
    RegExp regExp = RegExp(r'\d+');

    Iterable<Match> matches = regExp.allMatches(input);

    if (matches.isNotEmpty) {
      String? matched = matches.elementAt(0).group(0);
      return int.tryParse(matched!) ?? 0;
    } else {
      return 0;
    }
  }

  clearValues() {
    rooms.value = 0;
    adults.value = 0;
    children.value = 0;
    roomList.clear();
    update();
  }

  updateSwitchBtn(value) {
    state.value = value;
    update();
  }

  void increFun() {
    rooms = rooms + 1;
    roomList.add(RoomModel(adults: 1, children: []));
    update();
  }

  void decreFun() {
    rooms = rooms - 1;
    roomList.removeLast();
    update();
  }

  void increAdultsFun(i) {
    roomList[i].adults = roomList[i].adults + 1;
    update();
  }

  void decreAdultsFun(i) {
    roomList[i].adults = roomList[i].adults - 1;
    update();
  }

  void increChildFun(i) {
    roomList[i].children.add(10);
    update();
  }

  void decreChildFun(i) {
    roomList[i].children.removeLast();
    update();
  }

  getAllCount() {
    for (var e in roomList) {
      adults.value = adults.value + e.adults;
      children.value = children.value + e.children.length;
      update();
    }
  }
}

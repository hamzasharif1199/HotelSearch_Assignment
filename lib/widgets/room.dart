import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hotel_app/screeens/hotel_search/controller/search_controller.dart';
import 'package:hotel_app/widgets/inc_dec_btn.dart';

Widget room(SearchFilterController controller, context, i) {
  return Container(
    margin: EdgeInsets.only(bottom: 10),
    padding: EdgeInsets.all(20),
    width: double.infinity,
    // height: 50,
    decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(10)),
    child: Column(
      children: [
        Row(
          children: [
            Text(
              "ROOM ${i + 1}",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Adults  ",
              style: TextStyle(fontSize: 20, color: Color(0xff384347)),
            ),
            Row(
              children: [
                incDecBtn(
                    isInc: false,
                    isActive: controller.roomList[i].adults <= 0 ? false : true,
                    onTap: () {
                      if (controller.roomList[i].adults > 0) {
                        controller.decreAdultsFun(i);
                      }
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "${controller.roomList[i].adults}",
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                incDecBtn(
                    isInc: true,
                    isActive: true,
                    onTap: () {
                      controller.increAdultsFun(i);
                    }),
              ],
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Children",
              style: TextStyle(fontSize: 20, color: Color(0xff384347)),
            ),
            Row(
              children: [
                incDecBtn(
                    isInc: false,
                    isActive: controller.roomList[i].children.length <= 0 ? false : true,
                    onTap: () {
                      if (controller.roomList[i].children.length > 0) {
                        controller.decreChildFun(i);
                      }
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "${controller.roomList[i].children.length}",
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                incDecBtn(
                    isInc: true,
                    isActive: true,
                    onTap: () {
                      controller.increChildFun(i);
                    }),
              ],
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height *
                  0.15), // Set a maximum height

          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: controller.roomList[i].children.length,
                      itemBuilder: (context, index) {
                        int age = controller.roomList[i].children[index];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Age of child ${index + 1}',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff1c2026),
                                  fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              width: Get.width * 0.2,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                initialValue: "${age.toString()} year",
                                onChanged: (value) {
                                  controller.updateChildAge(i,index, value);
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(
        //       horizontal: 30),
        //   child: Column(
        //     children: controller.childrenAges
        //         .asMap()
        //         .entries
        //         .map((entry) {
        //       int index = entry.key;
        //       int age = entry.value;
        //       return Row(
        //         mainAxisAlignment:
        //             MainAxisAlignment.spaceBetween,
        //         children: [
        //           Text(
        //             'Age of child ${index + 1}',
        //             style: TextStyle(
        //                 fontSize: 16,
        //                 color: Color(0xff1c2026),
        //                 fontWeight: FontWeight.w300),
        //           ),
        //           SizedBox(
        //             width: Get.width * 0.2,
        //             child: TextFormField(
        //               keyboardType:
        //                   TextInputType.number,
        //               decoration: InputDecoration(
        //                 border: InputBorder.none,
        //               ),
        //               initialValue:
        //                   "${age.toString()} year",
        //               onChanged: (value) {
        //                 controller.updateChildAge(
        //                     index, value);
        //               },
        //             ),
        //           ),
        //         ],
        //       );
        //     }).toList(),
        //   ),
        // ),
      ],
    ),
  );
}

import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_app/widgets/inc_dec_btn.dart';

import '../../../widgets/room.dart';
import '../controller/search_controller.dart';

roomFilterModalBottomSheet(context) {
  print("object");
  showModalBottomSheet(
      backgroundColor: Color(0xffebeced),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      )),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext bc) {
        return FractionallySizedBox(
          heightFactor: 0.95,
          child: GetBuilder<SearchFilterController>(
              init: SearchFilterController(),
              builder: (controller) {
                return SizedBox(
                  height: MediaQuery.of(bc).size.height,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            )),
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(),
                            Text(
                              "Room and Guests",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  controller.clearValues();
                                  Get.back();
                                },
                                child: Icon(Icons.close))
                          ],
                        ),
                      ),
                      Container(
                        // constraints: BoxConstraints(
                        //     maxHeight:
                        //         MediaQuery.of(context).size.height * 0.85),
                        height: MediaQuery.of(bc).size.height * 0.85,
                        // color: Colors.amber,
                        color: Color(0xffebeced),
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: Column(
                          children: [
                            Container(
                                //
                                child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: Offset(
                                          0, 0), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Text(
                                    "Rooms",
                                    style: TextStyle(
                                        fontSize: 20, color: Color(0xff384347)),
                                  ),
                                  Row(
                                    children: [
                                      incDecBtn(
                                          isInc: false,
                                          isActive: controller.rooms <= 0
                                              ? false
                                              : true,
                                          onTap: () {
                                            if (controller.rooms > 0) {
                                              controller.decreFun();
                                            }
                                          }),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Text(
                                          "${controller.rooms}",
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      incDecBtn(
                                          isInc: true,
                                          isActive: true,
                                          onTap: () {
                                            controller.increFun();
                                          }),
                                    ],
                                  )
                                ],
                              ),
                            )),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              // height: Get.height * .5,
                              constraints: BoxConstraints(
                                  maxHeight:
                                      MediaQuery.of(context).size.height * 0.5),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    ListView(
                                      shrinkWrap: true,
                                      physics: ClampingScrollPhysics(),
                                      children: [
                                        FadeInUp(
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            physics: ClampingScrollPhysics(),
                                            itemCount:
                                                controller.roomList.length,
                                            itemBuilder: (context, index) {
                                              return FadeInUp(
                                                child: room(
                                                    controller, context, index),
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: Offset(
                                          0, 0), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Pet-friendly',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(Icons.info_outline),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                              "only show stays that allow pets"),
                                        ],
                                      )
                                    ],
                                  ),
                                  CupertinoSwitch(
                                    value: controller.state.value,
                                    onChanged: (value) {
                                      controller.updateSwitchBtn(value);
                                    },
                                    thumbColor: CupertinoColors.white,
                                    activeColor: CupertinoColors.activeBlue,
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            FadeInUpBig(
                              child: GestureDetector(
                                onTap: () {
                                  Get.back();
                                  controller.getAllCount();
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: Color(0xff007bc1),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                      "Apply",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
        );
      });
}

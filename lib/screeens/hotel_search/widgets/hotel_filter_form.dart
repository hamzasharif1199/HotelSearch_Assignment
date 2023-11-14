import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hotel_app/screeens/hotel_search/controller/search_controller.dart';
import 'package:hotel_app/screeens/hotel_search/widgets/date_piker.dart';
import 'package:hotel_app/screeens/hotel_search/widgets/room_filter_sheet.dart';
import 'package:hotel_app/utils/colors.dart';

import '../../../utils/constants.dart';

class HotelfilterForm extends StatefulWidget {
  const HotelfilterForm({Key? key}) : super(key: key);

  @override
  _HotelfilterFormState createState() => _HotelfilterFormState();
}

class _HotelfilterFormState extends State<HotelfilterForm> {
  String? selectedValue;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xff1274bd),
            Color(0xff50b7fe),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // city
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(5),
                child: DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    // Add Horizontal padding using menuItemStyleData.padding so it matches
                    // the menu padding when button's width is not specified.
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    // focusColor: Colors.red,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffb9e6fd),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabled: true,
                    // Add more decoration..
                  ),
                  hint: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Select City',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.blue,
                        ),
                      ),
                    ],
                  ),
                  items: cityItems
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: TextStyle(
                                fontSize: 18,
                                color: AppColors.blue,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select Nationality.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    //Do something when selected item is changed.
                  },
                  onSaved: (value) {
                    selectedValue = value.toString();
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 0),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: SizedBox(),
                    // Icon(
                    //   Icons.keyboard_arrow_down_outlined,
                    //   color: Colors.black45,
                    // ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              DatePiker(),
              const SizedBox(height: 10),

              // Nationality
              DropdownButtonFormField2<String>(
                isExpanded: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  // Add Horizontal padding using menuItemStyleData.padding so it matches
                  // the menu padding when button's width is not specified.
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  // Add more decoration..
                ),
                hint: const Text(
                  'Select Nationality',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.blue,
                  ),
                ),
                items: nationalityItems
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.blue,
                            ),
                          ),
                        ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please select Nationality.';
                  }
                  return null;
                },
                onChanged: (value) {
                  //Do something when selected item is changed.
                },
                onSaved: (value) {
                  selectedValue = value.toString();
                },
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.only(right: 8),
                ),
                iconStyleData: const IconStyleData(
                  icon: Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Colors.black45,
                    ),
                  ),
                  iconSize: 24,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
              const SizedBox(height: 10),
              GetBuilder<SearchFilterController>(
                  init: SearchFilterController(),
                  builder: (controller) {
                    return GestureDetector(
                      onTap: () {
                        roomFilterModalBottomSheet(context);
                      },
                      child: Container(
                        height: 57,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        padding: EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '${controller.rooms} Room, ${controller.adults} Adults, ${controller.children} Children',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blue,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Color(0xff9ba1ad),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
              // GestureDetector(
              //   onTap: () {
              //     roomFilterModalBottomSheet(context);
              //   },
              //   child: DropdownButtonFormField2<String>(
              //     isExpanded: true,
              //     decoration: InputDecoration(
              //       filled: true,
              //       fillColor: Colors.white,
              //       // Add Horizontal padding using menuItemStyleData.padding so it matches
              //       // the menu padding when button's width is not specified.
              //       contentPadding: const EdgeInsets.symmetric(vertical: 16),
              //       border: OutlineInputBorder(
              //         borderSide: BorderSide.none,
              //         borderRadius: BorderRadius.circular(15),
              //       ),
              //       // Add more decoration..
              //     ),
              // hint: const Text(
              //   '1 Room, 2 Adults, 0 Children',
              //   style: TextStyle(
              //     fontSize: 18,
              //     color: AppColors.blue,
              //   ),
              // ),
              //     items: roomTypesItems
              //         .map((item) => DropdownMenuItem<String>(
              //               value: item,
              //               child: Text(
              //                 item,
              //                 style: TextStyle(
              //                   fontSize: 18,
              //                   color: AppColors.blue,
              //                 ),
              //               ),
              //             ))
              //         .toList(),
              //     validator: (value) {
              //       if (value == null) {
              //         return 'Please select Room.';
              //       }
              //       return null;
              //     },
              //     onChanged: (value) {
              //       //Do something when selected item is changed.
              //     },
              //     onSaved: (value) {
              //       selectedValue = value.toString();
              //     },
              //     buttonStyleData: const ButtonStyleData(
              //       padding: EdgeInsets.only(right: 8),
              //     ),
              //     iconStyleData: const IconStyleData(
              //       icon: Icon(
              //         Icons.keyboard_arrow_down_outlined,
              //         color: Colors.black45,
              //       ),
              //       iconSize: 24,
              //     ),
              //     dropdownStyleData: DropdownStyleData(
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(15),
              //       ),
              //     ),
              //     menuItemStyleData: const MenuItemStyleData(
              //       padding: EdgeInsets.symmetric(horizontal: 16),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

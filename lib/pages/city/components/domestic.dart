import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hubang/data/db/database.dart';
import 'package:flutter_hubang/data/db/locations/locations_dao.dart';
import 'package:flutter_hubang/model/city/area.dart';
import 'package:flutter_hubang/model/city/city_pinying.dart';
import 'package:drift/drift.dart' as D;
import 'package:flutter_hubang/utils/adapt.dart';
import 'package:flutter_hubang/utils/location_controller.dart';
import 'package:get/get.dart';
import 'package:lpinyin/lpinyin.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class Domestic extends GetView<DomesticController> {
  const Domestic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DomesticController());
    return Stack(
      children: [
        //主体滚动内容
        Obx(
          () => ScrollablePositionedList.builder(
            itemScrollController: controller.itemScrollController,
            itemPositionsListener: controller.itemPositionsListener,
            itemCount: controller.letterCount.value,
            itemBuilder: (BuildContext context, int index) {
              //获取字母列表
              String key = controller.letterList[index];
              //获取字母对应列表
              List<City> cityList =
                  key == "定位" ? [] : controller.cityMap[key]!.toList();
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    index != 0
                        ? Container()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [currentCity(), location()],
                          ),
                    index == 0
                        ? Container()
                        : Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Adapt.px(20),
                                vertical: Adapt.px(15)),
                            child: Text(
                              key,
                              style: TextStyle(fontSize: Adapt.px(30)),
                            ),
                          ),
                    ListView.builder(
                      itemBuilder: (context, index) {
                        City entity = cityList[index];
                        return titleItem(entity);
                      },
                      itemCount: cityList.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(0),
                      physics: const NeverScrollableScrollPhysics(),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        //右边Nav
        Obx(
          () => Positioned(
              top: Adapt.px(130),
              bottom: Adapt.px(100),
              right: 0,
              width: Adapt.px(60),
              child: Container(
                color: controller.navBackground.value,
                child: LayoutBuilder(builder: (context, constraints) {
                  controller.letterHeight = constraints.maxHeight;

                  return GestureDetector(
                    onVerticalDragDown: (details) {
                      //点击变色
                      controller.navBackground.value = Colors.black12;
                      int clickIndex = (details.localPosition.dy ~/
                              controller.letterItemHeight)
                          .clamp(0, controller.letterCount.value - 1);
                      calculateLetters(clickIndex);
                      toLetter(clickIndex);
                    },
                    onVerticalDragEnd: (details) {
                      controller.navBackground.value = Colors.transparent;
                      controller.isHideLetter.value = true;
                    },
                    onVerticalDragCancel: () {
                      controller.navBackground.value = Colors.transparent;
                      controller.isHideLetter.value = true;
                    },
                    onVerticalDragUpdate: (details) {
                      int clickIndex = (details.localPosition.dy ~/
                              controller.letterItemHeight)
                          .clamp(0, controller.letterCount.value - 1);
                      calculateLetters(clickIndex);

                      toLetter(clickIndex);
                    },
                    child: Obx(
                      () => Column(
                        children: letterNav(),
                      ),
                    ),
                  );
                }),
              )),
        ),
        Obx(
          () => Offstage(
            offstage: controller.isHideLetter.value,
            child: Center(
              child: Container(
                width: Adapt.width / 3,
                height: Adapt.width / 3,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.all(Radius.circular(Adapt.px(20))),
                ),
                child: Center(
                  child: Text(
                    controller.currentLetter.value,
                    style: TextStyle(fontSize: Adapt.px(50)),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  //点击或移动到字母
  void toLetter(int clickIndex) {
    controller.itemScrollController.scrollTo(
        index: clickIndex,
        duration: const Duration(milliseconds: 1),
        curve: Curves.linear);
  }

  //计算当前字母
  void calculateLetters(int clickIndex) {
    //中间方块
    controller.isHideLetter.value = false;

    //中间方块内容
    controller.currentLetter.value = controller.letterList[clickIndex];
  }

  List<Widget> letterNav() {
    return controller.letterList
        .map((item) => Expanded(child: Text(item)))
        .toList();
  }

  //列表项
  Widget titleItem(City citys) {
    return InkWell(
      onTap: () => controller.onChangerCity(Location(city: citys.label)),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: Adapt.px(20)),
        child: Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1, color: Color(0xffe5e5e5)))),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: Adapt.px(20)),
            child: Text(
              citys.label,
              style: TextStyle(
                  fontSize: Adapt.px(36), fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }

  //选择城市
  Widget currentCity() {
    return Obx(
      () => ExpansionPanelList(
        elevation: 1,
        children: <ExpansionPanel>[
          ExpansionPanel(
            headerBuilder: (context, isExpanded) {
              print(controller.selectCity.value);
              return Row(children: [
                Text.rich(TextSpan(
                    style: TextStyle(
                        fontSize: Adapt.px(36), fontWeight: FontWeight.bold),
                    children: [
                      const TextSpan(text: "您正在看:"),
                      TextSpan(text: controller.selectCity.value)
                    ])),
                Expanded(
                    child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    controller.locationList[0].area == null ? "选择区县" : "切换区县",
                    style:
                        TextStyle(fontSize: Adapt.px(26), color: Colors.grey),
                  ),
                ))
              ]);
            },
            body: Padding(
              padding:
                  EdgeInsets.only(right: Adapt.px(50), bottom: Adapt.px(20)),
              child: Wrap(
                spacing: 12,
                runSpacing: 13,
                alignment: WrapAlignment.start,
                runAlignment: WrapAlignment.end,
                children: currentDistrict(
                    controller.locationList[0], controller.pinyingList),
              ),
            ),
            isExpanded: controller.isExpanded.value,
            canTapOnHeader: true,
          ),
        ],
        expansionCallback: (panelIndex, isExpanded) {
          controller.isExpanded.value = !controller.isExpanded.value;
        },
        animationDuration: const Duration(milliseconds: 1),
      ),
    );
  }

  //定位
  Widget location() {
    return Container(
      padding: EdgeInsets.all(Adapt.px(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "当前定位:",
            style: TextStyle(
                color: Colors.grey,
                fontSize: Adapt.px(38),
                fontWeight: FontWeight.w500),
          ),
          Wrap(
            children: [
              ButtonItem(
                location: Location(city: "北京"),
                text: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "定位失败,点击重试",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: Adapt.px(34),
                          fontWeight: FontWeight.w500),
                    ),
                    const Icon(
                      Icons.replay,
                      color: Colors.blue,
                    )
                  ],
                ),
              )
            ],
            spacing: 12,
            runSpacing: 13,
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.end,
          ),
          Text(
            "热门城市:",
            style: TextStyle(
                color: Colors.grey,
                fontSize: Adapt.px(38),
                fontWeight: FontWeight.w500),
          ),
          Wrap(
            children: generateList(),
            spacing: 12,
            runSpacing: 10,
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.end,
          ),
        ],
      ),
    );
  }
}

//计算当前城市
List<Widget> currentDistrict(Location location, List<CityPinying> allCity) {
  CityPinying getCityPinying =
      allCity.firstWhere((element) => element.name == location.city);
  City getDistrictList = getCityPinying.city;
  var areaName = getDistrictList.county.toList().map((e) => e.label);
  return areaName
      .map((item) => ButtonItem(
          location: Location(city: location.city, area: item),
          text: Text(
            item,
            style: TextStyle(
                color: Colors.blue,
                fontSize: Adapt.px(36),
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis),
          )))
      .toList();
}

//方框按钮
class ButtonItem extends StatelessWidget {
  const ButtonItem({
    Key? key,
    required this.text,
    required this.location,
  }) : super(key: key);

  final Widget text;
  final Location location;

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<DomesticController>();
    return ElevatedButton(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Adapt.px(20), vertical: Adapt.px(10)),
        child: text,
      ),
      onPressed: () => controller.onChangerCity(location),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xFFFFFFFF)),
        elevation: MaterialStateProperty.all<double>(Adapt.px(3)),
      ),
    );
  }
}

List<Widget> generateList() {
  return hotCity
      .map((item) => ButtonItem(
          location: Location(city: item),
          text: Text(
            item,
            style: TextStyle(
                color: Colors.blue,
                fontSize: Adapt.px(36),
                fontWeight: FontWeight.w500),
          )))
      .toList();
}

List<String> hotCity = [
  '北京',
  '上海',
  '深圳',
  '昆明',
  '广州',
  '成都',
  '杭州',
  '南京',
  '曲靖',
];

class DomesticController extends GetxController {
  var selectCity = "".obs;
  //显示与隐藏中间字母
  var isHideLetter = true.obs;

  //当前移动到的字母
  var currentLetter = "".obs;

  //字母Nav总高度
  var letterHeight = 0.0;

  //每个字母高度
  var letterItemHeight = 0.0;

  ///Nav背景颜色
  var navBackground = Colors.transparent.obs;

  ///城市总数
  var cityListLength = 0.obs;

  ///存储排序后的
  List<CityPinying> pinyingList = [];

  ///字母列表
  List letterList = [].obs;

  //字母总数
  var letterCount = 0.obs;

  ///分类
  Map<String, List<City>> cityMap = <String, List<City>>{};

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  ///读取城市信息
  var isExpanded = false.obs;

  Future<String> _loadAssets() async {
    return rootBundle.loadString('assets/data/citys.json');
  }

  ///城市排序分组
  Future loadData() async {
    String jsonString = await _loadAssets();
    final jsonResponse = json.decode(jsonString);

    List<Area> responses = getAreaList(jsonResponse);

    responses.forEach((item) {
      item.city.forEach((city) {
        cityListLength.value++;

        //处理拼音
        String cityName = city.label;
        String pinYin = PinyinHelper.getPinyin(cityName,
            separator: "", format: PinyinFormat.WITHOUT_TONE);
        pinyingList
            .add(CityPinying(pinying: pinYin, name: cityName, city: city));
      });
    });
    //排序
    pinyingList.sort((a, b) => a.pinying.compareTo(b.pinying));
    pinyingList.forEach((element) {
      String firstPinyin = element.pinying.substring(0, 1).toUpperCase();
      cityMap.putIfAbsent(firstPinyin, () => []).add(element.city);
    });
    //print(cityMap);
    letterList.addAll(cityMap.keys.toList());
    letterCount.value = letterList.length;
    //计算每个字母高度
    letterItemHeight = letterHeight / letterCount.value;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    getLocation();
    letterList.add("定位");
    loadData();
  }

  final LocationsDao locationsDao = Get.find<LocationsDao>();

  final List<Location> locationList = [];

  var isArea = false.obs;

  void getLocation() async {
    try {
      var list = await locationsDao.getDescLocations();
      if (list.isNotEmpty) {
        locationList.add(list[0]);
      }
    } catch (e) {}
    if (locationList[0].area == null) {
      selectCity.value = locationList[0].city;
      isArea.value = false;
    } else {
      selectCity.value = locationList[0].area!;
      isArea.value = true;
    }
    update();
  }

  //点击定位
  void onChangerCity(Location location) {
    if (location.city == locationList[0].city) {
      locationsDao.updateLocation(Location(
          id: locationList[0].id, city: location.city, area: location.area));
    } else {
      locationsDao.insertLocation(LocationsCompanion(
          city: D.Value(location.city), area: D.Value(location.area)));
    }
    var locationController = Get.find<LocationController>();
    locationController.updateLocation();
    Get.back();
  }
}

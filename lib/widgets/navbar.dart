import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:mtm/services/push_notifications_service.dart';
import 'package:mtm/setting/style.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:mtm/constants/Theme.dart';

import 'package:mtm/widgets/input.dart';

import '../routes/routes.dart';
import '../services/auth_service.dart';
import '../services/notification_service.dart';

class Navbar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final String categoryOne;
  final String categoryTwo;
  final bool searchBar;
  final bool backButton;
  final bool transparent;
  final bool rightOptions;
  final List<String>? tags;
  final Function? getCurrentPage;
  final bool isOnSearch;
  final TextEditingController? searchController;
  final Function? searchOnChanged;
  final bool searchAutofocus;
  final bool noShadow;
  final Color bgColor;
  final TabBar? tabBar;
  final Widget? container;
  final GlobalKey? keyScaffold;

  Navbar(
      {this.title = "Home",
      this.categoryOne = "",
      this.categoryTwo = "",
      this.tags,
      this.transparent = false,
      this.rightOptions = true,
      this.getCurrentPage,
      this.searchController,
      this.isOnSearch = false,
      this.searchOnChanged,
      this.searchAutofocus = false,
      this.backButton = false,
      this.noShadow = false,
      this.bgColor = Colors.white,
      this.searchBar = false,
      this.tabBar,
      this.keyScaffold,
      this.container});

  final double _prefferedHeight = 100.0;

  @override
  _NavbarState createState() => _NavbarState();

  @override
  Size get preferredSize => Size.fromHeight(_prefferedHeight);
}

class _NavbarState extends State<Navbar> {
  late String activeTag;

  final Connectivity connectivity = Connectivity();
  bool connected = true;

  ItemScrollController _scrollController = ItemScrollController();

  void initState() {
    if (widget.tags != null && widget.tags!.length != 0) {
      activeTag = widget.tags![0];
    }
    getConnectivity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final newNoti = Provider.of<PushNotificationService>(context).newNotiGet;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            height: 110,
            padding: EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
                color: !widget.transparent
                    ? widget.bgColor
                    : widget.title == "Inicio"
                        ? Colors.black12
                        : Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: !widget.transparent && !widget.noShadow
                          ? Colors.black.withOpacity(0.6)
                          : Colors.transparent,
                      spreadRadius: -10,
                      blurRadius: 12,
                      offset: Offset(0, 5))
                ]),
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        widget.backButton
                            ? IconButton(
                                icon: Icon(Icons.arrow_back_ios,
                                    color: !widget.transparent
                                        ? (widget.bgColor == Colors.white
                                            ? Colors.black
                                            : Colors.white)
                                        : widget.title == "Inicio"
                                            ? Colors.white
                                            : colorStyle.secondaryColor,
                                    size: 24.0),
                                onPressed: () {
                                  Navigator.pop(context);
                                })
                            : InkWell(
                                onTap: (() {
                                  Scaffold.of(context).openDrawer();
                                }),
                                child:
                                    Image.asset("assets/logo.png", scale: 3)),
                        SizedBox(
                          width: 10,
                        ),
                        widget.title == "Inicio"
                            ? SizedBox(
                                width: MediaQuery.of(context).size.width * 0.55,
                              )
                            : SizedBox(
                                width: MediaQuery.of(context).size.width * 0.57,
                                child: Container(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(widget.title,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: !widget.transparent
                                              ? (widget.bgColor == Colors.white
                                                  ? Colors.black
                                                  : Colors.white)
                                              : widget.title == "Inicio"
                                                  ? Colors.white
                                                  : colorStyle.secondaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19.0)),
                                ),
                              ),
                        (widget.rightOptions)
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, PageRoutes.noti);
                                    },
                                    child: (newNoti)
                                        ? Stack(
                                            children: [
                                              Icon(
                                                Icons
                                                    .notifications_active_outlined,
                                                color: widget.title == "Inicio"
                                                    ? Colors.white
                                                    : colorStyle.secondaryColor,
                                                size: 30,
                                              ),
                                              FractionalTranslation(
                                                translation:
                                                    Offset(1.80, -0.50),
                                                child: Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Icon(
                                                      Icons.circle,
                                                      size: 12,
                                                      color: colorStyle
                                                          .primaryColor,
                                                    )),
                                              )
                                            ],
                                          )
                                        : Icon(
                                            Icons.notifications_none_rounded,
                                            color: widget.title == "Inicio"
                                                ? Colors.white
                                                : colorStyle.secondaryColor,
                                            size: 30,
                                          ),
                                  ),
                                ],
                              )
                            : SizedBox(),
                      ],
                    ),
                  ],
                ),
              ),
            )),
        (connected == false)
            ? SizedBox(
                height: 30,
                child: FadeAnimation(
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Colors.grey),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "No estás conectado a internet.",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )),
                ),
              )
            : Container(),
        (widget.tabBar != null)
            ? Container(
                child: widget.tabBar!,
                decoration: BoxDecoration(
                  color: Colors.white,
                ))
            : SizedBox(),
        (widget.container != null)
            ? Container(
                child: widget.container!,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 15))
                ]))
            : SizedBox()
      ],
    );
  }

  Future<void> getConnectivity() async {
    final connectivityStatus = await connectivity.checkConnectivity();

    if (connectivityStatus == ConnectivityResult.none) {
      setState(() {
        connected = false;
      });
    } else {
      setState(() {
        connected = true;
      });
    }
  }
}

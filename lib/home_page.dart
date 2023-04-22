import 'package:flutter/material.dart';
import 'package:my_project/post_add/add_post.dart';
import 'all_screens/Dash_board/Dash_board.dart';
import 'all_screens/Materiles_page/Materile.dart';
import 'all_screens/cunstruction_tools/construction_tools.dart';
import 'all_screens/customer_support/customer support.dart';
import 'all_screens/feed_back/feed_back.dart';
import 'all_screens/private_builder_contractors/contractors.dart';
import 'all_screens/properties/properties.dart';
import 'all_screens/terms_condition/term_and_condition.dart';
import 'drawer/My_header_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.DashBoard;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.DashBoard) {
      container = DashBoard();
    } else if (currentPage == DrawerSections.Materiles) {
      container = Materiles();
    } else if (currentPage == DrawerSections.Properties) {
      container = Properties();
    } else if (currentPage == DrawerSections.CunstructionTools) {
      container = CunstructionTools();
    } else if (currentPage == DrawerSections.Contractors) {
      container = Contractors();
    } else if (currentPage == DrawerSections.FeedBack) {
      container = FeedBack();
    } else if (currentPage == DrawerSections.CustomerSupport) {
      container = CustomerSupport();
    } else if (currentPage == DrawerSections.AddPost) {
      container = AddPost();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Wellcome"),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                HeaderDrawer(),
                myDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget myDrawerList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(9, "AddPost", Icons.post_add_sharp,
              currentPage == DrawerSections.AddPost ? true : false),
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSections.DashBoard ? true : false),
          menuItem(2, "Materiles", Icons.real_estate_agent_outlined,
              currentPage == DrawerSections.Materiles ? true : false),
          menuItem(3, "Properties", Icons.cabin_rounded,
              currentPage == DrawerSections.Properties ? true : false),
          menuItem(4, "Cunstruction Tools", Icons.build,
              currentPage == DrawerSections.CunstructionTools ? true : false),
          menuItem(5, "Contractors", Icons.home_filled,
              currentPage == DrawerSections.Contractors ? true : false),
          Divider(),
          menuItem(6, "FeedBack", Icons.feed_outlined,
              currentPage == DrawerSections.FeedBack ? true : false),
          menuItem(8, "CustomerSupport", Icons.support_agent_outlined,
              currentPage == DrawerSections.CustomerSupport ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.DashBoard;
            } else if (id == 2) {
              currentPage = DrawerSections.Materiles;
            } else if (id == 3) {
              currentPage = DrawerSections.Properties;
            } else if (id == 4) {
              currentPage = DrawerSections.CunstructionTools;
            } else if (id == 5) {
              currentPage = DrawerSections.Contractors;
            } else if (id == 6) {
              currentPage = DrawerSections.FeedBack;
            } else if (id == 8) {
              currentPage = DrawerSections.CustomerSupport;
            } else if (id == 9) {
              currentPage = DrawerSections.AddPost;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  AddPost,
  DashBoard,
  Materiles,
  Properties,
  CunstructionTools,
  Contractors,
  FeedBack,
  TermsAndCondition,
  CustomerSupport,
}

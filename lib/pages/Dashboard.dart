import 'package:come_along_with_me/pages/Profile_page.dart';
import 'package:come_along_with_me/pages/contacts_page.dart';
import 'package:come_along_with_me/pages/group_page.dart';
import 'package:come_along_with_me/widgets/custom_input.dart';
import 'package:come_along_with_me/widgets/tool_bar_widget.dart';
import 'package:flutter/material.dart';



class DashboardPage extends StatefulWidget {
  final String uid;

  const DashboardPage({super.key, required this.uid});
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  TextEditingController _searchcontroller = TextEditingController();
  PageController _pageViewController = PageController(initialPage: 0);
  bool _isSearching = false;
  int _toolBarPageIndex = 0;



  List<String>_popupMenuList = ['Log Out'];

  List<Widget> get pages => [ContactsPage(), GroupPage(), ProfilePage()];

  @override
  void dispose() {
    super.dispose();
    _searchcontroller.dispose();
    _pageViewController.dispose();
  }

  Widget _buildSearchWidget(){
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      padding: EdgeInsets.only(left: 10, right: 10),
      height: 50,

      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.3),
            blurRadius: 2,
            spreadRadius: 1,
            offset: Offset(0,0.50)
          )
        ]
          
      ),
    
      child: CustomInput(
        icon: Icons.arrow_back, 
        placeholder: "Search...", 
        textController: _searchcontroller, 
        keyboardType: TextInputType.text,
        borderRadius: 0,
         iconClickEvent: (){
          setState(() {
            _isSearching = !_isSearching;
          });
        },
        )
        );
  }


Widget _emptycontainer(){
  return SizedBox(height: 0, width: 0, );
}
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
     height: 1500,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: _isSearching==true? Colors.white: Colors.blue,
          title: _isSearching==true?Container(child: _emptycontainer()): Text('CAWM'),
          flexibleSpace: _isSearching==true?_buildSearchWidget():_emptycontainer(),
          actions: _isSearching == true?[]: [
            InkWell(onTap: (){
              setState(() {
                _isSearching = !_isSearching;
              });
            },
              child:(Icon(Icons.search))),
                PopupMenuButton(itemBuilder: (_) => _popupMenuList.map((menuItem) { return PopupMenuItem(child: Text("$menuItem"));}).toList()),
          ],
        ),
    
    
    
    
        body: Column(
          children:[CustomToolBarWidget(
          pageIndex: _toolBarPageIndex,
          toolbarIndexController: (int index) {print("algo");
          setState(() {
           _toolBarPageIndex = index; 
          });
          _pageViewController.jumpToPage(index);
          } ,
        ),
          Expanded(
            child: PageView.builder( controller: _pageViewController,onPageChanged: (index){
              
              setState(() {
                _toolBarPageIndex = index;
              });
    
            }, itemCount: pages.length, itemBuilder: (context, index){
              return pages[index];
            }),
          )
        ],
        ),
      ),
    );
  }
}
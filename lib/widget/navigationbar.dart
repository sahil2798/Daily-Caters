import 'package:daily_caters/data/user.dart';
import 'package:daily_caters/models/navigationbar.dart';
import 'package:daily_caters/provider/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationDrawerWidget extends StatelessWidget {
  static final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) => Drawer(
        child: Container(
          color: Color(0xff076800),
          child: ListView(
            children: <Widget>[
              buildHeader(
                context,
                urlImage: urlImage,
                name: name,
                email: email,
              ),
              Container(
                padding: padding,
                child: Column(
                  children: [
              //       const SizedBox(height: 24),
                    buildMenuItem(
                      context,
                      item: NavigationItem.Home,
                      text: 'Home',
                      icon: Icons.home_max_outlined,
                    ),
              //       const SizedBox(height: 16),
              //       buildMenuItem(
              //         context,
              //         item: NavigationItem.Posts,
              //         text: 'Posts',
              //         icon: Icons.food_bank_outlined,
              //       ),
              //       const SizedBox(height: 16),
              //       buildMenuItem(
              //         context,
              //         item: NavigationItem.Watchlist,
              //         text: 'Watchlists',
              //         icon: Icons.favorite_border
              //       ),
              //       const SizedBox(height: 16),
              //       buildMenuItem(
              //         context,
              //         item: NavigationItem.Messages,
              //         text: 'Messages',
              //         icon: Icons.message_outlined
              //       ),
                    
              //       const SizedBox(height: 24),
              //       Divider(color: Colors.white70),
              //       const SizedBox(height: 24),
              //       buildMenuItem(
              //         context,
              //         item: NavigationItem.Logout,
              //         text: 'Logout',
              //         icon: Icons.logout_outlined,
              //       ),
              //       const SizedBox(height: 16),
              //       buildMenuItem(
              //         context,
              //         item: NavigationItem.Delete,
              //         text: 'Delete Account',
              //         icon: Icons.delete_forever_outlined
              //       ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildMenuItem(
    BuildContext context, {
    required NavigationItem item,
    required String text,
    required IconData icon,
  }) {
    final provider = Provider.of<NavigationProvider>(context);
    final currentItem = provider.navigationItem;
    final isSelected = item == currentItem;

    final color = isSelected ? Colors.orangeAccent : Colors.white;

    return Material(
      color: Colors.transparent,
      child: ListTile(
        selected: isSelected,
        selectedTileColor: Colors.white24,
        leading: Icon(icon, color: color),
        title: Text(text, style: TextStyle(color: color, fontSize: 16)),
        onTap: () => selectItem(context, item),
      ),
    );
  }

  void selectItem(BuildContext context, NavigationItem item) {
    final provider = Provider.of<NavigationProvider>(context, listen: false);
    provider.setNavigationItem(item);
  }

  Widget buildHeader(
  
    BuildContext context, {
    required String urlImage,
    required String name,
    required String email,
  }) =>
      Material(
        
        color: Colors.transparent,
        child: InkWell(
          onTap: () => selectItem(context, NavigationItem.header),
          child: Container(
            padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
            child: Row(
              children: [
                CircleAvatar(
                    radius: 30, backgroundImage: NetworkImage(urlImage)),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      email,
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
                Spacer(),
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Color.fromRGBO(30, 60, 168, 1),
                  child: Icon(Icons.add_comment_outlined, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      );
}

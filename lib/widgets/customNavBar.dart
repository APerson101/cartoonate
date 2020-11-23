// // part of persistent_bottom_nav_bar;

// class BottomNavStyle9 extends StatelessWidget {
//   final int selectedIndex;
//   final int previousIndex;
//   final double iconSize;
//   final Color backgroundColor;
//   final bool showElevation;
//   final List<PersistentBottomNavBarItem> items;
//   final ValueChanged<int> onItemSelected;
//   final double navBarHeight;
//   final NavBarPadding padding;
//   final Function(int) popAllScreensForTheSelectedTab;
//   final bool popScreensOnTapOfSelectedTab;
//   final ItemAnimationProperties itemAnimationProperties;

//   BottomNavStyle9({
//     Key key,
//     this.selectedIndex,
//     this.previousIndex,
//     this.showElevation = false,
//     this.iconSize,
//     this.backgroundColor,
//     this.itemAnimationProperties,
//     this.navBarHeight = 0.0,
//     @required this.items,
//     this.popAllScreensForTheSelectedTab,
//     this.onItemSelected,
//     this.popScreensOnTapOfSelectedTab,
//     this.padding,
//   });

//   Widget _itemSelected(PersistentBottomNavBarItem item, bool isSelected) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.only(right: 8),
//           child: IconTheme(
//             data: IconThemeData(
//                 size: iconSize,
//                 color: item.activeContentColor == null
//                     ? item.activeColor
//                     : item.activeContentColor),
//             child: item.icon,
//           ),
//         ),
//         item.title == null
//             ? SizedBox.shrink()
//             : Flexible(
//                 child: Material(
//                   type: MaterialType.transparency,
//                   child: FittedBox(
//                     child: Text(
//                       item.title,
//                       style: item.titleStyle != null
//                           ? (item.titleStyle.apply(
//                               color: isSelected
//                                   ? (item.activeContentColor == null
//                                       ? item.activeColor
//                                       : item.activeContentColor)
//                                   : item.inactiveColor))
//                           : TextStyle(
//                               color: (item.activeContentColor == null
//                                   ? item.activeColor
//                                   : item.activeContentColor),
//                               fontWeight: FontWeight.w400,
//                               fontSize: item.titleFontSize),
//                     ),
//                   ),
//                 ),
//               )
//       ],
//     );
//   }

//   Widget _notselected(PersistentBottomNavBarItem item, bool isSelected) {
//     return FittedBox(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           FittedBox(
//             child: IconTheme(
//               data: IconThemeData(
//                   // size: 24,
//                   color: item.inactiveColor == null
//                       ? item.activeColor
//                       : item.inactiveColor),
//               child: item.icon,
//             ),
//           ),
//           item.title == null
//               ? SizedBox.shrink()
//               // : Padding(
//               //     padding: const EdgeInsets.only(top: 15.0),
//               //     child
//               : Material(
//                   type: MaterialType.transparency,
//                   child: FittedBox(
//                     child: Text(
//                       item.title,
//                       style: item.titleStyle != null
//                           ? (item.titleStyle.apply(color: item.inactiveColor))
//                           : TextStyle(
//                               color: item.inactiveColor,
//                               fontWeight: FontWeight.w400,
//                               fontSize: item.titleFontSize),
//                     ),
//                   ),
//                 ),
//           // ),
//         ],
//       ),
//     );
//   }

//   Widget _buildItem(
//       PersistentBottomNavBarItem item, bool isSelected, double height) {
//     return this.navBarHeight == 0
//         ? SizedBox.shrink()
//         : AnimatedContainer(
//             width: isSelected ? 120 : 50,
//             height: height, // / 1.5,
//             duration: itemAnimationProperties?.duration ??
//                 Duration(milliseconds: 400),
//             curve: itemAnimationProperties?.curve ?? Curves.ease,
//             padding: EdgeInsets.all(item.contentPadding),
//             decoration: BoxDecoration(
//               color: isSelected
//                   ? item.activeColor.withOpacity(1)
//                   : backgroundColor.withOpacity(0.0),
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//             ),
//             child: Container(
//               alignment: Alignment.center,
//               // height: height / 1.6,
//               child: isSelected
//                   ? _itemSelected(item, isSelected)
//                   : _notselected(item, isSelected),
//             ),
//           );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: this.navBarHeight,
//       padding: EdgeInsets.only(
//           top: this.padding?.top ?? this.navBarHeight * 0.15,
//           left: this.padding?.left ?? MediaQuery.of(context).size.width * 0.02,
//           right:
//               this.padding?.right ?? MediaQuery.of(context).size.width * 0.02,
//           bottom: this.padding?.bottom ?? this.navBarHeight * 0.12),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: items.map((item) {
//           var index = items.indexOf(item);
//           return Flexible(
//             flex: selectedIndex == index ? 2 : 1,
//             child: GestureDetector(
//               onTap: () {
//                 if (this.items[index].onPressed != null) {
//                   this.items[index].onPressed();
//                 } else {
//                   this.onItemSelected(index);
//                   if (this.popScreensOnTapOfSelectedTab &&
//                       this.previousIndex == index) {
//                     this.popAllScreensForTheSelectedTab(index);
//                   }
//                 }
//               },
//               child: Container(
//                 color: Colors.transparent,
//                 child:
//                     _buildItem(item, selectedIndex == index, this.navBarHeight),
//               ),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }

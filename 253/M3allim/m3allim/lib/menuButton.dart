// import 'package:flutter/material.dart';
// import './displayCards.dart';
// import './ServiceProvider.dart';


// class menubutton extends StatefulWidget {
//   List<ServiceProvider> lst;
//   List<ServiceProvider> fav;
//   menubutton(this.lst, this.fav);
//   @override
//   State<StatefulWidget> createState() {
//     return MenuButton(this.lst, this.fav);
//   }
// }
// class MenuButton extends State<menubutton>{
//   List<ServiceProvider> lst;
//   List<ServiceProvider> fav;
//   List<String> _filters = ["المدينة","المسافة","التقييم"];
//   bool val2 = false;
//   MenuButton(this.lst, this.fav);
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//         return
//           Container(
//             width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height/8,
//               child : Row(children: <Widget>[

//                 Padding(
//                     padding: EdgeInsets.only(left:  MediaQuery.of(context).size.width/15, right: MediaQuery.of(context).size.width/2),
//                     child :Container( child  : Switch(value: this.val2, onChanged: (bool _value){
//                       setState(() {
//                         if(this.val2 = true){
//                           this.val2 = _value;
//                           //ServiceDisplay(this.lst, this.u);
//                         }
//                         else{
//                           this.val2 = _value;
//                           print("dont show favorits" + val2.toString());

//                         }
//                       });
//                     }),)
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left:  0),
//                   child :  Container(
//                     margin: EdgeInsets.only(bottom: 20, top: 15),
//                     child: DropdownButton<String>(
//                         hint: Text(' تصنيف'),
//                         items: _filters.map((filter){
//                           return DropdownMenuItem(
//                             value: filter,
//                             child: Text(filter),
//                           );
//                         }).toList(),
//                         onChanged: (v) {
//                           setState(() {
//                             if (v == "التقييم"){
//                               print("رتب حسب التقييم");

//                             } else if( v == "المحفظة"){
//                               print("رتب حسب المحافظة");
//                             } else {
//                               print("رتب حسب البلدة");
//                             }
//                           }
//                           );
//                         }
//                     ),
//                   ),
//                 ),
//               ],)
//           );
// //          Align(
// //      alignment: Alignment(0.85, -0.9),
// //      child :  Container(
// //        margin: EdgeInsets.only(bottom: 20, top: 15),
// //        child: DropdownButton<String>(
// //            hint: Text('إظهار حسب'),
// //            items: _filters.map((filter){
// //              return DropdownMenuItem(
// //                value: filter,
// //                child: Text(filter),
// //              );
// //            }).toList(),
// //            onChanged: (v) {
// //              setState(() {
// //                if (v == "التقييم"){
// //                  print("رتب حسب التقييم");
// //
// //                } else if( v == "المحفظة"){
// //                  print("رتب حسب المحافظة");
// //                } else {
// //                  print("رتب حسب البلدة");
// //                }
// //              }
// //              );
// //            }
// //        ),
// //      ),
// //    );
//   }
//   }





import 'package:flutter/material.dart';
import './displayCards.dart';
import './ServiceProvider.dart';
import './User.dart';
import './crud.dart';


class menubutton extends StatefulWidget {
  List<ServiceProvider> lst;
  User u;
  String category;
  String subCategory;
  menubutton(this.lst, this.u, this.category, this.subCategory);
  @override
  State<StatefulWidget> createState() {
    return MenuButton(this.lst,  this.u,this.category, this.subCategory);
  }
}
class MenuButton extends State<menubutton>{
  List<ServiceProvider> lst;
  User u;
  String category;
  String subCategory;
  List<String> _filters = ["المسافة","التقييم"];
  bool val2 = false;
  MenuButton(this.lst, this.u,this.category, this.subCategory);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
        return
          Container(
            width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/8,
              child : Row(children: <Widget>[

                Padding(
                  padding: EdgeInsets.only(left:  0),
                  child :  Container(
                    margin: EdgeInsets.only(bottom: 20, top: 15),
                    child: DropdownButton<String>(
                        hint: Text(' تصنيف'),
                        items: _filters.map((filter){
                          return DropdownMenuItem(
                            value: filter,
                            child: Text(filter),
                          );
                        }).toList(),
                        onChanged: (v) {
                          setState(() {
                            if (v == "التقييم") {
                              List<ServiceProvider> newlst = fb
                                  .getnServiceProviders(
                                  this.category, this.subCategory, 5,
                                  "rating", true, this.u);
                              ServiceDisplay(newlst, this.u);
                            }else {
                              List<ServiceProvider> newlst = fb
                                  .getnServiceProviders(
                                  this.category, this.subCategory, 5,
                                  "distance", true, this.u);
                              ServiceDisplay(newlst, this.u);

                            }
                          }
                          );
                        }
                    ),
                  ),
                ),
              ],)
          );
//          Align(
//      alignment: Alignment(0.85, -0.9),
//      child :  Container(
//        margin: EdgeInsets.only(bottom: 20, top: 15),
//        child: DropdownButton<String>(
//            hint: Text('إظهار حسب'),
//            items: _filters.map((filter){
//              return DropdownMenuItem(
//                value: filter,
//                child: Text(filter),
//              );
//            }).toList(),
//            onChanged: (v) {
//              setState(() {
//                if (v == "التقييم"){
//                  print("رتب حسب التقييم");
//
//                } else if( v == "المحفظة"){
//                  print("رتب حسب المحافظة");
//                } else {
//                  print("رتب حسب البلدة");
//                }
//              }
//              );
//            }
//        ),
//      ),
//    );
  }
  }


import 'package:fluttertoast/fluttertoast.dart';

class utitles {
  void Toasmessg(String msg){
    Fluttertoast.showToast(msg:msg, 
    toastLength: Toast.LENGTH_SHORT,
gravity: ToastGravity.BOTTOM,

    );
  }
}
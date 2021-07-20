import 'package:clb_sach/screens/home/home.dart';
import 'package:clb_sach/screens/login/login.dart';
import 'package:clb_sach/states/currentuser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OurRoot extends StatefulWidget {
  @override
  _OurRootState createState() => _OurRootState();
}
enum AuthStatus{
  LoggedIn,
  NotLoggedIn,
}
class _OurRootState extends State<OurRoot> {
  AuthStatus _authStatus = AuthStatus.NotLoggedIn;


@override
  void didChangeDependencies() async{
    // TODO: implement didChangeDependencies
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    if(await _currentUser.isLoggedIn()) {
      setState(() {
        _authStatus = AuthStatus.LoggedIn;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    late Widget _returnVal;
    switch(_authStatus) {
      case AuthStatus.LoggedIn:
        _returnVal = HomeScreen();
        break;
      case AuthStatus.NotLoggedIn:
        _returnVal = OurLogin();
        break;
      default:
    }
    return _returnVal;
  }
}

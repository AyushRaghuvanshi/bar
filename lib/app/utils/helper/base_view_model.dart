import 'package:flutter/material.dart';

///[BaseViewModel] is Super Class for all ViewModels. 
///
///It provides [isLoading] getter and [setLoading] setter.
class BaseViewModel extends ChangeNotifier{
  bool _isdisposed = false;
  bool _isLoading = false;

  get isLoading => _isLoading;

  ///overidding [notifyListeners] so that it doesnt get called if the class has been disposed. 
  @override
  void notifyListeners() {
    if(!_isdisposed){
      super.notifyListeners();
    }
  }

  ///Setter to change LoadingState
  setLoading(bool val){
    _isLoading=val;
    notifyListeners();
  }


  @override
  void dispose() {
    _isdisposed=true;
    super.dispose();
  }


}
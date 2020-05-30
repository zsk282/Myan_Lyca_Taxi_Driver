/**
 * Repository: get X 
 *  if in db get from there
 *  if not in db get from api call
 */
  
import 'dart:async';
import 'dart:io';
import '../models/UserModel.dart';
import 'UserDbProvider.dart';
// import '../services/AuthApiService.dart';
import '../services/UserApiService.dart';

class UserRepository{
  UserDbProvider _dbProvider = UserDbProvider();
  // AuthApiService _authApiService = AuthApiService();
  UserApiService _userApiService = UserApiService();

  fetchUserFromDB() async {
    // check for data in DB
    var user = await _dbProvider.fetchUser();
    if(user != null){
      return user;
    }
    return null;
  }
  
  updateUser(accessToken,data) async {
    // update user in both database and call on API server
    var user = await _userApiService.updateUserByAccessToken(accessToken,data);
    // if data returnd by API then save that as it is that is new updated data for same User
    // AUTH should be same ***assumption
    if(user != null){
      return _dbProvider.addUser(UserModel.fromJSON(user));
    }else{
      return null;
    }
  }

  loginUser(accessToken) async {
    var user = await _userApiService.getUserByAccessToken(accessToken);
    // if user found save user in db to use in APP
    if(user != null){
      return _dbProvider.addUser(UserModel.fromJSON(user));
    }else{
      return null;
    }
  }

  logoutUser() {
    _dbProvider.logoutUser();
    return null;
  }

  updateUserProfileImage(String accessToken, file) async {
    // update user in both database and call on API server
    var user = await _userApiService.updateImageByAccessToken(accessToken,file);
    // if data returnd by API then save that as it is that is new updated data for same User
    // AUTH should be same ***assumption
    if(user != null){
      return _dbProvider.addUser(UserModel.fromJSON(user));
    }else{
      return null;
    }
  }
}
/*
 * @Author: 一凨 
 * @Date: 2019-01-16 15:19:57 
 * @Last Modified by: 一凨
 * @Last Modified time: 2019-01-16 16:11:54
 */
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

typedef Future CallLogin(String userName, String pwd);

class LoginPage extends StatefulWidget {
  final CallLogin callLogin;

  LoginPage({Key key, this.callLogin}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _userName;
  String _pwd;
  bool isLogin;

 _handlePress(s, context) => () async {
        FormState state = Form.of(s.context);
        if (state.validate()) {
          // 验证通过
          state.save();
          print('login success');
          try {
            await widget.callLogin(_userName, _pwd);

            showDialog(
                context: context,
                builder: (c) {
                  return CupertinoAlertDialog(
                    title: Text('登陆成功'),
                    actions: <Widget>[
                      Center(
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                          child: Text('I Know'),
                        ),
                      )
                    ],
                  );
                });
          } catch (e) {
            showDialog(
              context: context,
              builder: (c) {
                return CupertinoAlertDialog(
                  title: Text('登陆失败'),
                  actions: <Widget>[
                    Center(
                      child: RaisedButton(
                        child: Text('ok'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    )
                  ],
                );
              },
            );
          }
        }
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登陆'),
      ),
      body: Center(
        child: Form(
          onChanged: () {
            print('change');
          },
          onWillPop: () async {
            return true;
          },
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: '请输入用户名'),
                  onSaved: (String name) {
                    _userName = name;
                  },
                  validator: (String name) => name.isEmpty ? "请输入用户名" : null,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: '请输入密码'),
                  onSaved: (String pwd) {
                    _pwd = pwd;
                  },
                  validator: (String name) => name.isEmpty ? "请输入密码" : null,
                ),
                FormField(
                  builder: (FormFieldState fState) {
                    return Center(
                      child: RaisedButton(
                        onPressed: _handlePress(fState, context),
                        child: Text('登陆'),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

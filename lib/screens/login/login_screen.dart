import 'package:flutter/material.dart';
import 'package:heroServiceApp/screens/components/passwordwidget.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // กำหนดตัวแปรสำหรับเก็บอีเมล์และรหัสผ่าน
  String _email, _password;

  // สร้างคีย์สำหรับเก็บสถานะของฟอร์ม
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: GestureDetector(
        onTap: (){
          // ยกเลิกการ focus ช่อง input
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                TextFormField(
                  autofocus: false,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontSize: 20, color: Colors.teal),
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: 'กรอกอีเมล์'
                  ),
                  // maxLength: 5,
                  // initialValue: 'samit@gmail.com',
                  validator: (value){
                    if(value.isEmpty){
                      return 'กรุณากรอกอีเมล์ก่อน';
                    }else{
                      return null;
                    }
                  },
                  onFieldSubmitted: (String value){
                    setState(() {
                      this._email = value;
                    });
                  },
                  onSaved: (value){
                    this._email = value.trim();
                  },
                ),
                PasswordField(
                  helperText: 'ไม่เกิน 6 หลัก',
                  labelText: 'กรอกรหัสผ่าน',
                  validator: (value){
                    if(value.isEmpty){
                      return 'กรุณากรอกรหัสผ่านก่อน';
                    }else if(value.length != 6){
                      return 'กรุณาป้อนรหัสผ่านด้วยเลข 6 หลัก';
                    }else{
                      return null;
                    }
                  },
                  onFieldSubmitted: (String value){
                    setState(() {
                      this._password = value;
                    });
                  },
                  onSaved: (value){
                    this._password = value.trim();
                  },
                ),
                SizedBox(height: 20.0,),
                RaisedButton(
                  onPressed: (){
                    if(formKey.currentState.validate()){
                      formKey.currentState.save();
                      print(_email + _password);
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('เข้าสู่ระบบ', style: TextStyle(fontSize: 20.0, color: Colors.white),),
                  ),
                  color: Colors.green,
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}
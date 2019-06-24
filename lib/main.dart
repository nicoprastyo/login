import 'package:flutter/material.dart';

void main() => (runApp(MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: formLogin(),
      ),
    );
  }
}

class formLogin extends StatefulWidget {
  @override
  _formLoginState createState() => _formLoginState();
}

class _formLoginState extends State<formLogin> {
  final _formkey = GlobalKey<FormState>();
  bool _validasi = false;
  String username;
  String password;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formkey, //key global
          autovalidate: _validasi, //wajib di isi
          child: formUI(),
        ),
      ),
    );
  }

  Widget formUI() {
    return Column(
      children: <Widget>[
        //icon
        Padding(
          padding: const EdgeInsets.only(top:100.0),
          child: Image.asset(
            'images/logoppm.jpg',
            height: 70.0,
          ),
        ),
        //learning management system
        Padding(
          padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
          child: Center(
            child: Text("Learning Management System",
            style: TextStyle(fontSize: 20.0, color: Colors.indigo, fontWeight: FontWeight.w300 ),
            ),
          ),
        ),
        //ppm online learning
          Padding(
            padding: const EdgeInsets.only(bottom:20.0),
            child: Center(
              child: Text("PPM Online Learning",
              style: TextStyle(fontSize: 22.0, color: Colors.indigo, fontWeight: FontWeight.w600 ),
              ),
            ),
          ),
        //field username
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.all(Radius.circular(10))),                
                hintText: '  isi eMail Anda',
                helperText: 'email gunakan yang mudah di ingat',
              labelText: "Email",
              suffixIcon: const Icon(
                Icons.person,
                color:Colors.white,
              ),
              ),
            keyboardType: TextInputType.text,
            validator: validateUsername,
            onSaved: (String val){
              username=val;
            },
          ),
        ),        
        //field password
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.all(Radius.circular(10))),
                hintText: '  isi Kata Sandi Anda',
                helperText: 'Kata Sandi tidak boleh terlalu mudah',
              labelText: "Kata Sandi",
              suffixIcon: const Icon(
                Icons.lock,
                color:Colors.white,
              ),
              ),
            obscureText: true, //password privasi
            validator: validatePassword,
            onSaved: (String val){
              password=val;
            },
          ),
        ),
        //submit login to your app
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            height: 60.0,
            child: RaisedButton(
              color: Colors.blue,
              child: Text('Masuk',style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.white),),
              onPressed: validateInputan,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Buat akun', style: TextStyle(color: Colors.blue, fontSize: 16.0, fontWeight: FontWeight.w500),),
              Text('Lupa kata sandi?', style: TextStyle(color: Colors.black54, fontSize: 16.0, fontWeight: FontWeight.w500),)
            ],
          ),
        ),
        //or login with
                  Padding(
                    padding: const EdgeInsets.only(top:40.0),
                    child: Center(
            child: Text("- Atau gunakan akun Anda -",
            style: TextStyle(fontSize: 15.0, color: Colors.blue, fontWeight: FontWeight.w600 ),
            ),
          ),
          ),
        //baris
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,  
              children: <Widget>[
            //facebook
              SizedBox(
              height: 60.0,
              width: 170.0,
              child: RaisedButton(
                color: Colors.blueAccent,
                child: Text('FACEBOOK',style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.white),),
                onPressed: validateInputan,
              ),
            ),
            //twiter
              SizedBox(
              height: 60.0,
              width: 170.0,
              child: RaisedButton(
                color: Colors.lightBlueAccent,
                child: Text('TWITTER',style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.white),),
                onPressed: validateInputan,
              ),
            ),
            ],),
          ),         
      ],
    );
  }
  void validateInputan(){
    if(_formkey.currentState.validate()){
      _formkey.currentState.save();
      Scaffold.of(context)
      .showSnackBar(SnackBar(content: Center(child: Text('Terima Kasih, Anda dapat lanjutkan ke aplikasi')),));
      // Fluttertoast.showToast(
      //   msg: "Data Berhasil di Input",
      //   toastLength: Toast.LENGTH_SHORT,
      //   gravity: ToastGravity.CENTER,
      //   timeInSecForIos: 1,
      //   backgroundColor: Colors.red,
      //   textColor: Colors.white,
      //   fontSize: 16.0
    // );
    }else{
      setState(() {
        _validasi=true;
      });
    }
  }


  String validateUsername(String value){
    if (value.length < 5){
      return 'Nama min 5 Karakter';
      }else{
        return null;     
    }
  }

  String validatePassword(String value){
    if (value.length <= 12){
      return 'No HP min 12 Karakter';
      }else{
        return null;
    }  
  }  
}

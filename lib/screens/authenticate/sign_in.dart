import 'package:companion_app/services/auth.dart';
import 'package:companion_app/shared/constants.dart';
import 'package:companion_app/shared/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({required this.toggleView});


  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formkey=GlobalKey<FormState>();
  final AuthService _auth=AuthService();
  bool loading=false;
  //text field state
  String email='';
  String password='';
  String error='';

  @override
  Widget build(BuildContext context) {
    return loading? Loading():Scaffold(
      backgroundColor: Color(0xFFa27cfc),
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
        title: Text(' Sign In to MindEase',
          style: TextStyle(
            fontFamily: 'FontMainHeavy',
          ),
        ),
        actions: [
          TextButton.icon(
              onPressed: (){
                widget.toggleView();
              },
              icon:Icon(CupertinoIcons.person_fill),
              label: Text('Sign Up  ')
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 0,horizontal: 50),
        child:Form(
          key: _formkey,
          child: Column(
            children: [
              //SizedBox(height: 20),
              SizedBox(height:0),
              Container(
                width: 135,
                height: 135,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage('https://www.iconshock.com/3D/general/png/thumbnails/love-passion-affection-fondness-attachment.webp'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Welcome to\n  MindEase.',
                  style: TextStyle(
                    fontFamily: 'FontMainHeavy',
                    fontSize: 21,
                  ),
                ),
              ),
              SizedBox(height:20),
              TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  validator: (val)=>val?.isEmpty?? true? 'Enter an email':null,
                  onChanged: (val){setState(()=>email=val);
                }
              ),
              SizedBox(height: 20),
              TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Password'),
                  validator: (val) => (val?.length ?? 0) < 6 ? 'Password length greater than 6 is mandatory' : null,
                  obscureText: true,
                  onChanged: (val){setState(()=>password=val);
                }
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: ()async {
                    if(_formkey.currentState?.validate()??false){
                      setState(()=>loading=true);
                      dynamic res=await _auth.signInwithEandP(email, password);
                      if(res==null){
                        setState((){
                          loading=false;
                          error='invalid credentials';
                        });
                      }
                    }
                  },
                  child: Text(
                    'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                  )
              ),
              SizedBox(height: 20),
              Text(
                error,
                style: TextStyle(color: Colors.red,fontSize: 14),
              ),
            ],
          ),
        )
      ),
    );
  }
}

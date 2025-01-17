import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context).bloc;

    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          emailField(bloc),
          passwordField(bloc),
          Container(margin: EdgeInsets.only(top: 8),),
          submitButton(bloc),
        ],
      ),
    );
  }

  emailField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'you@example.com',
              labelText: 'Email',
              errorText: snapshot.hasError ? snapshot.error.toString() : null,
            ),
          );
        }
    );
  }

  passwordField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changePassword,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              errorText: snapshot.hasError ? snapshot.error.toString() : null,
            ),
          );
        }
    );

  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.submitValid,
        builder: (context, snapshot) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.purple,
              shadowColor: Colors.black,
            ),
            onPressed: !snapshot.hasData ? null : bloc.submit,
            child: Text('Submit'),
          );
        }
    );

  }

}
import 'package:flutter/material.dart';
import 'email-notification.dart';

class PrayerRequest extends StatefulWidget {
  @override
  _PrayerRequestState createState() => _PrayerRequestState();
}

class _PrayerRequestState extends State {
  final _formKey = GlobalKey<FormState>();
  final emailNotification = EmailNotification();
  final _nameEditingController = TextEditingController();
  final _phoneEditingController = TextEditingController();
  final _emailEditingController = TextEditingController();
  final _prayerRequestEditingController = TextEditingController();

  String _name = '';
  String _phone = '';
  String _email = '';
  String _prayerRequestMsg = '';

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    _clearFormFields() {
      _nameEditingController.clear();
      _phoneEditingController.clear();
      _emailEditingController.clear();
      _prayerRequestEditingController.clear();

      this.setState(() => _name = '');
      this.setState(() => _phone = '');
      this.setState(() => _email = '');
      this.setState(() => _prayerRequestMsg = '');
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Prayer Request"),
        ),
        body: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Builder(
                builder: (context) => Form(
                      key: _formKey,
                      child: new ListView(
                        children: <Widget>[
                          new TextFormField(
                              keyboardType: TextInputType
                                  .text, // Use email input type for emails.
                              decoration: new InputDecoration(
                                  hintText: 'Enter your name',
                                  labelText: 'Name'),
                              controller: _nameEditingController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                              onChanged: (val) => setState(() => _name = val)),
                          new TextFormField(
                              keyboardType: TextInputType
                                  .phone, // Use secure text for passwords.
                              decoration: new InputDecoration(
                                  hintText: 'Enter your phone number',
                                  labelText: 'Phone Number'),
                              controller: _phoneEditingController,
                              onChanged: (val) => setState(() => _phone = val)),
                          new TextFormField(
                              keyboardType: TextInputType
                                  .emailAddress, // Use secure text for passwords.
                              decoration: new InputDecoration(
                                  hintText: 'Enter your Email Address',
                                  labelText: 'Email'),
                              controller: _emailEditingController,
                              onChanged: (val) => setState(() => _email = val)),
                          new TextFormField(
                              keyboardType: TextInputType.multiline,
                              minLines: 9,
                              maxLines: 12, // Use secure text for passwords.
                              decoration: new InputDecoration(
                                  hintText: 'Enter your prayer request',
                                  labelText: 'Prayer Request'),
                              controller: _prayerRequestEditingController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your prayer request';
                                }
                                return null;
                              },
                              onChanged: (val) =>
                                  setState(() => _prayerRequestMsg = val)),
                          new Container(
                            width: screenSize.width,
                            child: new RaisedButton(
                              child: new Text(
                                'Submit',
                                style: new TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                if (!_formKey.currentState.validate()) {
                                  return;
                                }
                                String bodyTemplate =
                                    '''<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
                    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
                        <body>
                          <h4>Name:{{NAME}}</h4>
                          <h4>Phone:{{PHONE}}</h4>
                          <h4>Email:{{EMAIL}}</h4>
                          <h4>Prayer Request:</h4>
                          <p>{{PRAYER_REQUEST}}</p>
                        </body>
                        </html>''';
                                String body = bodyTemplate
                                    .replaceAll('{{NAME}}', _name)
                                    .replaceAll('{{PHONE}}', _phone)
                                    .replaceAll('{{EMAIL}}', _email)
                                    .replaceAll('{{PRAYER_REQUEST}}',
                                        _prayerRequestMsg);
                                emailNotification.sendEmail(_name, body);
                                Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text('Sent Successfully!')));
                                _clearFormFields();
                              },
                              color: Colors.blue,
                            ),
                            margin: new EdgeInsets.only(top: 20.0),
                          )
                        ],
                      ),
                    ))));
  }
}

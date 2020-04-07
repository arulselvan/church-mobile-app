import 'dart:async';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class EmailNotification {
  final smtpServer = gmail('arulselvanj@gmail.com', 'tbdpniknqtnjxxdp');
  // Creating the Gmail server
  // Create our email message.

  Future<void> sendEmail(subject, body) async {
    try {
      final message = Message()
        ..from = Address('arulselvanj@gmail.com')
        ..recipients.add('arul@wizclue.com') //recipent email
        ..ccRecipients.addAll([
          'arulselvanj@hotmail.com'
        ]) //cc Recipents emails//bcc Recipents emails
        ..subject =
            'LLM Mobile App - Prayer Request :: ${DateTime.now()}' //subject of the email
        ..html = body;

      final sendReport = await send(message, smtpServer);

      print('Message sent: ' +
          sendReport.toString()); //print if the email is sent
    } on MailerException catch (e) {
      print('Message not sent. \n' +
          e.toString()); //print if the email is not sent
      // e.toString() will show why the email is not sending
    } //
  }
}

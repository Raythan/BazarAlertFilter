import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

enviarEmail(
    String nome, String email, String sugestao, BuildContext _context) async {
  String _username = 'usuariofantasmausogeral@gmail.com';
  String _password = 'Ray1234.';
  nome = nome.isEmpty ? "Nome não infomado." : nome;
  email = email.isEmpty ? "Email não infomado." : email;

  final smtpServer = gmail(_username, _password);
  final message = Message()
    ..from = Address(_username, 'App Divulgacao')
    ..recipients.add('raythan100@yahoo.com.br')
    // ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
    // ..bccRecipients.add(Address('bccAddress@example.com'))
    //..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
    ..subject = 'Email report App ${DateTime.now()}'
    ..text = 'This is the plain text.\nThis is line 2 of the text part.'
    // ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";
    ..html = "<h2>$nome</h2>\n<h2>$email</h2>\n<p>$sugestao</p>";

  try {
    final sendReport = await send(message, smtpServer);
    // print('Message sent: ' + sendReport.toString());
    Scaffold.of(_context).showSnackBar(SnackBar(
        content:
            Text('Seu envio está sendo processado.\r\nObrigado pelo apoio.')));
  } on MailerException catch (e) {
    Scaffold.of(_context).showSnackBar(SnackBar(
        content: Text(
            'Sua requisição não foi processada no momento.\r\nTente novamente mais tarde.\r\n\r\nObrigado pelo apoio.')));
    // print('Message not sent.');
    // for (var p in e.problems) {
    //   print('Problem: ${p.code}: ${p.msg}');
    // }
  }
}

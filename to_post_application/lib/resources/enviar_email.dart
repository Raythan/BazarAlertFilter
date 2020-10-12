import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

enviarEmail(TextEditingController nome, TextEditingController email, TextEditingController sugestao, BuildContext _context) async {
  String _username = 'usuariofantasmausogeral@gmail.com';
  String _password = 'Ray1234.';
  String nomeParam = nome.text.isEmpty ? "Nome não infomado." : nome.text;
  String emailParam = email.text.isEmpty ? "Email não infomado." : email.text;
  String sugestaoParam = sugestao.text;

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
    ..html = "<h2>$nomeParam</h2>\n<h2>$emailParam</h2>\n<p>$sugestaoParam</p>";

  nome.text = '';
  email.text = '';
  sugestao.text = '';

  try {
    final sendReport = await send(message, smtpServer);
    // print('Message sent: ' + sendReport.toString());
    Scaffold.of(_context).showSnackBar(SnackBar(content: Text('Seu envio foi processado.\r\n\r\nObrigado pelo apoio.')));
  } on MailerException catch (e) {
    Scaffold.of(_context).showSnackBar(SnackBar(
        content: Text('Sua requisição não foi processada no momento.\r\nTente novamente mais tarde.\r\n\r\nObrigado pelo apoio.')));
    // print('Message not sent.');
    // for (var p in e.problems) {
    //   print('Problem: ${p.code}: ${p.msg}');
    // }
  } on Exception catch (e) {
    Scaffold.of(_context).showSnackBar(SnackBar(
        content:
            Text('Sua requisição não foi processada no momento.\r\nTente novamente mais tarde.\r\n\r\nMesmo assim, obrigado pelo apoio.')));
  }
}

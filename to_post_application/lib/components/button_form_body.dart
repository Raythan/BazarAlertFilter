import 'package:flutter/material.dart';
import 'package:to_post_application/resources/enviar_email.dart';

Padding retornaButtonFormBody(
    GlobalKey<FormState> _formKey,
    TextEditingController nomeController,
    TextEditingController emailController,
    TextEditingController sugestaoController,
    BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: RaisedButton(
      onPressed: () {
        if (_formKey.currentState.validate()) {
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text('Seu envio está sendo processado.')));
          enviarEmail(
              nomeController, emailController, sugestaoController, context);
        }
      },
      child: Text('Enviar!'),
    ),
  );
}

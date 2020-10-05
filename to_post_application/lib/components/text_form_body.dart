import 'package:flutter/material.dart';

const double edgeInsetAll = 3.0;
const double borderRadiusCircular = 15.0;
const String labelNomeText = "Informe seu nome.";
const String labelEmailText = "Informe seu email.";
const String labelSugestaoText = "Informe sua sugestão, elogio, crítica.*";
const String txtAlertSugestaoText = "Algum texto deve ser informado.";

Padding retornaTextFormNome(TextEditingController nomeController) {
  return Padding(
    padding: const EdgeInsets.all(edgeInsetAll),
    child: TextFormField(
      controller: nomeController,
      decoration: new InputDecoration(
        labelText: labelNomeText,
        fillColor: Colors.white,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(borderRadiusCircular),
          borderSide: new BorderSide(color: Colors.blueAccent),
        ),
      ),
      keyboardType: TextInputType.text,
    ),
  );
}

Padding retornaTextFormEmail(TextEditingController emailController) {
  return Padding(
    padding: const EdgeInsets.all(edgeInsetAll),
    child: TextFormField(
      controller: emailController,
      decoration: new InputDecoration(
        labelText: labelEmailText,
        fillColor: Colors.white,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(borderRadiusCircular),
          borderSide: new BorderSide(color: Colors.blueAccent),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      // validator: (value) {
      //   if (value.isEmpty) return 'Algum texto deve ser informado.';
      //   return null;
      // },
    ),
  );
}

Padding retornaTextFormSugestao(TextEditingController sugestaoController) {
  return Padding(
    padding: const EdgeInsets.all(edgeInsetAll),
    child: TextFormField(
      controller: sugestaoController,
      decoration: new InputDecoration(
        labelText: labelSugestaoText,
        fillColor: Colors.white,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(borderRadiusCircular),
          borderSide: new BorderSide(),
        ),
      ),
      validator: (value) {
        if (value.isEmpty) return txtAlertSugestaoText;
        return null;
      },
      maxLines: 3,
    ),
  );
}

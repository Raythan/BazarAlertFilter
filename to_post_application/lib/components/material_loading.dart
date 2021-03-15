import 'package:flutter/material.dart';

MaterialApp retornaCarregando() {
  return MaterialApp(
    home: Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Carregando",
                  style: TextStyle(color: Colors.blue[800], fontSize: 30.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
                // Loading(indicator: BallPulseIndicator(), size: 100.0, color: Colors.blue[800]),
              ),
            ],
          ),
        ),
      ),
    ),
    debugShowCheckedModeBanner: false,
  );
}

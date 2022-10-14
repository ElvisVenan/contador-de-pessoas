import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int count = 0;

  void sair() {

    if(count <= 0){

    }else{
      setState(() {
        count--;
      });
    }
  }

  void entrou() {
    if(count >= 20){

    }else{
      setState(() {
        count++;
      });
    }
  }

  bool get isEmpty => count == 0;
  bool get isFull => count ==20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/mercado.jpg'),
            fit: BoxFit.cover,
          ),
        ) ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
             isFull ? 'Lotado' : "Pode Entrar!",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50,),
            Text(
              count.toString(),
              style: TextStyle(
                fontSize: 100,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isEmpty ? null : sair,
                  child: const Text(
                    "Saiu",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: isEmpty ? Colors.white.withOpacity(0.2) : Colors.white,
                    //padding: EdgeInsets.all(32),
                    fixedSize: Size(100, 100),
                    primary: Colors.black,
                    //side: BorderSide(color: Colors.green, width: 5,),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                  ),
                ),
                const SizedBox(width: 32,),
                TextButton(
                  onPressed: entrou,
                  child: const Text(
                    "Entrou",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: isFull ? Colors.red : Colors.white,
                    //padding: EdgeInsets.all(32),
                    fixedSize: Size(100, 100),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


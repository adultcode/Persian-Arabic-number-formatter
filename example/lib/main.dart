import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persian_input/validator/number_validator.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persian input formatter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var _persian_controller = TextEditingController();
  var _main_controller = TextEditingController();
  var _onlynumber_controller = TextEditingController();

  int? _perisan_value ;
  int? _main_value ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text("Perisan/Arabic number formatter"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              /*
              Textfield with persian input formatter
               */
              TextField(
                controller: _persian_controller,
                inputFormatters: [
                  PersianNumberValidator()
                ],
                decoration: const InputDecoration(
                    hintText: 'With persian formatter'
                ),
              ),
              const SizedBox(height: 10,),
              /*
              show result
               */
              Row(
                children: [
                  TextButton(onPressed: (){
                    setState(() {
                      _perisan_value = int.parse(_persian_controller.text);
                    });
                  },
                      child: const Text("Value to integer")),
                  const SizedBox(width: 15,),
                  Text('Result: $_perisan_value')
                ],
              ),


              /*
              Normal TextField
               */
              const SizedBox(height: 50,),
              TextField(
                decoration: const InputDecoration(
                    hintText: 'Normal formatter'
                ),
              ),
              const SizedBox(height: 10,),
              /*
              show result
               */
              Row(
                children: [
                  TextButton(onPressed: (){
                    setState(() {
                      try{
                        _main_value = int.parse(_main_controller.text);
                      }catch(e){
                        //   _main_value = e.toString();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(e.toString(),style: TextStyle(color: Colors.white,fontSize: 18),),

                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.red,));
                      }
                    });
                  },
                      child: Text("Value to integer")),
                  SizedBox(width: 15,),
                  Text('Result: $_main_value')
                ],
              ),

              /*
              Only number input TextField
               */
              const  SizedBox(height: 50,),
              const Text("The digitsOnly option not allows to use Persian/Arabic numbers"),
              const  SizedBox(height: 20,),
              TextField(
                controller: _main_controller,
                keyboardType: TextInputType.number, // Set the keyboard type to numeric
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly, // Allow only digits
                ],

                decoration: const InputDecoration(
                    hintText: 'Normal formatter'
                ),
              ),
              const SizedBox(height: 20,),


            ],
          ),
        ),
      ),
    );
  }
}



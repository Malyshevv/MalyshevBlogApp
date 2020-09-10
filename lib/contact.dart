import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text('Напиши мне'),
        backgroundColor: Colors.deepPurple[900],
      ),
     body: Container(
       child: Card(
         child: Padding(
           padding: const EdgeInsets.only(left: 0,right: 0,top: 5,bottom: 5),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: TextFormField(
                   validator: (value){
                      if (value.isEmpty) {
                        return 'Заполните поле ФИО';
                      }
                      return null;
                   },
                   decoration: const InputDecoration(
                     icon: const Icon(Icons.person),
                     hintText: 'Введите ваше ФИО',
                     labelText: 'ФИО',
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: TextFormField(
                   validator: (value){
                     if (value.isEmpty) {
                       return 'Заполните поле email';
                     }
                     return null;
                   },
                   decoration: const InputDecoration(
                     icon: const Icon(Icons.email),
                     hintText: 'Введите свой email',
                     labelText: 'Email',
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: RaisedButton(
                   child: Text('Отправить'),
                   onPressed: null,
                 ),
               )
             ],
           ),
         ),
       )
     )
    );
  }

}
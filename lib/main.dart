import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

void main() {
  runApp(
    BlocProvider(
      lazy: false,
      create: (context) => MyCubit(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          BlocBuilder<MyCubit, MyState>(builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state.index,
          onTap: (index) {
            print(context.bloc<MyCubit>().state.index);
            if (index == 0) {
              context.bloc<MyCubit>().changeToStateA();
            } else if (index == 1) {
              context.bloc<MyCubit>().changeToStateB();
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_upward),
              title: Text('Page 1'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              title: Text('Page 2'),
            ),
          ],
        );
      }),
      body: BlocBuilder<MyCubit, MyState>(
        builder: (_, state) => state is StateA ? PageA() : PageB(),
      ),
    );
  }
}

class PageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: Container(),
    );
  }
}

class PageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Container(),
    );
  }
}

import 'package:appdev_midterm/cubit/get_item_cubit.dart';
import 'package:appdev_midterm/providers/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => GetItemCubit(itemProvider: ItemProvider()),
        child: const MyHomePage(title: 'app dev midterm'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GetItemCubit>().getItems();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<GetItemCubit, GetItemState>(
        builder: (context, state) {
          if (state is GetItemLoaded) {
            return Column(
              children: [
                Text('Hello check for column'),
                Expanded(
                  child: ListView.builder(
                      itemCount: state.item.length,
                      itemBuilder: (context, i) {
                        return Card(
                            elevation: 2, child: Text(state.item[i].name));
                      }),
                ),
              ],
            );
          } else {
            return Text('Loading');
          }
        },
      ),
    );
  }
}

import 'package:appdev_midterm/cubit/cubit/dark_mode_cubit.dart';
import 'package:appdev_midterm/cubit/cubit/nav_bar_cubit.dart';
import 'package:appdev_midterm/cubit/get_item_cubit.dart';
import 'package:appdev_midterm/providers/api_provider.dart';
import 'package:appdev_midterm/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

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
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GetItemCubit(itemProvider: ItemProvider()),
          ),
          BlocProvider(
            create: (context) => DarkModeCubit(),
          ),
          BlocProvider(
            create: (context) => NavBarCubit(),
          ),
        ],
        child: const MyHomePage(title: 'E-Shop'),
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
  int _selectedIndex = 0;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GetItemCubit>().getItems();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkModeCubit, DarkModeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: state is DarkModeFalse ? Colors.white : Colors.black,
          appBar: AppBar(
            backgroundColor:
                state is DarkModeFalse ? Colors.white : Colors.black,
            title: Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: state is DarkModeFalse
                    ? Colors.black
                    : const Color.fromARGB(255, 185, 185, 185),
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    context.read<DarkModeCubit>().toggleDarkMode();
                  },
                  icon: Icon(
                    Icons.dark_mode,
                    color: state is DarkModeFalse
                        ? Colors.black
                        : const Color.fromARGB(255, 185, 185, 185),
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart,
                    color: state is DarkModeFalse
                        ? Colors.black
                        : const Color.fromARGB(255, 185, 185, 185),
                  ))
            ],
          ),
          body: BlocBuilder<NavBarCubit, NavBarState>(
            builder: (context, navBarstate) {
              if (navBarstate is NavBarCategories) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Lottie.asset('assets/coming_soon.json'),
                        SizedBox(
                          height: 120,
                        ),
                        Text(
                          'Profile Coming Soon',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: state is DarkModeTrue
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'We\'re building an amazing profile experience for you to manage your account!',
                          style: TextStyle(
                            color: state is DarkModeTrue
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        OutlinedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.login),
                            label: Text('Sign In'))
                      ],
                    ),
                  ),
                );
              } else if (navBarstate is NavBarProfile) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Lottie.asset('assets/coming_soon.json'),
                        SizedBox(
                          height: 120,
                        ),
                        Text(
                          'Categories Coming Soon',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: state is DarkModeTrue
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'We are working very hard to bring you a great category browsing experience!',
                          style: TextStyle(
                            color: state is DarkModeTrue
                                ? Colors.black
                                : Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return BlocBuilder<GetItemCubit, GetItemState>(
                  builder: (context, itemstate) {
                    if (itemstate is GetItemLoaded) {
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.4),
                                itemCount: itemstate.item.length,
                                itemBuilder: (context, i) {
                                  return MyCard(product: itemstate.item[i]);
                                })
                          ],
                        ),
                      );
                    } else {
                      return Text('Loading');
                    }
                  },
                );
              }
            },
          ),
          bottomNavigationBar: BlocBuilder<NavBarCubit, NavBarState>(
            builder: (context, navBarstate) {
              return NavigationBar(
                backgroundColor:
                    state is DarkModeTrue ? Colors.black : Colors.white,
                selectedIndex: navBarstate is NavBarProfile
                    ? 1
                    : navBarstate is NavBarCategories
                        ? 2
                        : 0,
                destinations: const [
                  NavigationDestination(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  NavigationDestination(
                      icon: Icon(Icons.category_outlined), label: 'Categories'),
                  NavigationDestination(
                      icon: Icon(Icons.account_circle), label: 'Profile'),
                ],
                indicatorColor: Colors.purple,
                onDestinationSelected: _onItemTapped,
              );
            },
          ),
        );
      },
    );
  }

  void _onItemTapped(int index) {
    _selectedIndex = index;
    context.read<NavBarCubit>().changePage(index);
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/bloc/Category/category_event.dart';
import 'package:food_app/bloc/product/product_bloc.dart';
import 'package:food_app/bloc/product/product_event.dart';
import 'package:food_app/bloc/product/product_state.dart';
import 'package:food_app/model/product_model.dart';
import 'package:food_app/widgets/custome_appbar.dart';
import 'package:food_app/widgets/custome_navbar.dart';
import 'package:food_app/widgets/heros_carouselCard.dart';
import 'package:food_app/widgets/section_title.dart';
import '../../bloc/Category/category_bloc.dart';
import '../../bloc/Category/category_state.dart';
import '../../constant/constant.dart';
import '../../model/category_model.dart';
import '../../widgets/product_carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const HomeScreen());
    // builder: (_) => RepositoryProvider.value(
    //       value: RepositoryProvider.of<ProductRepository>(_),
    //     ) // re-use existing repository,)
    // );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(RepositoryProvider.of(context))
        ..add(
          ProductLoadingEvent(),
        ),
      child: _elementBody(context),
    );
  }

  Scaffold _elementBody(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: DrawerHomeScreen(),
      ),
      appBar: CustomeAppBar(
        title: 'HOME',
        btnWishlist: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, Constant().wishlistScreen);
          },
          icon: const Icon(
            Icons.favorite_border,
            color: Colors.black,
          ),
        ),
        // ontap: () {
        //   Navigator.pushNamed(context, Constant().wishlistScreen);
        // },
      ),
      bottomNavigationBar: const CustomNavBar(),
      body: BlocBuilder<ProductBloc, ProductState>(
        // bloc: BlocProvider.of<ProductBloc>(context),
        buildWhen: (previous, current) => previous != current,
        builder: (BuildContext context, state) {
          if (state is ProductLoadedState) {
            final List<Product> products = state.products.toList();

            return BodyWidget(products: products);
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    super.key,
    required this.products,
  });

  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryBloc(RepositoryProvider.of(context))
        ..add(CategoryLoadingEvent()),
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (BuildContext context, state) {
          if (state is CategoryLoadedState) {
            List<Category> categories = state.categories.toList();
            return SingleChildScrollView(
              child: Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 1.5,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      autoPlay: true,
                    ),
                    items: categories
                        .map((e) => HeroCarouselCard(category: e))
                        .toList(),
                  ),
                  // CaroueselSlider(context: context),
                  SectionTitle(title: 'Recommendation'),
                  // List product carousel show only Recomended product
                  ProductCarousel(
                      // products: Product.products.where((pro) => pro.isRecommend).toList(),
                      products:
                          products.where((pro) => pro.isrecommend!).toList()),
                  SectionTitle(title: 'Popular'),
                  ProductCarousel(
                    // products: Product.products.where((pro) => pro.isPopular).toList())
                    products: products.where((pro) => pro.ispopular!).toList(),
                  )
                ],
              ),
            );
          }
          return const Card();
        },
      ),
    );
  }
}

class DrawerHomeScreen extends StatelessWidget {
  const DrawerHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      DrawerHeader(
          child: Column(
        children: [
          ListTile(
            trailing: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Padding(
                  padding: EdgeInsets.only(left: 25, bottom: 25),
                  child: Icon(
                    Icons.cancel_outlined,
                    size: 26,
                  ),
                )),
          )
        ],
      )),
      const ListTile(
        title: Text("Create Item"),
      ),
      const ListTile(title: Text("Create Item")),
    ]);
  }
}

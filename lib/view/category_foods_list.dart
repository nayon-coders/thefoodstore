import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:the_food_store/app_theme.dart';
import 'package:the_food_store/controller/categoryList_controller.dart';
import 'package:the_food_store/controller/category_foods_controller.dart';
import 'package:the_food_store/controller/product_controller.dart';
import 'package:the_food_store/view/profile.dart';
import 'package:the_food_store/view/single-food.dart';
import 'package:the_food_store/view_model/home_populer_product.dart';
import '../app_confige.dart';
import '../view_model/grider-foods-list.dart';
import '../view_model/loading_with_logo.dart';
import '../view_model/not_found.dart';
import 'favorite.dart';
import 'home-screen.dart';
import 'my-cart.dart';
import 'order-list.dart';

class CategoryFoodsList extends StatefulWidget {
  final String id;
  final String name;
  final String image;
  const CategoryFoodsList({Key? key, required this.id, required this.name, required this.image}) : super(key: key);

  @override
  State<CategoryFoodsList> createState() => _CategoryFoodsListState();
}

class _CategoryFoodsListState extends State<CategoryFoodsList> {

CategoryFoodController categoryFoodController = Get.put(CategoryFoodController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryFoodController.getCategorProduct(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: ()=>Get.back(),
          color: Colors.black54,
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text("${widget.name}",
          style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w600,
              fontSize: 13.sp
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Obx(()=> Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                // TextFormField(
                //   decoration: InputDecoration(
                //       fillColor: AppTheme.white,
                //       filled: true,
                //       prefixIcon: Icon(
                //           Icons.search
                //       ),
                //       suffixIcon: Icon(
                //           Icons.filter_list
                //       ),
                //       hintText: "Search Foods",
                //       contentPadding: EdgeInsets.only(left: 20, right: 20,),
                //       border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(10),
                //           borderSide: BorderSide.none
                //       )
                //   ),
                // ),
                SizedBox(height: 30,),

                categoryFoodController.isLoading.value ? Container(
                  width: size.width,
                  child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15.0,
                        mainAxisSpacing: 0.0,
                        mainAxisExtent: 220,
                      ),
                      itemCount:10,
                      itemBuilder: (BuildContext ctx, index) {
                        return loadingWithLogo(height: 100, width: size.width/2.2);
                      }),
                ): Container(
                  width: size.width,
                  child: categoryFoodController.categoryFoods?.length ==0?NotFound(title: "Food not found",)
                      : GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15.0,
                        mainAxisSpacing: 0.0,
                        mainAxisExtent: 220,
                      ),
                      itemCount:categoryFoodController.categoryFoods?.length,
                      itemBuilder: (BuildContext ctx, index) {
                        var products = categoryFoodController.categoryFoods?[index];
                        print("product list cat $products");
                        return GriderFoodsList(
                          onClick: ()=>Get.to(SingleFood(id: "${products?["id"]}"), transition: Transition.rightToLeft),
                          onClickAddtoCart: (){},
                          index: index,
                          title: "${products?["name"]}",
                          images: Image.network("${AppConfig.PRODUCT_URL+products?["image"]}", height: 80, width: 120, fit: BoxFit.cover,),
                          rating: products?["rating"].length == 0 ? 0.0 : 4.5,
                          price: "${products?["price"]}",
                        );
                      }),
                ),


              ],
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.shopping_cart_rounded),
        onPressed: ()=>Get.to(MyCart(), transition: Transition.zoom),      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        Get.to(Home(), transition: Transition.rightToLeft);
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.home_filled,
                          color: Colors.grey,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: AppTheme.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        Get.to(Favorite(), transition: Transition.rightToLeft);
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.favorite,
                          color: Colors.grey,
                        ),
                        Text(
                          'Favourite',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        Get.to(OrderList(), transition: Transition.rightToLeft);
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.list_alt,
                          color: Colors.grey,
                        ),
                        Text(
                          'Order List',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        Get.to(Profile(), transition: Transition.rightToLeft);
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.person_outline,
                          color: Colors.grey,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )

            ],
          ),
        ),
      ),

    );
  }
  int currentTab = 0;
}


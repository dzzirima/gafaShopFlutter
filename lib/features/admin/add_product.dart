import 'package:amazon_clone/common/Widgets/custom_button.dart';
import 'package:amazon_clone/common/Widgets/custom_textfield.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);
  static const String routeName = "/add-product";

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  String Category = 'Mobiles';

  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }

  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Text(
                        "Add Product",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),
                DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10),
                  dashPattern: const [10, 4],
                  strokeCap: StrokeCap.round,
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.folder_open,
                          size: 40,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Select Product Images",
                          style: TextStyle(
                              fontSize: 15, color: Colors.grey.shade400),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                CustomeTextField(
                  controller: productNameController,
                  hintText: "Product name",
                ),
                const SizedBox(height: 10),
                CustomeTextField(
                  controller: descriptionController,
                  hintText: "Description",
                  maxLines: 7,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomeTextField(
                  controller: priceController,
                  hintText: "Price",
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomeTextField(
                  controller: quantityController,
                  hintText: "Quantity",
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: Category,
                    onTap: () {},
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: productCategories.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newVal) {
                      Category = newVal!;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(text: "Sell", onTap: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}

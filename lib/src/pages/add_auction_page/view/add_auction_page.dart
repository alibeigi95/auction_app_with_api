import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/add_auction_controller.dart';

class AddAuctionPage extends GetView<AddAuctionController> {
  const AddAuctionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('add weather app')),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    nameInput(),
                    descriptionInput(),
                    basePriceInput(),
                    _submit(),
                  ],
                )),
          ),
        ]),
      );

  Widget nameInput() {
    return TextFormField(
      decoration: const InputDecoration(
        label: Padding(
          padding: EdgeInsets.only(right: 15),
          child: Text(
            'name',
            style: TextStyle(
                fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      controller: controller.nameController,
      validator: (input) {
        if (input == null || input.isEmpty) {
          return 'error';
        }
        return null;
      },
    );
  }

  Widget descriptionInput() {
    return TextFormField(
      controller: controller.descriptionController,
      decoration: const InputDecoration(
        label: Padding(
          padding: EdgeInsets.only(right: 15),
          child: Text(
            'description',
            style: TextStyle(
                fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      validator: (input) {
        if (input == null || input.isEmpty) {
          return 'error';
        }

        return null;
      },
    );
  }

  Widget basePriceInput() {
    return TextFormField(
      controller: controller.basePriceController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        label: Padding(
          padding: EdgeInsets.only(right: 15),
          child: Text(
            'Base price',
            style: TextStyle(
                fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      validator: (input) {
        if (input == null || input.isEmpty) {
          return 'error';
        }

        return null;
      },
    );
  }

  Widget _submit() => Obx(
        () => controller.isSubmitLoading.value
            ? _submitLoading()
            : ElevatedButton(
                onPressed: controller.onSubmit,
                child: const Text('Submit'),
              ),
      );

  Widget _submitLoading() => const DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: CircularProgressIndicator(),
      );
}

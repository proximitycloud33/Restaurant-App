import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/model/restaurant_customer_review_model.dart';
import 'package:restaurant_app/services/api_service.dart';

class AddReviewScreen extends StatefulWidget {
  static const String routeName = '/addReviewScreen';
  final String restaurantId;
  const AddReviewScreen({super.key, required this.restaurantId});

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  late TextEditingController _nameController;
  late TextEditingController _reviewController;
  late FocusNode _nameFocusNode;
  late FocusNode _reviewFocusNode;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _reviewController = TextEditingController();
    _nameFocusNode = FocusNode();
    _reviewFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _reviewController.dispose();
    _nameFocusNode.dispose();
    _reviewFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Review'),
          actions: [
            IconButton(
              icon: const Icon(Icons.done),
              tooltip: 'Done',
              onPressed: () {
                if (_nameController.text.isNotEmpty &&
                    _reviewController.text.isNotEmpty) {
                  final customerReview = CustomerReview(
                    id: widget.restaurantId,
                    name: _nameController.text.trimLeft(),
                    review: _reviewController.text.trimLeft(),
                  );
                  ApiService().addReview(
                    http.Client(),
                    customerReview.toJson(),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      content: const Text('Review Added'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 8, top: 20, right: 8),
            child: Column(
              children: [
                TextField(
                  autofocus: true,
                  focusNode: _nameFocusNode,
                  controller: _nameController,
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () {
                    _reviewFocusNode.requestFocus();
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 25,
                      horizontal: 16,
                    ),
                    filled: true,
                    hintText: 'Nama',
                    suffixIcon: IconButton(
                        onPressed: () {
                          _nameController.clear();
                        },
                        icon: const Icon(Icons.cancel_outlined)),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _reviewController,
                  focusNode: _reviewFocusNode,
                  maxLines: null,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 25,
                      horizontal: 16,
                    ),
                    filled: true,
                    hintText: 'Review',
                    suffixIcon: IconButton(
                        onPressed: () {
                          _reviewController.clear();
                        },
                        icon: const Icon(Icons.cancel_outlined)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

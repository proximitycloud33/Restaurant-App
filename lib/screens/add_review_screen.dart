import 'package:flutter/material.dart';

class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({super.key});
  static const String routeName = '/addReviewScreen';

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  late TextEditingController _nameController;
  late TextEditingController _reviewController;
  late FocusNode _namefocusNode;
  late FocusNode _reviewfocusNode;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _reviewController = TextEditingController();
    _namefocusNode = FocusNode();
    _reviewfocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _reviewController.dispose();
    _namefocusNode.dispose();
    _reviewfocusNode.dispose();
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
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 8, top: 20, right: 8),
            child: Column(
              children: [
                TextField(
                  autofocus: true,
                  focusNode: _namefocusNode,
                  controller: _nameController,
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () {
                    _reviewfocusNode.requestFocus();
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
                  focusNode: _reviewfocusNode,
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
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Row(
            children: [
              Row(
                children: const [
                  Icon(Icons.done),
                  SizedBox(width: 12),
                  Text('Submit Review'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

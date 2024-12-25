import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/food_item.dart';

// AddItemScreen with support for both adding and editing items
class AddItemScreen extends StatefulWidget {
  final Function(Map<String, dynamic>) onAddItem;
  final bool isEditing;
  final FoodItem? existingItem;

  const AddItemScreen({
    super.key,
    required this.onAddItem,
    this.isEditing = false,
    this.existingItem,
  });

  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  DateTime? _selectedDate;
  String? _selectedCategory;

  final List<String> _categories = ['Meat', 'Vegetable', 'Other'];

  @override
  void initState() {
    super.initState();
    if (widget.isEditing && widget.existingItem != null) {
      _nameController.text = widget.existingItem!.name;
      _quantityController.text = widget.existingItem!.quantity.toString();
      _selectedDate = widget.existingItem!.expirationDate;
      _selectedCategory = _getCategoryForItem(widget.existingItem!);
    }
  }

  String _getCategoryForItem(FoodItem item) {
    if (item.name.toLowerCase().contains('fish') || item.name.toLowerCase().contains('meat')) {
      return 'Meat';
    } else if (item.name.toLowerCase().contains('cabbage') || item.name.toLowerCase().contains('vegetable')) {
      return 'Vegetable';
    } else {
      return 'Other';
    }
  }

  void _pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _submitItem() {
    if (_nameController.text.isEmpty ||
        _quantityController.text.isEmpty ||
        int.tryParse(_quantityController.text) == null ||
        _selectedDate == null ||
        _selectedCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete all fields correctly')),
      );
      return;
    }

    widget.onAddItem({
      'name': _nameController.text,
      'quantity': int.parse(_quantityController.text),
      'expirationDate': _selectedDate,
      'category': _selectedCategory,
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEditing ? 'Edit Item' : 'Add Item')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Item Name'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _quantityController,
              decoration: const InputDecoration(labelText: 'Quantity'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Category'),
              items: _categories.map((category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value;
                });
              },
              value: _selectedCategory,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedDate != null
                      ? DateFormat.yMMMd().format(_selectedDate!)
                      : 'No date selected',
                  style: const TextStyle(fontSize: 16),
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _pickDate(context),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: _submitItem,
                  child: Text(widget.isEditing ? 'Update' : 'Create'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

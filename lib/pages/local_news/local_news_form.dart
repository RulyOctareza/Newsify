import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newsify/controller/local_news_controller.dart';
import 'package:newsify/model/local_news_model.dart';
import 'package:newsify/static/custom/custom_button.dart';
import 'package:newsify/static/custom/custom_input_field.dart';

class LocalNewsForm extends StatelessWidget {
  final LocalNewsModel? news;
  final LocalNewsController _localNewsController = Get.put(
    LocalNewsController(),
  );

  LocalNewsForm({super.key, this.news});

  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _authorController = TextEditingController();

  final Rx<DateTime?> _selectedDate = Rx<DateTime?>(null);
  final Rx<XFile?> _image = Rx<XFile?>(null);

  // @override
  // void onInit() {
  //   super.onInit();
  //   if (news != null) {
  //     _titleController.text = news!.title ?? '';
  //     _contentController.text = news!.content ?? '';

  //     _selectedDate.value = news!.date;
  //     _image.value = news!.imageUrl != null ? XFile(news!.imageUrl!) : null;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News Form')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CustomInputField(
            label: 'Title',
            controller: _titleController,
            hintText: 'title news',
          ),
          const SizedBox(height: 8),
          CustomInputField(
            maxLines: 6,
            hintText: 'Description ...',
            label: 'Content',
            controller: _contentController,
          ),
          CustomInputField(
            maxLines: 1,
            hintText: 'Description ...',
            label: 'Author',
            controller: _authorController,
          ),

          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 12,
                child: Obx(
                  () => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black54),
                    ),
                    child:
                        _selectedDate.value == null
                            ? const Text('No Date Selected')
                            : Text(_selectedDate.value!.toIso8601String()),
                  ),
                ),
              ),
              const Spacer(flex: 1),
              CustomButton(
                onPressed: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );
                  if (date != null) {
                    _selectedDate.value = date;
                  }
                },
                text: 'Select date',
              ),
            ],
          ),
          const SizedBox(height: 16),
          Obx(
            () => Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.shade200,
                border: Border.all(color: Colors.black87, width: 1),
                image:
                    _image.value == null
                        ? null
                        : DecorationImage(
                          image: FileImage(File(_image.value!.path)),
                          fit: BoxFit.cover,
                        ),
              ),
              child:
                  _image.value == null
                      ? const Center(child: Text('No Image Selected'))
                      : const SizedBox.shrink(),
            ),
          ),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: () async {
              final image = await ImagePicker().pickImage(
                source: ImageSource.gallery,
                imageQuality: 50,
              );
              if (image != null) {
                _image.value = image;
              }
            },
            child: const Text('Select Image'),
          ),
          const SizedBox(height: 16),
          CustomButton(
            onPressed: () {
              final news = LocalNewsModel(
                id: this.news?.id,
                title: _titleController.text,
                content: _contentController.text,
                author: _authorController.text,
                date: _selectedDate.value,
                imageUrl: _image.value?.path,
              );

              if (news.id == null) {
                _localNewsController.addNews(news);
              } else {
                _localNewsController.updateNews(news);
              }

              Get.back();
            },
            text: 'Save',
          ),
        ],
      ),
    );
  }
}

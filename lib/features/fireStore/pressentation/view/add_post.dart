import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../model/post_model.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final TextEditingController _controller = TextEditingController();
  int _charCount = 0;
  bool _isLoading = false;

  void addPost() async {
    final post = _controller.text.trim();

    if (post.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please write something first.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    try {
      // جلب المستخدم الحالي
      final user = FirebaseAuth.instance.currentUser;

      final postContent = PostModel(
        authorId: user?.uid ?? 'guest_user',
        authorEmail: user?.email ?? 'guest@example.com',
        likes: [],
        content: post,
      );

      // رفع البيانات للفايرستور
      await FirebaseFirestore.instance
          .collection('posts')
          .add(postContent.toFireStore());

      print('✅ تم إضافة البوست بنجاح إلى الفايرستور!');

      if (mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      print('❌ حدث خطأ أثناء الرفع: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _charCount = _controller.text.length;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // تحديد الألوان المستخدمة لسهولة التعديل عليها مستقبلاً
    final Color primaryColor = const Color(0xFF0F5A47); // اللون الأخضر الداكن
    final Color backgroundColor = const Color(0xFFE8F1EC); // خلفية الصفحة الفاتحة
    final Color cardColor = const Color(0xFFF3F8F5); // خلفية حقل النص

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () {
            Navigator.maybePop(context);
          },
        ),
        title: Text(
          "Create Post",
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // العنوان الرئيسي الفرعي
              const Text(
                "What's on your mind?",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 6),

              // الوصف التوضيحي
              Text(
                "Share something with your friends and community.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 20),

              // حقل النص المخصص (TextField)
              Container(
                height: 280,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black.withOpacity(0.04)),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        maxLength: 500,
                        maxLines: null,
                        expands: true,
                        style: const TextStyle(fontSize: 16, color: Colors.black87),
                        decoration: InputDecoration(
                          hintText: 'Write your post here...',
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          border: InputBorder.none,
                          counterText: "", // إخفاء العداد الافتراضي لنضعه بشكل مخصص
                        ),
                      ),
                    ),
                    // عداد الحروف أسفل مربع النص
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "$_charCount/500",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // زر النشر (Publish Post)
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed:addPost,
                  icon: const Icon(Icons.send_rounded, size: 20),
                  label: const Text(
                    "Publish Post",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
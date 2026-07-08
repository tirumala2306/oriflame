import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:oriflame/core/theme/app_colors.dart';
import 'package:oriflame/core/theme/app_typography.dart';
import 'package:oriflame/shared/widgets/primary_button.dart';

class EditCaptionScreen extends StatefulWidget {
  const EditCaptionScreen({super.key, required this.initialCaption});

  final String initialCaption;

  @override
  State<EditCaptionScreen> createState() => _EditCaptionScreenState();
}

class _EditCaptionScreenState extends State<EditCaptionScreen> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  bool _hasChanges = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialCaption);
    _focusNode = FocusNode();
    _controller.addListener(_onTextChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  void _onTextChanged() {
    final changed = _controller.text != widget.initialCaption;
    if (changed != _hasChanges) {
      setState(() => _hasChanges = changed);
    }
  }

  void _save() {
    if (!_hasChanges) return;
    context.pop(_controller.text.trim());
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_onTextChanged)
      ..dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, size: 24.sp),
          onPressed: () => context.pop(),
        ),
        title: Text('Edit Caption', style: AppTypography.captionBody.copyWith(fontSize: 14.sp)),
        actions: [
          PrimaryButton(
            label: 'Save',
            onPressed: _hasChanges ? _save : null,
            backgroundColor: _hasChanges
                ? AppColors.saveButtonBackground
                : AppColors.saveButtonDisabledBackground,
            foregroundColor: _hasChanges
                ? AppColors.primaryDark
                : AppColors.saveButtonDisabledText,
          ),
          SizedBox(width: 32.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: TextField(
          controller: _controller,
          focusNode: _focusNode,
          maxLines: null,
          expands: true,
          style: AppTypography.editCaptionTitle.copyWith(color: Colors.black, height: 1.2),
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Write your caption...',
          ),
        ),
      ),
    );
  }
}

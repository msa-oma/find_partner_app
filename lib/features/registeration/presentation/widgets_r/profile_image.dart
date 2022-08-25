import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../bloc_r/register_bloc/register_bloc.dart';

class Imageforprofile extends StatefulWidget {
  const Imageforprofile({Key? key}) : super(key: key);

  @override
  State<Imageforprofile> createState() => _ImageforprofileState();
}

class _ImageforprofileState extends State<Imageforprofile> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imagefile;

  @override
  Widget build(BuildContext context) {
    return imageprofile();
  }

  Widget imageprofile() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const SizedBox(
        width: 50,
      ),
      Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(10)),
        height: 100,
        width: 100,
        child: Center(
          child: _imagefile == null
              ? SvgPicture.asset(
                  'assets/svgs/image.svg',
                  width: 20,
                  height: 20,
                )
              : Image.file(File(_imagefile!.path)),
        ),
      ),
      IconButton(
        icon: SvgPicture.asset('assets/svgs/home.svg'),
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (builder) => bottomSheet(context));
        },
      ),
    ]);
  }

  Widget bottomSheet(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          const Text(
            'choose profile photo',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                  },
                  icon: const Icon(Icons.camera),
                  label: const Text('camera')),
              TextButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                  },
                  icon: const Icon(Icons.image),
                  label: const Text('Gallery'))
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedfile = await _picker.pickImage(source: source);

    setState(() {
      _imagefile = pickedfile;
      final bytes = File(_imagefile!.path).readAsBytesSync();
      String imageas64 = base64Encode(bytes);
      BlocProvider.of<RegisterBloc>(context, listen: false)
          .add(SelectedImageEvent(selectedImageE: imageas64));
    });
  }
}

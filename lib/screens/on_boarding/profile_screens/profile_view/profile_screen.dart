import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/constants/app_state_constants.dart';
import 'package:scholars_padi/routes/page_routes.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusaable_textformfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scholars_padi/widgets/utils/progress_bar.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const String id = 'profileScrren';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  bool readOnly = true;
  bool onEdit = false;
  final _formKey = GlobalKey<FormState>();
  final _fullnameCont = TextEditingController();
  final _usernameCont = TextEditingController();
  final _facultyCont = TextEditingController();
  final _phoneCont = TextEditingController();
  final _email = TextEditingController();
  String? _profilePhone;
  // bool _isObscure = true;
  // bool _isObscure1 = true;

  bottomSheet(BuildContext context, WidgetRef ref) async {
    final profileViewModel = ref.watch(profileViewModelProvider);
    return showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          color: AppColor.darkContainer,
          height: 150.h,
          child: Column(
            children: [
              NormalText(
                text: 'Choose Profile Picture',
                fontWeight: FontWeight.w700,
                size: 20.sp,
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(
                        color: AppColor.mainColor,
                        iconSize: 50.w,
                        onPressed: () {
                          profileViewModel.pickImage(ImageSource.camera);
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.add_a_photo_rounded),
                      ),
                      NormalText(text: 'Camera')
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        color: AppColor.mainColor,
                        iconSize: 50.w,
                        onPressed: () {
                          profileViewModel.pickImage(ImageSource.gallery);
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.image),
                      ),
                      NormalText(
                        text: 'Galary',
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //profile picture update notifire
    final profileViewModel = ref.watch(profileViewModelProvider);
    final authViewModel = ref.watch(authViewModelProvider);

    //user data update notifire
    final userApiData = ref.watch(userProvider);
    _profilePhone = userApiData.profilePhoto ?? '';
    _email.text = userApiData.email ?? '';
    _fullnameCont.text = userApiData.fullname ?? '';
    _usernameCont.text = userApiData.username ?? '';
    _facultyCont.text = userApiData.faculty ?? '';
    _phoneCont.text = userApiData.phoneNumber ?? '';


    
    
    


    // bool submit = true;

    //check to make sure form is ofdated before sending request
    // checkInputedData() {
    //     print(profileViewModel.uploadImage);
    //     print(userApiData.profilePhoto);
    //   if (_fullnameCont.text.trim() == userApiData.fullname &&
    //       _usernameCont.text.trim() == userApiData.username &&
    //       _phoneCont.text.trim() == userApiData.phoneNumber &&
    //       profileViewModel.uploadImage == userApiData.profilePhoto) {
    //     setState(() {
    //       submit = false;
    //     });

    //   }
    // }

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(103.h),
          child: AppBar(
            title: Padding(
              padding: EdgeInsets.only(
                top: 10.0.h,
              ),
              child: NormalText(
                text: 'Profile',
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            toolbarHeight: 103.h,
            backgroundColor: AppColor.mainColor,
            leading: Center(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 10.0.h,
                ),
                child: IconButton(
                  onPressed: () {
                    pushOnBoardingScreen(context);
                  },
                  icon: !onEdit
                      ? Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 30.w,
                        )
                      : Icon(
                          Icons.close,
                          size: 30.w,
                          color: Colors.white,
                        ),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(top: 10.0.h, right: 10.w),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      onEdit = !onEdit;
                      !onEdit
                          ? authViewModel.updateUserProfile({
                              "profilePhoto": profileViewModel.uploadImage,
                              "full_name": _fullnameCont.text.trim(),
                              "username": _usernameCont.text.trim(),
                              "phoneNumber": _phoneCont.text.trim(),
                              "faculty": _facultyCont.text.trim(),
                            }, context)
                          : null;

                      // checkInputedData();

                      //  if (submit == true) {
                      //   !onEdit
                      //       ? authViewModel.updateUserProfile({
                      //           "profilePicture": profileViewModel.image ?? '',
                      //           "full_name": _fullnameCont.text.trim(),
                      //           "username": _usernameCont.text.trim(),
                      //           "phoneNumber": _phoneCont.text.trim(),
                      //           "faculty": _facultyCont.text.trim(),
                      //         }, context)
                      //       : null;
                      //  }
                    });
                  },
                  icon: onEdit
                      ? Icon(
                          Icons.save,
                          size: 30.w,
                          color: Colors.white,
                        )
                      : Icon(
                          Icons.edit,
                          size: 30.w,
                          color: Colors.white,
                        ),
                ),
              )
            ],
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                height: 621.h,
                width: double.infinity,
                color: AppColor.darkContainer,
                child: Column(
                  children: [
                    SizedBox(
                      height: 24.h,
                    ),
                    Stack(
                      children: [
                        // ClipOval(child: Image.file(image!, width: 100.w, height: 100.h, fit: BoxFit.cover,), )
                        profileViewModel.image != null
                            ? Container(
                                height: 130.h,
                                width: 130.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: FileImage(profileViewModel.image!),
                                  ),
                                ),
                              )
                            : userApiData.profilePhoto != null
                                ? Container(
                                    height: 130.h,
                                    width: 130.w,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          _profilePhone!,
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: 130.h,
                                    width: 130.w,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          'lib/assets/homepageimage.png',
                                        ),
                                      ),
                                    ),
                                  ),
                        onEdit
                            ? Positioned(
                                top: 35.h,
                                left: 35.w,
                                child: IconButton(
                                  color: Colors.white,
                                  iconSize: 40.w,
                                  icon: const Icon(
                                    Icons.camera_alt,
                                  ),
                                  onPressed: () {
                                    bottomSheet(context, ref);
                                  },
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    NormalText(
                      text: userApiData.fullname!,
                      fontWeight: FontWeight.w500,
                      size: 19.2.sp,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          MyTextField(
                            enable: onEdit,
                            controller: _fullnameCont,
                            obcureText: false,
                            keyBoardType: TextInputType.text,
                            isPassword: false,
                            isReadOnly: !onEdit,
                            labelText: 'Full Name',
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          MyTextField(
                            enable: onEdit,
                            controller: _usernameCont,
                            obcureText: false,
                            keyBoardType: TextInputType.text,
                            isPassword: false,
                            isReadOnly: !onEdit,
                            labelText: 'Username',
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          MyTextField(
                            enable: onEdit,
                            controller: _facultyCont,
                            obcureText: false,
                            keyBoardType: TextInputType.text,
                            isPassword: false,
                            isReadOnly: !onEdit,
                            labelText: 'Faculty',
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          MyTextField(
                            enable: onEdit,
                            controller: _phoneCont,
                            obcureText: false,
                            keyBoardType: TextInputType.text,
                            isPassword: false,
                            isReadOnly: !onEdit,
                            labelText: 'Phone Number',
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          MyTextField(
                            enable: false,
                            controller: _email,
                            obcureText: false,
                            keyBoardType: TextInputType.text,
                            isPassword: false,
                            isReadOnly: true,
                            labelText: 'Email',
                          ),
                          // SizedBox(
                          //   height: 24.h,
                          // ),
                          // onEdit
                          //     ? MyTextField(
                          //         enable: onEdit,
                          //         controller: _password,
                          //         obcureText: false,
                          //         keyBoardType: TextInputType.text,
                          //         isPassword: false,
                          //         isReadOnly: !onEdit,
                          //         labelText: 'Password',
                          //         sufixIcon: IconButton(
                          //           color: Colors.black54,
                          //           icon: Icon(_isObscure
                          //               ? Icons.visibility
                          //               : Icons.visibility_off),
                          //           onPressed: onEdit
                          //               ? () {
                          //                   setState(() {
                          //                     _isObscure = !_isObscure;
                          //                   });
                          //                 }
                          //               : null,
                          //         ),
                          //       )
                          //     : const SizedBox(),
                          // SizedBox(
                          //   height: 24.h,
                          // ),
                          // onEdit
                          //     ? MyTextField(
                          //         validator: (pass) {
                          //           if (pass != _password.text) {
                          //             return 'Password Dont match';
                          //           }
                          //           return null;
                          //         },
                          //         controller: _password,
                          //         obcureText: false,
                          //         keyBoardType: TextInputType.text,
                          //         isPassword: false,
                          //         isReadOnly: !onEdit,
                          //         labelText: 'Confirm Password',
                          //         sufixIcon: IconButton(
                          //           color: Colors.black54,
                          //           icon: Icon(_isObscure1
                          //               ? Icons.visibility
                          //               : Icons.visibility_off),
                          //           onPressed: onEdit
                          //               ? () {
                          //                   setState(
                          //                     () {
                          //                       _isObscure1 = !_isObscure1;
                          //                     },
                          //                   );
                          //                 }
                          //               : null,
                          //         ),
                          //       )
                          //     : const SizedBox()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              child: authViewModel.loading
                  ? const Center(
                      child: ProgressDialog(
                        message: 'Loading....',
                      ),
                    )
                  : const SizedBox(),
            ),
          ],
        ));
  }
}

library login;

import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ptirex/app/config/routes/app_pages.dart';
import 'package:ptirex/app/shared_components/card_title.dart';
import 'package:ptirex/app/shared_components/developed_by_s3eb.dart';
import 'package:ptirex/app/shared_components/field_common.dart';
import 'package:ptirex/app/shared_components/field_password.dart';
import 'package:ptirex/app/shared_components/send_form_button.dart';
import 'package:ptirex/app/utils/core/authentification_manager.dart';
import 'package:ptirex/app/utils/ui/ui_utils.dart';

part 'views/screens/login_screen.dart';

part 'controllers/login_controller.dart';

part 'bindings/login_binding.dart';

part 'views/components/login_button.dart';
part 'views/components/login_field_email.dart';
part 'views/components/login_field_password.dart';
part 'views/components/link_forgot_password.dart';
part 'views/components/link_signup.dart';

library register;

import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ptirex/app/config/routes/app_pages.dart';
import 'package:ptirex/app/shared_components/card_title.dart';
import 'package:ptirex/app/shared_components/field_common.dart';
import 'package:ptirex/app/shared_components/field_password.dart';
import 'package:ptirex/app/shared_components/send_form_button.dart';
import 'package:ptirex/app/utils/ui/ui_utils.dart';

// binding
part './bindings/register_binding.dart';

// controller
part './controllers/register_controller.dart';

// model

// component
part './views/components/register_button.dart';
part './views/components/checkbox_confidential.dart';
part './views/components/checkbox_chercheur_partageur.dart';
part 'views/components/register_field_first_name.dart';
part 'views/components/register_field_last_name.dart';
part 'views/components/register_field_pseudo.dart';
part 'views/components/register_field_email.dart';
part 'views/components/register_field_password.dart';
part 'views/components/register_field_repeat_password.dart';
part './views/components/text_inscrire.dart';

//screen
part './views/screens/register_screen.dart';

library solutions;

import 'dart:async';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ptirex/app/config/routes/app_pages.dart';
import 'package:ptirex/app/shared_components/tag_card.dart';
import 'package:ptirex/app/utils/core/authentification_manager.dart';
import 'package:ptirex/app/utils/ui/ui_utils.dart';
import 'package:url_launcher/url_launcher.dart';

// binding
part 'bindings/solutions_binding.dart';

// controller
part 'controllers/solutions_controller.dart';
//services

// views

part 'views/screens/solutions_screen.dart';
//components
part 'views/components/expandable_company.dart';
part 'views/components/ticket_data_table_filter_button.dart';

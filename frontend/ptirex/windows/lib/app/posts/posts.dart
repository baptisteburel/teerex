library posts;

import 'dart:async';
import 'dart:convert';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ptirex/app/config/routes/app_pages.dart';
import 'package:ptirex/app/shared_components/tag_card.dart';
import 'package:ptirex/app/utils/core/authentification_manager.dart';
import 'package:ptirex/app/utils/ui/ui_utils.dart';

// binding
part 'bindings/posts_binding.dart';

// controller
part 'controllers/posts_controller.dart';
//services

// views

part 'views/screens/posts_screen.dart';
//components
part 'views/components/expandable_comment.dart';

// import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:logbook_digitalization/src/blocs/blocs.dart';
import 'package:logbook_digitalization/src/cubits/cubits.dart';
import 'package:logbook_digitalization/src/models/models.dart';
import 'package:logbook_digitalization/src/utilities/utilities.dart';
import 'package:logbook_digitalization/src/widgets/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

// import 'package:qrscan/qrscan.dart' as scanner;

part 'splash_screen.dart';
part 'register_screen.dart';
part 'login_screen.dart';
part 'home/home_screen.dart';
part 'home/views/dashboard_view.dart';
part 'home/views/wishlist_view.dart';
part 'home/views/user_view.dart';
part 'admin_screen.dart';
part 'detail_screen.dart';
part 'cart_screen.dart';

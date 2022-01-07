library components;

// Imports
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:uuid/uuid.dart';
import 'theme.dart';
import 'utilities.dart';

part 'src/components/internal.dart';

// Dialogs
part 'src/components/dialogs/dialogs.dart';
part 'src/components/dialogs/y_choice_dialog.dart';
part 'src/components/dialogs/y_confirmation_dialog.dart';
part 'src/components/dialogs/y_dialog_base.dart';
part 'src/components/dialogs/y_info_dialog.dart';
part 'src/components/dialogs/y_input_dialog.dart';
part 'src/components/dialogs/y_list_dialog.dart';

// Inputs > Radio
part 'src/components/inputs/radio/y_radio_list_tile.dart';
part 'src/components/inputs/radio/y_radio.dart';
// Inputs > Checkbox
part 'src/components/inputs/checkbox/y_checkbox_list_tile.dart';
part 'src/components/inputs/checkbox/y_checkbox.dart';
// Inputs > Switch
part 'src/components/inputs/switch/y_switch_list_tile.dart';
part 'src/components/inputs/switch/y_switch.dart';
// Inputs > Form
part 'src/components/inputs/form/y_form_field.dart';
part 'src/components/inputs/form/y_form.dart';
// Inputs > Slider
part 'src/components/inputs/y_slider.dart';

// Navigation
part 'src/components/navigation/y_app_bar.dart';
part 'src/components/navigation/y_bottom_navigation_bar.dart';
part 'src/components/navigation/y_navigation_element.dart';
part 'src/components/navigation/y_page.dart';
part 'src/components/navigation/y_tab_bar.dart';

// Buttons
part 'src/components/buttons/y_button.dart';
part 'src/components/buttons/y_dropdown_button.dart';
part 'src/components/buttons/y_floating_button.dart';
part 'src/components/buttons/y_icon_button.dart';

// TODO: Bottom sheets
part 'src/components/modal_bottom_sheets/modal_bottom_sheets.dart';
part 'src/components/modal_bottom_sheets/y_modal_bottom_sheet.dart';

// Snackbar
part 'src/components/snackbar/y_snackbar.dart';
part 'src/components/snackbar/snackbars.dart';

// Progress bars
part 'src/components/progress_bars/y_linear_progress_bar.dart';
// TODO: CircularProgressBar

// TODO: Material Banner
/*
ScaffoldMessenger.of(context).showMaterialBanner(
                      MaterialBanner(
                        content: const Text('Hello, I am a Material Banner'),
                        leading: const Icon(Icons.info),
                        backgroundColor: theme.colors.primary.backgroundColor,
                        actions: [
                          YButton(
                              onPressed: () => ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
                              text: "Hide",
                              invertColors: true,
                              variant: YButtonVariant.text)
                        ],
                      ),
                    );
*/

part 'src/components/spacers.dart';
part 'src/components/y_badge.dart';
part 'src/components/y_divider.dart';
part 'src/components/y_option_tile.dart';
part 'src/components/y_refresh_indicator.dart';
part 'src/components/y_scrollbar.dart';

// Chip ? for sorting ?

// Deprecated
part 'src/components/y_shadow_scroll_container.dart';

library components;

// Imports
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'theme.dart';
import 'utilities.dart';

// Cards
part 'src/components/cards/y_card_header.dart';
part 'src/components/cards/y_card_link.dart';
part 'src/components/cards/y_card.dart';
part 'src/components/cards/y_links_card.dart';

// Dialogs
part 'src/components/dialogs/dialogs.dart';
part 'src/components/dialogs/y_choice_dialog.dart';
part 'src/components/dialogs/y_confirmation_dialog.dart';
part 'src/components/dialogs/y_dialog_base.dart';
part 'src/components/dialogs/y_info_dialog.dart';
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
part 'src/components/inputs/form/y_form_field.dart'; // TODO: Implement date and time pickers
part 'src/components/inputs/form/y_form.dart';
// Inputs > Slider
part 'src/components/inputs/y_slider.dart';

// Navigation
part 'src/components/navigation/y_app_bar.dart';
part 'src/components/navigation/y_bottom_navigation_bar.dart';
part 'src/components/navigation/y_page.dart';
// TODO: drawer
// TODO: TabBar

// Buttons
part 'src/components/buttons/y_button.dart';
part 'src/components/buttons/y_floating_button.dart';
// TODO: IconButton
// TODO: DropdownButton

// TODO: Bottom sheets
// TODO: Snackbar (using another_flushbar)

// Progress bars
part 'src/components/progress_bars/y_linear_progress_bar.dart'; // TODO: adapt to be usable at the bottom of the app bar
// TODO: CircularProgressBar

part 'src/components/spacers.dart';
part 'src/components/y_badge.dart';
part 'src/components/y_divider.dart';
part 'src/components/y_option_tile.dart';

// Chip ? for sorting ?

// Deprecated
part 'src/components/y_shadow_scroll_container.dart';

/// Touchline core UI package.
///
/// Provides:
/// - [AppConfig]: Concrete base class for per-club configuration
/// - [appConfigProvider]: Riverpod provider — overridden at app entry point
/// - Component variant enums (XFeedVariant, NextFixtureSliderVariant, etc.)
/// - Shared widgets: AppButton, AppIconButton, AppChoiceChips, AppTabBar, AppLoader, etc.
/// - Utility extensions: StringExtensions, DateTimeExtensions, and more.
library core_ui;

// Config
export 'src/config/app_config.dart';
export 'src/config/component_variants.dart';
export 'src/config/programmes_config.dart';
export 'src/config/shop_config.dart';
export 'src/config/youth_config.dart';

// Widgets
export 'src/widgets/app_button.dart';
export 'src/widgets/app_choice_chips.dart';
export 'src/widgets/app_count_controller.dart';
export 'src/widgets/app_dropdown.dart';
export 'src/widgets/app_icon_button.dart';
export 'src/widgets/app_image_viewer.dart';
export 'src/widgets/app_loader.dart';
export 'src/widgets/app_tab_bar.dart';
export 'src/widgets/keep_alive_wrapper.dart';

// Utils
export 'src/utils/datetime_extensions.dart';
export 'src/utils/form_field_controller.dart';
export 'src/utils/list_extensions.dart';
export 'src/utils/num_extensions.dart';
export 'src/utils/string_extensions.dart';
export 'src/utils/url_utils.dart';

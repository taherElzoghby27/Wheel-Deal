import 'package:cars/core/di/service_locator.dart';
import 'package:cars/features/auth/presentation/view/create_account_bloc_provider_view.dart';
import 'package:cars/features/auth/presentation/view/create_new_pass_view.dart';
import 'package:cars/features/auth/presentation/view/login_view_bloc_provider.dart';
import 'package:cars/features/auth/presentation/view/reset_pass_view_bloc_provider.dart';
import 'package:cars/features/car_details/presentation/view/car_details_bloc_provider_view.dart';
import 'package:cars/features/car_details/presentation/view_model/changed_carsoul_cubit/changed_carsoul_cubit.dart';
import 'package:cars/features/chats/presentation/view/chat_support_view.dart';
import 'package:cars/features/chats/presentation/view/chat_view.dart';
import 'package:cars/features/chats/presentation/view/faq_view.dart';
import 'package:cars/features/delete_account/presentation/screens/are_you_sure_delete_view.dart';
import 'package:cars/features/delete_account/presentation/screens/delete_account_code_view.dart';
import 'package:cars/features/delete_account/presentation/screens/delete_account_verifi.dart';
import 'package:cars/features/delete_account/presentation/screens/delete_account_view.dart';
import 'package:cars/features/edit_profile/presentation/view/edit_profile_view.dart';
import 'package:cars/features/favourites/presentation/view/favourites_view_bloc_provider.dart';
import 'package:cars/features/gate/presentation/views/gate_view.dart';
import 'package:cars/features/home/data/repos/home_repo_impl.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:cars/features/home/domain/usecases/get_model_brand.dart';
import 'package:cars/features/home/domain/usecases/previous_car_use_case.dart';
import 'package:cars/features/home/domain/usecases/user_info_use_case.dart';
import 'package:cars/features/home/presentation/view/best_offers_view_bloc_provider.dart';
import 'package:cars/features/home/presentation/view/home_view_bloc_provider.dart';
import 'package:cars/features/home/presentation/view/more_info_view.dart';
import 'package:cars/features/home/presentation/view/previos_car_view.dart';
import 'package:cars/features/home/presentation/view/recommended_for_you_bloc_provider.dart';
import 'package:cars/features/home/presentation/view_model/recommendation_feature_cubit/recommendation_feature_cubit.dart';
import 'package:cars/features/location/presentation/view/search_location_view.dart';
import 'package:cars/features/nav/presentation/view/nav_view.dart';
import 'package:cars/features/nav/presentation/view_model/nav_cubit/nav_bar_cubit.dart';
import 'package:cars/features/notifications/presentation/view/notifications_view.dart';
import 'package:cars/features/profile/data/repos/profile_repo_impl.dart';
import 'package:cars/features/profile/domain/use_cases/user_verification_use_case.dart';
import 'package:cars/features/profile/presentation/manager/verification_cubit/verification_cubit.dart';
import 'package:cars/features/search/domain/use_cases/body_type_filter_use_case.dart';
import 'package:cars/features/search/domain/use_cases/delete_recent_search_use_case.dart';
import 'package:cars/features/search/domain/use_cases/get_brands_use_case.dart';
import 'package:cars/features/search/domain/use_cases/recent_search_use_case.dart';
import 'package:cars/features/search/domain/use_cases/search_use_case.dart';
import 'package:cars/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:cars/features/search/presentation/view/filter_view.dart';
import 'package:cars/features/search/presentation/view/search_view.dart';
import 'package:cars/features/settings/presentation/view/settings_view.dart';
import 'package:cars/features/settings/presentation/view_model/settings_cubit/setting_cubit.dart';
import 'package:cars/features/sign_in_security/data/repos/sign_in_and_security_repo_impl.dart';
import 'package:cars/features/sign_in_security/domain/use_cases/check_code_input_use_case.dart';
import 'package:cars/features/sign_in_security/domain/use_cases/update_email_use_case.dart';
import 'package:cars/features/sign_in_security/domain/use_cases/update_password_use_case.dart';
import 'package:cars/features/sign_in_security/domain/use_cases/verify_email_use_case.dart';
import 'package:cars/features/sign_in_security/presentation/controllers/sign_in_and_security_cubit/sign_in_security_cubit.dart';
import 'package:cars/features/sign_in_security/presentation/controllers/two_step_verification_cubit/two_step_verification_cubit.dart';
import 'package:cars/features/sign_in_security/presentation/screens/change_email_view.dart';
import 'package:cars/features/sign_in_security/presentation/screens/password_view.dart';
import 'package:cars/features/sign_in_security/presentation/screens/sign_in_security_view.dart';
import 'package:cars/features/sign_in_security/presentation/screens/two_step_verifi/two_step_verifi_view.dart';
import 'package:cars/features/sign_in_security/presentation/screens/two_step_verifi/two_step_verification_code.dart';
import 'package:cars/features/sign_in_security/presentation/screens/two_step_verifi/two_step_verification_security_view.dart';
import 'package:cars/features/sign_in_security/presentation/screens/verification_email_view.dart';
import 'package:cars/features/splash/presentation/view/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/on_boarding/presentation/view/on_boarding_view.dart';
import '../../features/profile/presentation/view/verification_verify_loading_view.dart';
import '../../features/profile/presentation/view/verification_view.dart';
import '../../features/profile/presentation/view/verification_welcome_view.dart';
import '../../features/search/data/repos/search_repo_impl.dart';
import '../../features/search/domain/use_cases/search_filter_use_case.dart';
import '../../features/sign_in_security/presentation/screens/email_address_view.dart';
import '../helper/custom_animation.dart';

const String splashPath = '/';
const String gatePath = '/gate';
const String boardPath = '/board';
const String loginPath = '/loginPath';
const String createAccountPath = '/createAccountPath';
const String resetPassPath = '/ResetPassPath';
const String createNewPass = '/CreateNewPassPath';
const String navPath = '/navPath';
const String homePath = '/home';
const String bestOffersPath = '/bestOffersPath';
const String recommendedForYouPath = '/recommendedForYou';
const String createPassPath = '/CreatePassPath';
const String favouritesPath = '/favouritesPath';
const String searchPath = '/searchPath';
const String locationPath = '/locationPath';
const String carDetailsPath = '/carDetailsPath';
const String chatPath = '/chatPath';
const String filterPath = '/filterPath';
const String chatSupportPath = '/chatSupportPath';
const String editProfilePath = '/editProfilePath';
const String settingsPath = '/settingsPath';
const String notificationPath = '/notificationPath';
const String faqPath = '/faqPath';
const String verificationWelcomePath = '/verificationWelcomePath';
const String verificationPath = '/verificationPath';
const String verificationVerifyLoadingPath = '/verificationVerifyLoadingPath';
const String signInSecurityPath = '/signInSecurityPath';
const String emailAddressPath = '/emailAddressPath';
const String changePasswordPath = '/changePasswordPath';
const String twoStepVerificationPath = '/twoStepVerificationPath';
const String changeEmailAddressPath = '/changeEmailAddressPath';
const String verificationEmailPath = '/verificationEmailPath';
const String verificationPhonePath = '/verificationPhonePath';
const String changePhonePath = '/changePhonePath';
const String twoStepVerificationCodePath = '/twoStepVerificationCodePath';
const String twoStepVerificationSecurityPath =
    '/twoStepVerificationSecurityPath';
const String deleteAccountPath = '/deleteAccount';
const String deleteAccountVerifiPath = '/deleteAccountVerifi';
const String deleteAccountCodePath = '/deleteAccountCode';
const String areYouSureDeletePath = '/areYouSureDeletePath';
const String moreInfoPath = '/moreInfoPath';
const String prevCarPath = '/prev_car_path';
// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: moreInfoPath,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => RecommendationFeatureCubit(
              GetModelBrandUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
              UserInfoUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
              PreviousCarUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
            ),
          ),
          BlocProvider(
            create: (context) => SearchCubit(
              GetRecentSearchUseCase(
                searchRepo: getIt.get<SearchRepoImpl>(),
              ),
              SearchUseCase(
                searchRepo: getIt.get<SearchRepoImpl>(),
              ),
              DeleteRecentSearchUseCase(
                searchRepo: getIt.get<SearchRepoImpl>(),
              ),
              SearchFilterUseCase(
                searchRepo: getIt.get<SearchRepoImpl>(),
              ),
              BodyTypeFilterUseCase(
                searchRepo: getIt.get<SearchRepoImpl>(),
              ),
              GetBrandsUseCase(
                searchRepo: getIt.get<SearchRepoImpl>(),
              ),
            ),
          ),
        ],
        child: const MoreInfoView(),
      ),
    ),
    GoRoute(
      path: prevCarPath,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => RecommendationFeatureCubit(
              GetModelBrandUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
              UserInfoUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
              PreviousCarUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
            ),
          ),
          BlocProvider(
            create: (context) => SearchCubit(
              GetRecentSearchUseCase(
                searchRepo: getIt.get<SearchRepoImpl>(),
              ),
              SearchUseCase(
                searchRepo: getIt.get<SearchRepoImpl>(),
              ),
              DeleteRecentSearchUseCase(
                searchRepo: getIt.get<SearchRepoImpl>(),
              ),
              SearchFilterUseCase(
                searchRepo: getIt.get<SearchRepoImpl>(),
              ),
              BodyTypeFilterUseCase(
                searchRepo: getIt.get<SearchRepoImpl>(),
              ),
              GetBrandsUseCase(
                searchRepo: getIt.get<SearchRepoImpl>(),
              ),
            ),
          ),
        ],
        child: const PreviousCarView(),
      ),
    ),
    GoRoute(
      path: splashPath,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: gatePath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const GateView(),
      ),
    ),
    GoRoute(
      path: loginPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const LoginViewBlocProvider(),
      ),
    ),
    GoRoute(
      path: resetPassPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const ResetPassViewBlocProvider(),
      ),
    ),
    GoRoute(
      path: createAccountPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const CreateAccountBlocProviderView(),
      ),
    ),
    GoRoute(
      path: createPassPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const CreatePassView(),
      ),
    ),
    GoRoute(
      path: boardPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const OnBoardingView(),
      ),
    ),
    GoRoute(
      path: navPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: BlocProvider(
          create: (_) => NavBarCubit(),
          child: const NavView(),
        ),
      ),
    ),
    GoRoute(
      path: homePath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const HomeViewBlocProvider(),
      ),
    ),
    GoRoute(
      path: bestOffersPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const BlocProviderBestOffersView(),
      ),
    ),
    GoRoute(
      path: recommendedForYouPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const RecommendedForYouView(),
      ),
    ),
    GoRoute(
      path: chatPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const ChatView(),
      ),
    ),
    GoRoute(
      path: chatSupportPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const ChatSupportView(),
      ),
    ),
    GoRoute(
      path: faqPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const FaqView(),
      ),
    ),
    GoRoute(
      path: favouritesPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const FavouritesViewBlocProvider(),
      ),
    ),
    GoRoute(
      path: searchPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const SearchView(),
      ),
    ),
    GoRoute(
      path: filterPath,
      pageBuilder: (context, state) {
        List<CarEntity> cars = state.extra as List<CarEntity>;
        return buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: FilterView(cars: cars),
        );
      },
    ),
    GoRoute(
      path: locationPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const SearchLocationView(),
      ),
    ),
    GoRoute(
      path: carDetailsPath,
      pageBuilder: (context, state) {
        CarEntity carEntity = state.extra as CarEntity;
        return buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: BlocProvider(
            create: (_) => ChangedCarsoulCubit(),
            child: CarDetailsBlocProviderView(
              carEntity: carEntity,
            ),
          ),
        );
      },
    ),
    GoRoute(
      path: editProfilePath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const EditProfileView(),
      ),
    ),
    GoRoute(
      path: settingsPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: BlocProvider(
          create: (_) => SettingCubit(),
          child: const SettingsView(),
        ),
      ),
    ),
    GoRoute(
      path: notificationPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const NotificationsView(),
      ),
    ),
    GoRoute(
      path: verificationWelcomePath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const VerificationWelcomeView(),
      ),
    ),
    GoRoute(
      path: verificationPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: BlocProvider(
          create: (_) => VerificationCubit(
            UserVerificationUseCase(
              profileRepo: getIt.get<ProfileRepoImpl>(),
            ),
          ),
          child: const VerificationView(),
        ),
      ),
    ),
    GoRoute(
      path: verificationVerifyLoadingPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: BlocProvider(
          create: (_) => VerificationCubit(
            UserVerificationUseCase(
              profileRepo: getIt.get<ProfileRepoImpl>(),
            ),
          ),
          child: const VerificationVerifyLoadingView(),
        ),
      ),
    ),
    GoRoute(
      path: signInSecurityPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const SignInSecurityView(),
      ),
    ),
    GoRoute(
      path: emailAddressPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: BlocProvider(
          create: (context) => SignInSecurityCubit(
            VerifyEmailUseCase(
              signInAndSecurityRepo: getIt.get<SignInAndSecurityRepoImpl>(),
            ),
            UpdatePasswordUseCase(
              signInAndSecurityRepo: getIt.get<SignInAndSecurityRepoImpl>(),
            ),
            UpdateEmailUseCase(
              signInAndSecurityRepo: getIt.get<SignInAndSecurityRepoImpl>(),
            ),
            CheckCodeInputUseCase(
              signInAndSecurityRepo: getIt.get<SignInAndSecurityRepoImpl>(),
            ),
          ),
          child: const EmailAddressView(),
        ),
      ),
    ),
    GoRoute(
      path: changePasswordPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: BlocProvider(
          create: (context) => SignInSecurityCubit(
            VerifyEmailUseCase(
              signInAndSecurityRepo: getIt.get<SignInAndSecurityRepoImpl>(),
            ),
            UpdatePasswordUseCase(
              signInAndSecurityRepo: getIt.get<SignInAndSecurityRepoImpl>(),
            ),
            UpdateEmailUseCase(
              signInAndSecurityRepo: getIt.get<SignInAndSecurityRepoImpl>(),
            ),
            CheckCodeInputUseCase(
              signInAndSecurityRepo: getIt.get<SignInAndSecurityRepoImpl>(),
            ),
          ),
          child: const PasswordView(),
        ),
      ),
    ),
    GoRoute(
      path: twoStepVerificationPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: BlocProvider(
          create: (_) => TwoStepVerificationCubit(),
          child: const TwoStepVerificationView(),
        ),
      ),
    ),
    GoRoute(
      path: verificationEmailPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: BlocProvider(
          create: (context) => SignInSecurityCubit(
            VerifyEmailUseCase(
              signInAndSecurityRepo: getIt.get<SignInAndSecurityRepoImpl>(),
            ),
            UpdatePasswordUseCase(
              signInAndSecurityRepo: getIt.get<SignInAndSecurityRepoImpl>(),
            ),
            UpdateEmailUseCase(
              signInAndSecurityRepo: getIt.get<SignInAndSecurityRepoImpl>(),
            ),
            CheckCodeInputUseCase(
              signInAndSecurityRepo: getIt.get<SignInAndSecurityRepoImpl>(),
            ),
          ),
          child: const VerificationEmailView(),
        ),
      ),
    ),
    GoRoute(
      path: changeEmailAddressPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: BlocProvider(
          create: (context) => SignInSecurityCubit(
            VerifyEmailUseCase(
              signInAndSecurityRepo: getIt.get<SignInAndSecurityRepoImpl>(),
            ),
            UpdatePasswordUseCase(
              signInAndSecurityRepo: getIt.get<SignInAndSecurityRepoImpl>(),
            ),
            UpdateEmailUseCase(
              signInAndSecurityRepo: getIt.get<SignInAndSecurityRepoImpl>(),
            ),
            CheckCodeInputUseCase(
              signInAndSecurityRepo: getIt.get<SignInAndSecurityRepoImpl>(),
            ),
          ),
          child: const ChangeEmailView(),
        ),
      ),
    ),
    GoRoute(
      path: twoStepVerificationCodePath,
      pageBuilder: (context, state) {
        String title = state.extra as String;
        return buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: TwoStepVerificationCodeView(title: title),
        );
      },
    ),
    GoRoute(
      path: twoStepVerificationSecurityPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: BlocProvider(
          create: (_) => TwoStepVerificationCubit(),
          child: const TwoStepVerificationSecurityView(),
        ),
      ),
    ),
    GoRoute(
      path: deleteAccountPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const DeleteAccountView(),
      ),
    ),
    GoRoute(
      path: deleteAccountPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const DeleteAccountView(),
      ),
    ),
    GoRoute(
      path: deleteAccountCodePath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const DeleteAccountCodeView(),
      ),
    ),
    GoRoute(
      path: deleteAccountVerifiPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const DeleteAccountVerifiyView(),
      ),
    ),
    GoRoute(
      path: areYouSureDeletePath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const AreYouSureDeleteAccountView(),
      ),
    ),
  ],
);

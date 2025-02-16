import 'package:clean_note_app/core/route/route_name.dart';
import 'package:clean_note_app/features/auth/common_auth/presentation/provider/auth_provider.dart';
import 'package:clean_note_app/features/auth/common_auth/presentation/ui/auth_screen.dart';
import 'package:clean_note_app/features/home/presentation/ui/home_screen.dart';
import 'package:clean_note_app/features/search/presentation/ui/search_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider).isAuthuthenticated;
  final isEmailVerified = ref.watch(authProvider).user?.emailVerifiedAt != null;

  return GoRouter(
    initialLocation: '/auth',
    redirect: (context, state) {

      final isGoingToAuth = state.matchedLocation == '/auth';

      if (authState && isEmailVerified && isGoingToAuth) {
        return '/home';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/auth',
        name: authRoute,
        builder: (context, state) => const AuthScreen(),
      ),
      GoRoute(
        path: '/home',
        name: homeRoute,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/search',
        name: searchRoute,
        builder: (context, state) => const SearchScreen(),
      ),
    ],
  );
});

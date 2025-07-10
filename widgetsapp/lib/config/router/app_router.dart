import 'package:go_router/go_router.dart';
import 'package:widgetsapp/views/screens/screens.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: HomeScreen.routeName,
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      name: ButtonsScreen.routeName,
      path: '/buttons',
      builder: (context, state) => ButtonsScreen(),
    ),
    GoRoute(
      name: CardsScreen.routeName,
      path: '/cards',
      builder: (context, state) => CardsScreen(),
    ),
    GoRoute(
      name: ProgressScreen.routeName,
      path: '/progress',
      builder: (context, state) => ProgressScreen(),
    ),
    GoRoute(
      name: SnackbarScreen.routeName,
      path: '/snackbars',
      builder: (context, state) => SnackbarScreen(),
    ),
    GoRoute(
      name: AnimatedScreen.routeName,
      path: '/animations',
      builder: (context, state) => AnimatedScreen(),
    ),
  ],
);
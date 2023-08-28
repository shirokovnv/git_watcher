import 'package:git_watcher/providers.dart';
import '../data/repo/mock_prefs_repo.dart';
import '../data/repo/mock_trends_repo.dart';
import '../data/repo/mock_users_repo.dart';

Providers mockProviders =
    Providers(MockPrefsRepo(), MockUsersRepo(), MockTrendsRepo());

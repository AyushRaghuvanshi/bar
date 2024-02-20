import 'package:bar/app/features/homepage/service/local/local_service.dart';
import 'package:bar/app/features/homepage/service/remote/remote_service.dart';

///[HomePageService] implements abstraction over [HomePageLocalService] and [RemoteService].
///
///User only needs to use this class.
class HomePageService {
  HomePageLocalService local = HomePageLocalService();
  HomePageRemoteService remote = HomePageRemoteService();
}

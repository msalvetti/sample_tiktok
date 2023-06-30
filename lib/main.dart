import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/theme/app_theme.dart';
import 'package:toktik/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:toktik/presentation/discover/discover_screen.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';

import 'infrastructure/repositories/video_posts_repository_impl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final videoPostReposity =
        VideoPostRepositoryImpl(videoPostDatasource: LocalVideoDatasource());
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy: false,
            create: (_) =>
                DiscoverProvider(videoPostRepository: videoPostReposity)
                  ..loadNextPage()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        title: 'TokTik App',
        home: const DiscoverScreen(),
      ),
    );
  }
}

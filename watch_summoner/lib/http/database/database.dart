import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:watch_summoner/http/database/dao/daoSummonerFavorite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'summoner.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(SummonerFavoriteDAO.tableSQL);
    },
    version: 1,
    onDowngrade: onDatabaseDowngradeDelete,
  );
}
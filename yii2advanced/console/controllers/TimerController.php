<?php
namespace console\controllers;

use Yii;
use yii\console\Controller;
use console\models\MigrationDb;

/**
 * 定时任务
 * @author mo
 *
 */
class TimerController extends Controller
{
    public function actionMigrationdb()
    {
        $Migrate = new MigrationDb();
        // 获取迁移目录路径 console/migrations/
        $dirName = Yii::getAlias('@console').'/migrations';
        // 先删除该路径下已生成的所有文件
        $Migrate->deleteFile($dirName);
        // 获取所有表名 开始循环获取表字段信息，创建迁移
        $db = Yii::$app->getDb();
        $tablesName = $db->getSchema()->getTableNames();
        foreach($tablesName as $key => $value)
        {
            $tablesInfo = $db->getSchema()->getTableSchema($value);
            exec("yii migrate/create create_".$value, $info);
        }
    }
}
<?php
namespace console\models;

use yii\base\Model;

class MigrationDb extends Model
{
	/**
	*	删除该目录下的所有文件及文件夹
	*	@dirName 路径名
	*/
	public static function deleteFile($dirName)
    {
        if($handle = opendir($dirName))
        {
            while(false != ($item = readdir($handle)))
            {
                if($item != '.' && $item != '..')
                {
                    if(is_dir($dirName."/".$item))
                    {
                        self::deleteFile($dirName."/".$item);
                    }else
                    {
                        unlink($dirName.'/'.$item);
                    }
                }
            }
            closedir($handle);
        }
    }
}
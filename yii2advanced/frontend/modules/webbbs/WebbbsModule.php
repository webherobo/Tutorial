<?php

namespace app\modules\webbbs;

/**
 * webbbs module definition class
 */
class WebbbsModule extends \yii\base\Module
{
    /**
     * {@inheritdoc}
     */
    public $controllerNamespace = 'app\modules\webbbs\controllers';

    /**
     * {@inheritdoc}
     */
    public function init()
    {
        parent::init();

        // custom initialization code goes here
        // 从config.php加载配置来初始化模块
        \Yii::configure($this, require(__DIR__ . '/config.php'));
		
    }
}

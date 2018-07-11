<?php

namespace app\modules\webbbs\controllers;

use yii\web\Controller;
use common\models\MessageBoard;
use common\models\MessageBoardQuery;

/**
 * Default controller for the `webbbs` module
 */
class DefaultController extends Controller
{
    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionIndex()
    {
        return $this->render('index');
    }
	
    public function actionMessageBoard()
    {
		
		$messageModel= new MessageBoard;
        return $this->render('message-board',["model"=>$messageModel]);
    }
	
	
}

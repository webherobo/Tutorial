<?php

namespace common\models;

/**
 * This is the ActiveQuery class for [[MessageBoard]].
 *
 * @see MessageBoard
 */
class MessageBoardQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * {@inheritdoc}
     * @return MessageBoard[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * {@inheritdoc}
     * @return MessageBoard|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}

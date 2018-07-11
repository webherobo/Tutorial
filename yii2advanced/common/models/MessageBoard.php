<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%message_board}}".
 *
 * @property int $id 留言表
 * @property int $pid 父id 0为留言 否则为回复留言id
 * @property int $cate_type 分类类型标识
 * @property int $cate_id 分组、分类id
 * @property int $fromid 留言的主人
 * @property int $toid 对方的ID
 * @property string $sender_name 留言发送者
 * @property string $sender_useravatar
 * @property string $receiver_name 留言接收者
 * @property string $receiver_useravatar
 * @property int $type 留言类型（1普通消息、0系统消息）
 * @property int $msgtype 1:公告 Announce 2:提醒 Remind 3:私信 Message
 * @property string $title 留言标题
 * @property string $content 留言内容
 * @property string $send_time 发送时间
 * @property string $read_time 阅读时间
 * @property int $status 留言状态(0未读1:已读)
 * @property int $is_del 是否 删除 默认0  删除1
 */
class MessageBoard extends \yii\db\ActiveRecord
{
	public $verifyCode;
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%message_board}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['pid', 'cate_type', 'cate_id', 'fromid', 'toid', 'type', 'msgtype', 'status', 'is_del'], 'integer'],
            [['content'], 'string'],
            [['send_time', 'read_time'], 'safe'],
            [['sender_name', 'receiver_name'], 'string', 'max' => 64],
            [['sender_useravatar', 'receiver_useravatar', 'title'], 'string', 'max' => 255],
			["verifyCode","captcha"]
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', '留言表'),
            'pid' => Yii::t('app', '父id 0为留言 否则为回复留言id'),
            'cate_type' => Yii::t('app', '分类类型标识'),
            'cate_id' => Yii::t('app', '分组、分类id'),
            'fromid' => Yii::t('app', '留言的主人'),
            'toid' => Yii::t('app', '对方的ID'),
            'sender_name' => Yii::t('app', '留言发送者'),
            'sender_useravatar' => Yii::t('app', 'Sender Useravatar'),
            'receiver_name' => Yii::t('app', '留言接收者'),
            'receiver_useravatar' => Yii::t('app', 'Receiver Useravatar'),
            'type' => Yii::t('app', '留言类型（1普通消息、0系统消息）'),
            'msgtype' => Yii::t('app', '1:公告 Announce 2:提醒 Remind 3:私信 Message'),
            'title' => Yii::t('app', '留言标题'),
            'content' => Yii::t('app', '留言内容'),
            'send_time' => Yii::t('app', '发送时间'),
            'read_time' => Yii::t('app', '阅读时间'),
            'status' => Yii::t('app', '留言状态(0未读1:已读)'),
            'is_del' => Yii::t('app', '是否 删除 默认0  删除1'),
			'verifyCode' => Yii::t('app', '验证码'),
        ];
    }

    /**
     * {@inheritdoc}
     * @return MessageBoardQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new MessageBoardQuery(get_called_class());
    }
}

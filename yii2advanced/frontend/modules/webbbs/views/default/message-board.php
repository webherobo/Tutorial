<?php
use yii\helpers\Url;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\captcha\Captcha;

/* @var $this yii\web\View */
/* @var $model common\models\MessageBoard */
/* @var $form ActiveForm */
?>
<div class="default-message-board">

    <?php $form = ActiveForm::begin(); ?>

        <?= $form->field($model, 'pid') ?>
        <?= $form->field($model, 'cate_type') ?>
        <?= $form->field($model, 'cate_id') ?>
        <?= $form->field($model, 'fromid') ?>
        <?= $form->field($model, 'toid') ?>
        <?= $form->field($model, 'type') ?>
        <?= $form->field($model, 'msgtype') ?>
        <?= $form->field($model, 'status') ?>
        <?= $form->field($model, 'is_del') ?>
        <?= $form->field($model, 'content') ?>
        <?= $form->field($model, 'send_time') ?>
        <?= $form->field($model, 'read_time') ?>
        <?= $form->field($model, 'sender_name') ?>
        <?= $form->field($model, 'receiver_name') ?>
		<?= Html::img('@web/images/gw-bg.jpg', ['alt' => 'My logo','width'=>86]) ?>
        <?= $form->field($model, 'sender_useravatar')->textInput(['value'=>Url::to('@web/images/gw-bg.jpg')])  ?>
        <?= $form->field($model, 'receiver_useravatar')->textInput(['value'=>Url::to('@web/images/gw-bg.jpg')]) ?>
        <?= $form->field($model, 'title') ?>
		<?= $form->field($model, 'verifyCode')->widget(Captcha::className(), [
                    'template' => '<div class="row"><div class="col-lg-1">{image}</div><div class="col-lg-9">{input}</div></div>',
					'captchaAction' => '/site/captcha',
                ]) ?>
    
        <div class="form-group">
            <?= Html::submitButton(Yii::t('app', 'Submit'), ['class' => 'btn btn-primary']) ?>
        </div>
    <?php ActiveForm::end(); ?>

</div><!-- default-message-board -->
<?php $this->beginBlock("message") ?>
$(function () {
    //解决验证码不刷新的问题
    changeVerifyCode();
    $('#messageboard-msgtype-image').click(function () {
        changeVerifyCode();
    });
});
//更改或者重新加载验证码
function changeVerifyCode() {
//项目URL
    $.ajax({
    //使用ajax请求site/captcha方法，加上refresh参数，接口返回json数据
        url: "<?= Url::toRoute(['/site/captcha', 'refresh' =>"true"]) ?>",
        dataType: 'json',
        cache: false,
        success: function (data) {
        //将验证码图片中的图片地址更换
            $("#messageboard-msgtype-image").attr('src', data['url']);
        }
    });
}
<?php $this->endBlock() ?>
<?php $this->registerJs($this->blocks["message"], \yii\web\View::POS_END); ?>



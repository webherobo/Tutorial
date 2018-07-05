<?php

use yii\db\Migration;

class m130524_201442_init extends Migration
{
    public function up()
    {
        $tableOptions = null;
        if ($this->db->driverName === 'mysql') {
            // http://stackoverflow.com/questions/766809/whats-the-difference-between-utf8-general-ci-and-utf8-unicode-ci
            $tableOptions = 'CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE=InnoDB';
        }

        $this->createTable('{{%user}}', [
            'id' => $this->primaryKey(),
            'username' => $this->string()->notNull()->unique(),
            'auth_key' => $this->string(32)->notNull(),
            'password_hash' => $this->string()->notNull(),
            'password_reset_token' => $this->string()->unique(),
            'email' => $this->string()->notNull()->unique(),

            'status' => $this->smallInteger()->notNull()->defaultValue(10),
            'created_at' => $this->integer()->notNull(),
            'updated_at' => $this->integer()->notNull(),
        ], $tableOptions);
    }

    public function down()
    {
        $this->dropTable('{{%user}}');
    }
	
	public function safeUp()  
	{  
		$tableOptions = null;  
		if ($this->db->driverName === 'mysql') {  
			// http://stackoverflow.com/questions/766809/whats-the-difference-between-utf8-general-ci-and-utf8-unicode-ci  
			$tableOptions = 'CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE=InnoDB';  
		}  
		$this->createTable('{{%admin}}', [  
			'id' => Schema::TYPE_PK,  
			'username' => Schema::TYPE_STRING . ' NOT NULL',  
			'auth_key' => Schema::TYPE_STRING . '(32) NOT NULL',    
			'password_hash' => Schema::TYPE_STRING . ' NOT NULL', //密码  
			'password_reset_token' => Schema::TYPE_STRING,  
			'email' => Schema::TYPE_STRING . ' NOT NULL',  
			'role' => Schema::TYPE_SMALLINT . ' NOT NULL DEFAULT 10',  
			'status' => Schema::TYPE_SMALLINT . ' NOT NULL DEFAULT 10',  
			'created_at' => Schema::TYPE_INTEGER . ' NOT NULL',  
			'updated_at' => Schema::TYPE_INTEGER . ' NOT NULL',  
		], $tableOptions);  
		  
		$this->createIndex('username', '{{%admin}}', ['username'],true);  
		$this->createIndex('email', '{{%admin}}', ['email'],true);  
	}  
	public function safeDown()  
	{  
		$this->dropTable('{{%admin}}');  
	} 
}

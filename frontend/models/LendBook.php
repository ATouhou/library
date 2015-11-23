<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%lend_book}}".
 *
 * @property integer $id
 * @property integer $book_id
 * @property string $name
 * @property string $email
 * @property string $phone
 * @property string $address
 * @property string $lendingDate
 * @property string $returningDate
 */
class LendBook extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%lend_book}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            //[['book_id', 'name', 'email', 'phone', 'address', 'lendingDate', 'returningDate'], 'required'],
            [['book_id'], 'integer'],
            [['lendingDate', 'returningDate'], 'safe'],
            [['name', 'email'], 'string', 'max' => 100],
            [['phone'], 'string', 'max' => 20],
            [['address'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'book_id' => 'Book ID',
            'name' => 'Name',
            'email' => 'Email',
            'phone' => 'Phone',
            'address' => 'Address',
            'lendingDate' => 'Lending Date',
            'returningDate' => 'Returning Date',
        ];
    }
	
	public static function getBookList()
	{
		$connection = \Yii::$app->db;
		
		$model = $connection->createCommand('SELECT tbl_lend_book.*, tbl_book.title AS bookName FROM tbl_lend_book JOIN tbl_book ON tbl_lend_book.book_id = tbl_book.id');
		
		$list = $model->queryAll();
		return $list;
	}
	
	
}

<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%bookcategory}}".
 *
 * @property integer $cat_id
 * @property string $cat_name
 * @property integer $shelf_id
 */
class Bookcategory extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%bookcategory}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cat_name'], 'required'],
            [['shelf_id'], 'integer'],
            [['cat_name'], 'string', 'max' => 155]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'cat_id' => Yii::t('app', 'Cat ID'),
            'cat_name' => Yii::t('app', 'Cat Name'),
            'shelf_id' => Yii::t('app', 'Shelf ID'),
        ];
    }
}

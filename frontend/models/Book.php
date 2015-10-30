<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%book}}".
 *
 * @property integer $id
 * @property string $title
 * @property string $description
 * @property string $author
 * @property string $publisher
 * @property integer $year
 */
class Book extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%book}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'author', 'description','publisher', 'year'], 'required'],
            [['description'], 'string'],
            [['year'], 'integer'],
            [['title'], 'string', 'max' => 255],
            [['author', 'publisher'], 'string', 'max' => 50]
        ];
    }

    /**
     * @inheritdoc
     */
  /*  public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'title' => Yii::t('app', 'Title'),
            'description' => Yii::t('app', 'Description'),
            'author' => Yii::t('app', 'Author'),
            'publisher' => Yii::t('app', 'Publisher'),
            'year' => Yii::t('app', 'Year'),
        ];
    }*/
}

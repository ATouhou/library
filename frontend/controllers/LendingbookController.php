<?php

namespace frontend\controllers;

use Yii;
use app\models\Book;
use app\models\BookSearch;
use app\models\LendBook;
use yii\filters\ContentNegotiator;
use yii\web\Response;
use yii\filters\AccessControl;
use yii\rest\Controller;
use yii\filters\auth\HttpBearerAuth;
use yii\web\NotFoundHttpException;

/**
 * BookController implements the CRUD actions for Book model.
 */
class LendingbookController extends Controller
{
     public function behaviors()
     {
        $behaviors = parent::behaviors();
        $behaviors['authenticator'] = [
            'class' => HttpBearerAuth::className(),
            'only' => ['index'],
        ];
        $behaviors['contentNegotiator'] = [
            'class' => ContentNegotiator::className(),
            'formats' => [
                'application/json' => Response::FORMAT_JSON,
            ],
        ];
        $behaviors['access'] = [
            'class' => AccessControl::className(),
            'only' => ['index'],
            'rules' => [
                [
                    'actions' => ['index'],
                    'allow' => true,
                    'roles' => ['@'],
                ],
            ],
        ];
        return $behaviors;
      }

    
	public function actionIndex()
	{
		$model = LendBook::getBookList();
		return $model;
	}
	
	
	public function actionGetbookbyid($id)
    {
		$query = LendBook::findOne($id);
         return $query;
       
    }
	
	
	public function actionCreate()
	{
		$model = new LendBook();
        $model->attributes = Yii::$app->request->post();
        //$model->book_id = implode(",",$model['book_id']);
        $model->lendingDate = date('Y-m-d');
        $model->returningDate = date('Y-m-d',strtotime($model->returningDate));
        
		if ($model->save()) {				
			return [
				'error'=>false,
				'data'=>$model
			];
		}else{
			return [
				'error'=>true,
				'data'=>$model->errors
			];
		}
		
		
		
		/* if ( $model->save()) {
            return $model;
        } else {
            return $model;
        } */
	}
	
	public function actionUpdate($id)
	{
		$model = LendBook::findOne($id);
        $model->attributes = Yii::$app->request->post();  
		$model->returningDate = date('Y-m-d',strtotime($model->returningDate));
		if ($model->save()) {				
			return [
				'error'=>false,
				'data'=>$model
			];
		}else{
			return [
				'error'=>true,
				'data'=>$model->errors
			];
		}
	}
	
	public function actionDelete($id)
	{
		$delete = LendBook::findOne($id)->delete();
	}

    
}

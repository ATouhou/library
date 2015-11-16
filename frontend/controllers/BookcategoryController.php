<?php

namespace frontend\controllers;

use Yii;
use app\models\Bookcategory;
use app\models\BookCatSearch;
use yii\filters\ContentNegotiator;
use yii\web\Response;
use yii\filters\AccessControl;
use yii\rest\Controller;
use yii\filters\auth\HttpBearerAuth;
use yii\web\NotFoundHttpException;


/**
 * BookcategoryController implements the CRUD actions for Bookcategory model.
 */
class BookcategoryController extends Controller
{
    public function behaviors()
     {
        $behaviors = parent::behaviors();
        $behaviors['authenticator'] = [
            'class' => HttpBearerAuth::className(),
            'only' => ['create','getcatbyid'],
        ];
        $behaviors['contentNegotiator'] = [
            'class' => ContentNegotiator::className(),
            'formats' => [
                'application/json' => Response::FORMAT_JSON,
            ],
        ];
        $behaviors['access'] = [
            'class' => AccessControl::className(),
            'only' => ['create','getcatbyid'],
            'rules' => [
                [
                    'actions' => ['create','getcatbyid'],
                    'allow' => true,
                    'roles' => ['@'],
                ],
            ],
        ];
        return $behaviors;
      }

    /**
     * Lists all Bookcategory models.
     * @return mixed
     */
     public function actionGetbookscategories()
     {
        $searchModel = new BookCatSearch();
       
        return $searchModel->search(null);
     }

    /**
     * Displays a single Bookcategory model.
     * @param integer $id
     * @return mixed
     */
   
     public function actionGetcatbyid($id)
     {
        $searchModel = $this->findModel($id);
        
        return  $searchModel;
     }
     
    /**
     * Creates a new Bookcategory model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Bookcategory();
        $model->attributes = Yii::$app->request->post();
        if ($model->save()) {
			return [
				'error'=>false,
				'data'=>$model
				];
            //return $model;
        } else {
			return [
				'error'=>true,
				'data'=>$model->errors
				];
            //return $model->errors;
        }
    }

    /**
     * Updates an existing Bookcategory model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $model->attributes = Yii::$app->request->post();    
        if ($model->save()) {
            return $model;
        } else {
            return $model->errors;
        }
    }

    /**
     * Deletes an existing Bookcategory model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        //return $this->redirect(['index']);
    }

    /**
     * Finds the Bookcategory model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Bookcategory the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Bookcategory::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}

<?php

namespace frontend\controllers;

use Yii;
use app\models\Book;
use app\models\BookSearch;
use yii\filters\ContentNegotiator;
use yii\web\Response;
use yii\filters\AccessControl;
use yii\rest\Controller;
use yii\filters\auth\HttpBearerAuth;
use yii\web\NotFoundHttpException;

/**
 * BookController implements the CRUD actions for Book model.
 */
class BookController extends Controller
{
     public function behaviors()
     {
        $behaviors = parent::behaviors();
        $behaviors['authenticator'] = [
            'class' => HttpBearerAuth::className(),
            'only' => ['getbooks'],
        ];
        $behaviors['contentNegotiator'] = [
            'class' => ContentNegotiator::className(),
            'formats' => [
                'application/json' => Response::FORMAT_JSON,
            ],
        ];
        $behaviors['access'] = [
            'class' => AccessControl::className(),
            'only' => ['getbooks'],
            'rules' => [
                [
                    'actions' => ['getbooks'],
                    'allow' => true,
                    'roles' => ['@'],
                ],
            ],
        ];
        return $behaviors;
      }

    /**
     * Lists all Book models.
     * @return mixed
     */
    public function actionGetbooks()
    {
        $searchModel = new BookSearch();
        
        return $searchModel->search();
    }

    /**
     * Displays a single Book model.
     * @param integer $id
     * @return mixed
     */
    public function actionGetbookbyid($id)
    {
         return $this->findModel($id);
       
    }

    /**
     * Creates a new Book model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    /* public function actionCreate()
    {
        //print_r($_FILES);
       // print_r(Yii::$app->request->post());
       // exit;
        $model = new Book();
        $model->attributes = Yii::$app->request->post();
        $model->cat_id = implode(",",Yii::$app->request->post('cat_id'));
        if ( $model->save()) {
            return $model;
        } else {
            return $model;
        }
    } */
	
	public function actionCreate()
	{
		//echo Yii::$app->basePath;exit;
		$path = realpath( Yii::$app->basePath)."/images/";
		//$path = "localhost/library_software/frontend/images/";
		
		$model = new Book();
        $model->attributes = Yii::$app->request->post()['book'];
		//print_r($model);exit;
		
		//echo Yii::$app->request->post()['book']['cat_id'];exit;
        $model->cat_id = implode(",",$model['cat_id']);
		
		//print_r($model);exit;
		$image = $_FILES['file']['name'];
		$ext = end((explode(".", $image)));
		if($ext=='jpg' || $ext=='png' || $ext=='gif' || $ext=='jpeg'){
			$filename = Yii::$app->security->generateRandomString().".{$ext}";
			$model->cover_photo = $filename;
			
			if ($model->save()) {
				move_uploaded_file($_FILES['file']['tmp_name'], $path.'/'.$filename);
				
				return [
				'error'=>false,
				'data'=>$model
				];
			} else {
				return [
				'error'=>true,
				'data'=>$model->errors
				];

			}
		}else{
			return [
				'error'=>true,
				'data'=>['photo'=>'File type not allowed.']
				];
		}
		
		
		
		/* print_r($_FILES);
		print_r(Yii::$app->request->post()['book']);
		exit; */
	}

    /**
     * Updates an existing Book model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
     public function actionUpdate($id)
     {
        $model = $this->findModel($id);
        $model->attributes = Yii::$app->request->post();  
        @$model->cat_id = implode(",",Yii::$app->request->post('cat_id'));
        $response =[];  
        if ($model->save()) {
            
            $response['error'] = FALSE;
            $response['data'] = $model;
            return $response;
        } else {
            $response['error'] = true;
            $response['data'] = $model->errors;
            return $response;
        }
     }

    /**
     * Deletes an existing Book model.
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
     * Finds the Book model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Book the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Book::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}

<?php
use frontend\assets\AppAsset;

/* @var $this \yii\web\View */

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>" ng-app="app">
<head>
<meta charset="<?= Yii::$app->charset ?>">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title ng-bind="title">My Angular Yii Application</title>
<?php $this->head() ?>

<script>paceOptions = {ajax: {trackMethods: ['GET', 'POST']}};</script>
</head>
<body ng-controller="MainController">
<?php $this->beginBody() ?>
<div class="wrap">
    <nav class="navbar navbar-default navbar-fixed-top navbar-inner" role="navigation" bs-navbar>
        <div class="container">
            <div class="navbar-header">
                <button ng-init="navCollapsed = true" ng-click="navCollapsed = !navCollapsed" type="button" class="navbar-toggle" >
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span></button>
                <a class="navbar-brand" href="#/">My Company</a>
            </div>
            <div ng-class="!navCollapsed && 'in'" ng-click="navCollapsed=true" class="collapse navbar-collapse" >
                <ul class="navbar-nav navbar-right nav">
                    <li data-match-route="/dashboard" ng-show="loggedIn()" class="ng-hide">
                        <a href="#/dashboard">Dashboard</a>
                    </li>
                     <li class="dropdown" uib-dropdown>
                    <a role="button" class="dropdown-toggle" uib-dropdown-toggle>
                        Books <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                       <li data-match-route="book/create">
                        	<a href="#/book/create">Books</a>
                    	</li>
                        <li data-match-route="book/index">
                        	<a href="#/book/index">Manage Books</a>
                    	</li>
                    </ul>
                </li>
                    <li class="dropdown" uib-dropdown>
                    <a role="button" class="dropdown-toggle" uib-dropdown-toggle>
                        Book Category <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                       <li data-match-route="book/create_cat">
                        	<a href="#/book/create_cat">Book Category</a>
                    	</li>
                        <li data-match-route="book/categories">
                        	<a href="#/book/categories">Manage Books Category</a>
                    	</li>
                    </ul>
                </li>
                    <li data-match-route="/about">
                        <a href="#/about">About</a>
                    </li>
                    <li data-match-route="/contact">
                        <a href="#/contact">Contact</a>
                    </li>
                    
                    <li ng-class="{active:isActive('/logout')}" ng-show="loggedIn()" ng-click="logout()"  class="ng-hide">
                        <a href="">Logout</a>
                    </li>
                    <li data-match-route="/login" ng-hide="loggedIn()">
                        <a href="#/login">Login</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div ng-view class="animate"></div>
    </div>
</div>

<footer class="footer">
    <div class="container">
        <p class="pull-left">&copy; <a href="http://arrowsoft.co">Arrowsoft</a> <?= date('Y') ?></p>
        <p class="pull-right"> Arrowsoft</p>
    </div>
</footer>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
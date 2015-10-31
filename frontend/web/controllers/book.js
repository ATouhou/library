'use strict';
libApp_book.config(['$routeProvider', function($routeProvider) {
  $routeProvider
	.when('/book/index', {
		templateUrl: 'views/book/index.html',
		controller: 'index',
		title: 'Library Management'
	})
	.when('/book/categories', {
		templateUrl: 'views/book/view_categories.html',
		controller: 'catIndex'
	})
	.when('/book/create', {
		templateUrl: 'views/book/create.html',
		controller: 'create',
		resolve: {
			book: function(services, $route){
				return services.getBooks();
			}
        }
	})
	.when('/book/create_cat', {
		templateUrl: 'views/book/create_category.html',
		controller: 'createCat',
		resolve: {
			bookCat: function(services, $route){
				return services.getBooksCat();
			}
        }
	})
	.when('/book/update/:bookId', {
		templateUrl: 'views/book/update.html',
		controller: 'update',
		resolve: {
          book: function(services, $route){
            var bookId = $route.current.params.bookId + "?access-token=100-token";
            return services.getBook(bookId);
          }
        }
	})
	.when('/book/delete/:bookId', {
		templateUrl: 'views/book/index.html',
		controller: 'delete',
	})
	.otherwise({
		redirectTo: '/book/index'
	});
}]);
libApp_book.run(['$location', '$rootScope', function($location, $rootScope) {
    $rootScope.$on('$routeChangeSuccess', function (event, current, previous) {
        // test for current route
        if(current.$$route) {
            // Set current page title 
            $rootScope.title = current.$$route.title;
			
        }
		 // If there is a flash message set focus to it - trumps all focus
        if($rootScope.flashMsg != ""){
            $('#flash-message a').attr("tabIndex", 0).focus();
        }
    });
}]);

// Store and and queue flash messages used on save and create
libApp_book.factory("Flash", function($rootScope) {
    var queue = [];
    var currentMessage = "";
    $rootScope.flashMsg = currentMessage;

    $rootScope.$on("$viewContentLoaded", function() {
        currentMessage = queue.shift() || "";
    });

    return {
        setMessage: function(message,status) {
            queue.push(message);
            $rootScope.flashMsg = message;
			if(status){
				$rootScope.successCls = true;
				$rootScope.errorCls = false;
			}else{
				$rootScope.successCls = false;
				$rootScope.errorCls = true;
			}
        },
        getMessage: function() {
            return currentMessage;
        },
        clearMessage: function($event) {
            currentMessage = "";
            $rootScope.flashMsg = "";
            $event.preventDefault();
            $('h1').attr("tabIndex",-1).focus();
        },
    };
})



libApp_book.controller('index', ['$scope','$rootScope', '$http', 'services', 'Flash',
	function($scope,$rootScope,$http,services,Flash) {
	$scope.message = 'Everyone come and see how good I look!';
	$scope.successCls = $rootScope.successCls;
	$scope.errorCls = $rootScope.errorCls;
	$scope.flash = Flash;
	services.getBooks().then(function(data){
        $scope.books = data.data;
    });	
	$scope.deleteBook = function(bookID) {
		if(confirm("Are you sure to delete book number: " + bookID)==true && bookID>0){
			services.deleteBook(bookID);	
			$route.reload();
		}
	};
	 
}])
.controller('catIndex', ['$scope', '$http', 'services', 
	function($scope,$http,services) {
	$scope.message = 'Category list here';
	$scope.bookCatz = this;
	services.getBooksCat().then(function(data){
        $scope.bookCatz = data.data;
		
    });	
	
	$scope.deleteBook = function(bookID) {
		if(confirm("Are you sure to delete book number: " + bookID)==true && bookID>0){
			services.deleteBook(bookID);	
			$route.reload();
		}
	};
}])
.controller('create', ['$scope', '$http', 'services','$location','book',
	function($scope,$http,services,$location,book) {
	$scope.message = 'Look! I am an about page.';
	$scope.createBook = function(book) {
        var results = services.createBook(book);
		 
    }
	$scope.bookCatz = this;
	services.getBooksCat().then(function(data){
        $scope.bookCatz = data.data;
		
    });	
	  
}])
.controller('createCat', ['$scope', '$http', 'services','$location','bookCat', 
	function($scope,$http,services,$location,bookCat) {
	$scope.message = 'Add category';
	$scope.createCategory = function(bookCategory) {
        var results = services.createCategory(bookCategory);
    }  
}])
.controller('update', ['$scope', '$http', '$routeParams', 'services','$location','book', 
	function($scope,$http,$routeParams,services,$location,book) {
	$scope.message = 'Contact us! JK. This is just a demo.';
	var original = book.data;
	$scope.book = angular.copy(original);
	$scope.isClean = function() {
		return angular.equals(original, $scope.book);
	}
	$scope.updateBook = function(book) {	
        var results = services.updateBook(book);
    } 
}]);
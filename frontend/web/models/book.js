'use strict';
libApp_book.factory("services", ['$http','$location','$route', 'Flash',
	function($http,$location,$route,Flash) {
    var obj = {};
    obj.getBooks = function(){
        return $http.get('book/getbooks');
    }	
	obj.getBooksCat = function(){
        return $http.get('bookcategory/getbookscategories');
    }
	obj.createBook = function (book) {
		return $http.post( 'book/create', book )
			.then( successHandler )
			.catch( errorHandler );
		function successHandler( result ) {
			Flash.setMessage("Book added!",true);
			$location.path('/book/index')			
		}
		function errorHandler( result ){
			alert("Error data");
			Flash.setMessage("Book not saved!",false);
			$location.path('/book/index')
		}
	};
	obj.createCategory = function (bookCategory) {
		return $http.post( 'bookcategory/create', bookCategory )
			.then( successHandler )
			.catch( errorHandler );
		function successHandler( result ) {
			$location.path('/book/categories');			
		}
		function errorHandler( result ){
			alert("Error data")
			$location.path('bookcategory/create')
		}
	};		
	obj.getBook = function(bookID){
        return $http.get(serviceBase + 'books/' + bookID + "?access-token=100-token");
    }
	
	obj.updateBook = function (book) {
	    return $http.put(serviceBase + 'books/' + book.id + "access-token=100-token", book )
			.then( successHandler )
			.catch( errorHandler );
		function successHandler( result ) {
			$location.path('/book/index');
		}
		function errorHandler( result ){
			alert("Error data")
			$location.path('/book/update/' + book.id)
		}	
	};	
	obj.deleteBook = function (bookID) {
	    return $http.delete(serviceBase + 'books/' + bookID + "?access-token=100-token")
			.then( successHandler )
			.catch( errorHandler );
		function successHandler( result ) {
			$route.reload();
		}
		function errorHandler( result ){
			alert("Error data")
			$route.reload();
		}	
	};	
    return obj;   
}]);
'use strict';
libApp_book.factory("services", ['$http','$location','$route', 
	function($http,$location,$route) {
    var obj = {};
    obj.getBooks = function(){
        return $http.get('book/getbooks');
    }	
	obj.createBook = function (book) {
		return $http.post( 'book/create', book )
			.then( successHandler )
			.catch( errorHandler );
		function successHandler( result ) {
			$location.path('/book/index');			
		}
		function errorHandler( result ){
			alert("Error data")
			$location.path('/book/create')
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
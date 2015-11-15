'use strict';
libApp_book.factory("services", ['$http','$location','$route','$timeout', 'Flash','Upload',
	function($http,$location,$route,$timeout,Flash,Upload) {
    var obj = {};
    obj.getBooks = function(){
        return $http.get('book/getbooks');
    }	
	obj.getBooksCat = function(){
        return $http.get('bookcategory/getbookscategories');
    }
	obj.getBookCatById = function(catId){
        return $http.get('bookcategory/getcatbyid/?id='+catId);
    }
	obj.createBook = function (file,book) {
		
		file.upload = Upload.upload({
		url: 'book/imageupload', 
		method: 'POST',
		file: file,
		sendFieldsAs: 'form',
		fields: {
			book: book,
			//title: book.title,
			//description: book.description
		}
	});

    return file.upload.then(function (response) {
      $timeout(function () {
        file.result = response.data;
		$location.path('/book/index')	
      });
    }, function (response) {
      if (response.status > 0)
        $scope.errorMsg = response.status + ': ' + response.data;
    }, function (evt) {
      // Math.min is to fix IE which reports 200% sometimes
      file.progress = Math.min(100, parseInt(100.0 * evt.loaded / evt.total));
    });
		/*return $http.post( 'book/create', book )
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
		}*/
	};
	obj.createCategory = function (bookCategory) {
		return $http.post( 'bookcategory/create', bookCategory )
			.then( successHandler )
			.catch( errorHandler );
		function successHandler( result ) {
			Flash.setMessage("Book category added!",true);
			$location.path('/book/categories');			
		}
		function errorHandler( result ){
			alert("Error data");
			Flash.setMessage("Book category not saved!",true);
			$location.path('bookcategory/create')
		}
	};		
	obj.getBook = function(bookID){
        return $http.get('book/getbookbyid?id=' + bookID);
    }
	
	obj.updateBook = function (book) {
	    return $http.put('book/update/?id=' + book.id, book )
			.then( successHandler )
			.catch( errorHandler );
		function successHandler( result ) {
			console.log(result.data.error);
			console.log(result);
			if(!result.data.error)
			{
				Flash.setMessage("Book category updated!",true);
				$location.path('/book/index');
				
			}
			else{
				Flash.setMessage("Book category not updated!",false);
				$route.reload();
			}
			
		}
		function errorHandler( result ){
			alert("Error data")
			$location.path('/book/update/' + book.id)
		}	
	};
	obj.updateBookCat = function (bookCat) {
	    return $http.put('bookcategory/update/?id=' + bookCat.cat_id , bookCat )
			.then( successHandler )
			.catch( errorHandler );
		function successHandler( result ) {
			Flash.setMessage("Book category updated!",true);
			$location.path('/book/categories');
		}
		function errorHandler( result ){
			Flash.setMessage("Book category not updated!",false);
			$location.path('/book/updateCat/' + bookCat.id)
		}	
	};	
	obj.deleteBook = function (bookID) {
	    return $http.delete('book/delete/?id=' + bookID)
			.then( successHandler )
			.catch( errorHandler );
		function successHandler( result ) {
			Flash.setMessage("Book deleted!",true);
			$route.reload();
		}
		function errorHandler( result ){
			Flash.setMessage("Book can not be deleted!",false);
			$route.reload();
		}	
	};
	obj.deleteBookCat = function (bookCatID) {
	    return $http.post('bookcategory/delete/?id=' + bookCatID )
			.then( successHandler )
			.catch( errorHandler );
		function successHandler( result ) {
			Flash.setMessage("Book category deleted!",true);
			$route.reload();
		}
		function errorHandler( result ){
			Flash.setMessage("Book categorycan not be deleted!",false);
			$route.reload();
		}	
	};	
    return obj;   
}]);
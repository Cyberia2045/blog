//functions

function count(){
	var textLength= $("#body").val().length

	if(textLength>=140){
		$(".textcount").text("140/140")
	}else{
		$(".textcount").text(""+textLength+"/140")	
	}
}

function stop(){
	var txt= $("#body").val()
	var textLength= $("#body").val().length

	function counter(){
		$("#body").val(txt.substring(0,139))
		}
	counter()

	$("input").focus()
}

$(document).ready(function(){
	$("input").keyup(function(){
		count()
		stop()
		
	});

});
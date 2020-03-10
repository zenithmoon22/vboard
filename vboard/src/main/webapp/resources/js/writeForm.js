$(document).ready(function() {
	//썸머노트
	$('#summernote').summernote({
	    	placeholder: '내용을 입력하세요',
        minHeight: 370,
        maxHeight: null,
        focus: true, 
        lang : 'ko-KR'
	});
	
	// 글쓰기
	$("#writeSubmit").click(function() {
		if (confirm("글 작성을 완료하시겠습니까?")) {

			// 서버로 전송
			$("#write").submit();
		} else {
			return;
		}

	});

	// 글수정
	$("#updateSubmit").click(function() {
		if (confirm("글 수정을 완료하시겠습니까?")) {

			$("#update").submit();
		} else {
			return;
		}
		
	});
	// 글삭제
	$("#deleteSubmit").click(function() {
		if (confirm("글 삭제하시겠습니까?")) {
			window.location = "delete?number="+$("#number").val()+"&writer="+$("#writer").val();
		} else {
			return;
		}
	});
	
	fn_addFile();
	fn_updateAddFile();
	
});

// 글쓰기 빈칸일 경우
function setColor(el, bg) {
	  if (el.style) el.style.backgroundColor = bg;
	}

function checkInput(form) {
	var bgBad = "pink";
	var valid = true;
	
	if (form.b_title.value == "") {
		valid = false;
		setColor(form.b_title, bgBad);
		form.b_title.focus();
		alert("제목을 입력해주세요");
	}
	  return valid;
}

function fn_addFile(){
	var fileIndex = 1;
	$(".fileAdd_btn").on("click", function(){
		$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+
				"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
	});
	$(document).on("click","#fileDelBtn", function(){
		$(this).parent().remove();		
	});
}

function fn_updateAddFile(){
	var updateFileIndex = 1;
	$(".updateFileAdd_btn").on("click", function(){
		alert("aa");
		$("#updateFileIndex").append("<div><input type='file' style='float:left;' name='file_"+(updateFileIndex++)+"'>"+
				"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
	});
	$(document).on("click","#fileDelBtn", function(){
		$(this).parent().remove();
		
	});
}
	var fileNoArry = new Array();
	var fileNameArry = new Array();
	function fn_del(value, name){
		
		fileNoArry.push(value);
		fileNameArry.push(name);
		$("#fileNoDel").attr("value", fileNoArry);
		$("#fileNameDel").attr("value", fileNameArry);
	}

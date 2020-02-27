$(document).ready(function() {
	// 검색
	$("#searchSubmit").click(function() {
		if (confirm("검색하시겠습니까?")) {
			$("#search").submit();
		} else {
			return;
		}
	});
});

function setColor(el, bg) {
	  if (el.style) el.style.backgroundColor = bg;
	}

function checkSearch(form) {
	var bgBad = "pink";
	var valid = true;
	
	if (form.search_content.value == "") {
		valid = false;
		setColor(form.search_content, bgBad);
		form.search_content.focus();
		alert("검색어를 입력해주세요");
	}
	  return valid;
}
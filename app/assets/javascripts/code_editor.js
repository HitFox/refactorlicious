$(document).on('page:change', function(){
  window.editor = ace.edit("wrapper");
  var localStorageID = $('.editor').attr('data-storage-id')
  editor.setTheme("ace/theme/monokai");
  editor.getSession().setTabSize(2);
  editor.getSession().setMode("ace/mode/ruby");
  editor.getSession().setUseWrapMode(true);
  editor.setShowPrintMargin(false);
  document.getElementById('wrapper').style.fontSize='15px';

   // Updating local Storage
  if(localStorage)
  {
    if(localStorage.getItem(localStorageID)){
      editor.setValue(localStorage.getItem(localStorageID));
    }
    editor.getSession().on('change', function(e) {
      localStorage.setItem(localStorageID, editor.getValue());
    });
  }

  $(".submit").click( function() {

    var expected_words = JSON.parse($("#key_words").text());
    var answer = localStorage.getItem(localStorageID);
    var is_valid_answer = true;

    if (answer) {
      for (var word in expected_words) {
        var reg_exp = new RegExp(word , 'g')
        var count = (answer.match(reg_exp) || []).length;
        if (expected_words[word] !== count) {
          is_valid_answer = false;
        }
      }
    }
    else {
      is_valid_answer = false;
    }

    $("#message").show();

    if(!is_valid_answer) {
      $("#fail").show();
    }
    else {
       $("#success").show();
       $.ajax({
        url: window.location.href + "/mark_as_finished",
        method: "PATCH" });
    }
  });

  $("#close").click( function() {
    $("#fail, #success, #message").hide();
  })
});

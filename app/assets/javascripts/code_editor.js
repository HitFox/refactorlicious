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

  $(".submit a").click( function() {
    var is_valid_answer = true;
    var next_exercise_id = $(this).data("next-exercise");
    var expected_words = $(this).data("expected-words");
    var answer = localStorage.getItem(localStorageID);

    if (answer) {
      for (var word in expected_words) {
        var reg_exp = new RegExp(word , 'g')
        var count = (answer.match(reg_exp) || []).length;
        if (expected_words[word] != count) {
          is_valid_answer = false;
        }
      }
    }
    else {
      is_valid_answer = false;
    }

    if(!is_valid_answer) {
      alert ("Please review your code, your refactoring is still not complete!")
    }
    else {
      alert ("Nice refactoring!")
      $(location).attr('href',"/exercises/" + next_exercise_id);
    }
  });
});

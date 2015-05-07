$(document).on('page:change', function() {
  if(onExercisesShow()) {
    initializeEditor();
    updateLocalStorage();
    installSubmitHandler();
  }
});

function initializeEditor() {
  window.editor = ace.edit("wrapper");
  editor.setTheme("ace/theme/monokai");
  editor.getSession().setTabSize(2);
  editor.getSession().setMode("ace/mode/ruby");
  editor.getSession().setUseWrapMode(true);
  editor.setShowPrintMargin(false);
  document.getElementById('wrapper').style.fontSize='15px';
}

function updateLocalStorage() {
  var localStorageID = $('.editor').attr('data-storage-id');
  if(localStorage)
  {
    if(localStorage.getItem(localStorageID)) {
      editor.setValue(localStorage.getItem(localStorageID));
    }
    editor.getSession().on('change', function(e) {
      localStorage.setItem(localStorageID, editor.getValue());
    });
  }
}

function installSubmitHandler() {
  $(".submit").click(checkIfValidAnswer);

  $("#close").click( function() {
    $("#fail, #success, #syntax_errors, #message").hide();
    $("#close").css({ "right": "1em"});
  })
}

function checkIfValidAnswer() {
  var localStorageID = $('.editor').attr('data-storage-id');
  var expected_words = JSON.parse($("#key_words").text());
  var answer = localStorage.getItem(localStorageID);
  var is_valid_answer = true;

  $("#message").show();
  if(!answer) {
    $("#fail").show();
  } else {
    $.ajax({
     url: window.location.href + "/submit.json",
     method: "PATCH",
     data: {answer: answer} ,
     success: function(data){
      if (data['answer_errors']) {
        $("#syntax_errors").show();
        $("#syntax_errors pre").html(data['answer_errors']);
        $("#close").css({ "right": "1.7em"});
      }
      else {
        for (var word in expected_words) {
          var reg_exp = new RegExp(word , 'g')
          var count = (answer.match(reg_exp) || []).length;
          if (expected_words[word] !== count) {
          is_valid_answer = false;
        }
      }
        if(is_valid_answer) {
         $("#success").show();
        }

        else {
          $("#fail").show();
        }
      }
    }
  });
 }
}

function onExercisesShow() {
  return window.location.pathname.match(/^\/exercises\/\d+/) !== null;
}

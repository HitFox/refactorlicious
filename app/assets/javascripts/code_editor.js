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
  $(".submit").click(submitAnswer);

  $("#close").click( function() {
    $("#fail, #success, #syntax_errors, #message").hide();
  })
}

function submitAnswer() {
  var localStorageID = $('.editor').attr('data-storage-id');
  var answer = localStorage.getItem(localStorageID);
  $("#message").show();
  if(!answer) {
    $("#fail").show();
  } else {
    $.ajax({
      url: window.location.href + "/submit.json",
      method: "PATCH",
      data: {answer: answer} ,
      success: function(submitResponse){
        displaySubmitResult(submitResponse);
      }
    });
  }
}

function onExercisesShow() {
  return window.location.pathname.match(/^\/exercises\/\d+/) !== null;
}

function displaySubmitResult (submitResponse) {
  switch (submitResponse['type']) {
    case 'successfull':
      $("#close").css({ "right": "1em"});
      $("#success").show();
      break;
    case 'has_syntax_errors':
      $("#close").css({ "right": "1.7em"});
      $("#syntax_errors").show();
      $("#syntax_errors pre").html(submitResponse['syntax_errors']);
      break;
    case 'pending_refactoring':
      $("#close").css({ "right": "1em"});
      $("#fail").show();
      break;
  }
}


$(document).on('page:change', function() {
  if (onExercisesForm()){
    initializeCodeToRefactorEditor();
    initializeSolutionEditor();
    installFormSubmitHandler();
  }
});


function onExercisesForm() {
  return $("body").find(".code").length>0
}

function initializeCodeToRefactorEditor() {
  window.code_editor = ace.edit("code_editor");
  code_editor.setTheme("ace/theme/monokai");
  code_editor.getSession().setTabSize(2);
  code_editor.getSession().setMode("ace/mode/ruby");
  document.getElementById('code_editor').style.fontSize='15px';
  if ($("#exercise_code_to_refactor").val()) {
    code_editor.setValue($("#exercise_code_to_refactor").val());
  }
}

function initializeSolutionEditor() {
 window.solution_editor = ace.edit("solution_editor");
 solution_editor.setTheme("ace/theme/monokai");
 solution_editor.getSession().setTabSize(2);
 solution_editor.getSession().setMode("ace/mode/ruby");
 document.getElementById('solution_editor').style.fontSize='15px';
 if ($("#exercise_solution").val()) {
  solution_editor.setValue($("#exercise_solution").val());
}
}


function installFormSubmitHandler () {
  $("#submit").click( function () {
    $("#exercise_code_to_refactor").val(code_editor.getValue());
    $("#exercise_solution").val(solution_editor.getValue());
  });
}

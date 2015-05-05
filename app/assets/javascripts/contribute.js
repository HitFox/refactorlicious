$(document).on('page:change', function() {
  if (onExercisesForm()){
    initializeCodeToRefactorEditor();
    initializeSolutionEditor();
    installFormSubmitHandler();
  }
});


function onExercisesForm() {
  var reg_exp_new_exercise = new RegExp(/^\/exercises\/new/);
  var reg_exp_admin_edit = new RegExp(/^\/admin\/exercises\/\d+\/edit/);
  var path =  window.location.pathname;
  return path.match(reg_exp_new_exercise) !== null ||
  path.match(reg_exp_admin_edit) !== null;
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

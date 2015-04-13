$(document).on('page:change', function(){
  var editor = ace.edit("wrapper");
  editor.setTheme("ace/theme/monokai");
  editor.getSession().setTabSize(2);
  editor.getSession().setMode("ace/mode/ruby");
  editor.getSession().setUseWrapMode(true);
  editor.setShowPrintMargin(false);
  document.getElementById('wrapper').style.fontSize='15px';
});

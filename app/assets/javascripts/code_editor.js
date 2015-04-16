$(document).on('page:change', function(){
  var editor = ace.edit("wrapper");
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
});

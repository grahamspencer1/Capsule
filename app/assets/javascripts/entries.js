document.addEventListener('DOMContentLoaded' , function(){
  var checkbox = document.querySelector('#entry_private')
    checkbox.addEventListener('change', function (e) {
      if (!(e.target.checked)) {
        var txt;
        var r = confirm("WARNING - Unchecking this box will make this entry viewable in the Anonymous Entries section. Your personal information won't be posted, but be aware that the complete entry will be viewable to the public. Are you absolutely sure you want to share this anonymously to the public?");
        if (r == true) {
          console.log("Okay");
        } else {
          e.target.checked = true;
        }
      }
    });
});

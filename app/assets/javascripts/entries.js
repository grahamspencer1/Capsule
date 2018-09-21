document.addEventListener('DOMContentLoaded' , function(){
  var checkbox = document.querySelector('#entry_private');
  if (checkbox) {
    checkbox.addEventListener('change', function (e) {
      if (!(e.target.checked)) {
        var txt;
        var r = confirm("WARNING - Unchecking this box will make your entry visible to other Capsule users. Your screen name, email, and other personal information will not be shown, but the content itself will. Are you sure you want to share this with the world?");
        if (r == true) {
          console.log("Okay");
        } else {
          e.target.checked = true;
        }
      }
    });
}
var automoodCheckbox = document.querySelector('#entry_auto_mood');
  if (automoodCheckbox) {
    automoodCheckbox.addEventListener('change', function (e) {
      if (!(e.target.checked)) {
           picture_container.style.display = "block";
          }
        });
        
  }



});

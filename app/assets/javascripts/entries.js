document.addEventListener('DOMContentLoaded' , function(){
  var checkbox = document.querySelector('#entry_private');
  if (checkbox) {
    checkbox.addEventListener('change', function(e) {
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

  var submitbtn = document.querySelectorAll('.btn-default');
    submitbtn.addEventListener('click', function(e){
    var entryfild = document.querySelector('content')
     if (entryfild) = ""{
       alert("Entry field can not be empity");
     });
}


  // This bring the list of pictures when the user off the auto-mode
  var automoodCheckbox = document.querySelector('#entry_auto_mood');
  if (automoodCheckbox) {
    automoodCheckbox.addEventListener('change', function(e) {
      if (!(e.target.checked)) {
          picture_container.style.display = "block";
        }
      if ((e.target.checked)) {
        picture_container.style.display = "none";
      }
    });
  }

  // adding click event for closing (x) for the manual selection of bg images
  var span = document.querySelector('#picture_container');
  // check if span exists before adding click event
  if(span){
    span.onclick = function() {
      picture_container.style.display = "none";
    }
  }


  //This is the background picture list and store the selected picture temporarily
  var selectedPictures = document.querySelectorAll('.selected-picture');
  selectedPictures.forEach(function(selectedPicture){
    selectedPicture.addEventListener('click', function(event){
      event.preventDefault();
      document.querySelector('#picture_preview img').src = selectedPicture.src;
      var dataId = selectedPicture.dataset.imageid;
      document.querySelector('#entry_bg_picture_id').value = dataId;
    });
  });

  // footer height if nav exists
  var nav = document.querySelector(".main-nav");
  var footer = document.querySelector("footer");

  if (nav && nav.classList.contains("visible")) {
    footer.classList.add("nav-mod");
  } else {
    footer.classList.remove("nav-mod");
  }

});

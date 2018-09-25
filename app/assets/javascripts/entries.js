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

// This bring the list of pictures when the user off the auto-mode

  var automoodCheckbox = document.querySelector('#entry_auto_mood');
  if (automoodCheckbox) {
    automoodCheckbox.addEventListener('change', function(e) {
      if (!(e.target.checked)) {
          picture_container.style.display = "block";
          // picture_preview.style.display = "block";
        }
      if ((e.target.checked)) {
           picture_container.style.display = "none";
           // picture_preview.style.display = "none";
        }
    });
  }
    var span = document.querySelector('#picture_container');
    // var span = document.querySelector('picture_container')[0];
    span.onclick = function() {
     picture_container.style.display = "none";
    }

//This is the background picture list and atore the selected picture temporarly

  var selectedPictures = document.querySelectorAll('.selected-picture');
  selectedPictures.forEach(function(selectedPicture){
    selectedPicture.addEventListener('click', function(event){
      event.preventDefault();
      document.querySelector('#picture_preview img').src = selectedPicture.src;
      // document.querySelector(field.text_area.background-image = "url('selectedPicture.src')";
      // field.text_area.style.background-image.url = selectedPicture.src;

      var dataId = selectedPicture.dataset.imageid;
      document.querySelector('#entry_bg_picture_id').value = dataId;
      console.log(document.querySelector('#entry_bg_picture_id'));

      })
  })

  // footer height if nav exists
  var nav = document.querySelector(".main-nav");
  var footer = document.querySelector("footer");

  if (nav && nav.classList.contains("visible")) {
    // nav.classList.remove("hidden");
    footer.classList.add("nav-mod");
  } else {
    footer.classList.remove("nav-mod");
  }
});

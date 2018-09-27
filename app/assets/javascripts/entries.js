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
        }
      if ((e.target.checked)) {
        picture_container.style.display = "none";
      }
    });
  }

  //Button mauual
  var buttonwallpaper = document.querySelector('#selectwallpaper');
  if (buttonwallpaper) {
    buttonwallpaper.addEventListener('click', function(e) {
      e.preventDefault();
      picture_container.style.display = "block";
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
  if (selectedPictures) {
    selectedPictures.forEach(function(selectedPicture){
      selectedPicture.addEventListener('click', function(event){
        event.preventDefault();
        document.querySelector('#picture_preview img').src = selectedPicture.src;
        var dataId = selectedPicture.dataset.imageid;
        document.querySelector('#entry_bg_picture_id').value = dataId;
      });
    });
  }

  /*****************************************
  *         Media Query javascript         *
  ******************************************/
  var queryBigScreen = window.matchMedia("(min-width: 1025px)");

  // footer height if nav exists
  var nav = document.querySelector(".main-nav");
  var footer = document.querySelector("footer");
  function footerNavQuery(query) {
    if (nav && nav.classList.contains("visible")) {
      if (query.matches) {
        footer.classList.remove("nav-mod");
      } else {
        footer.classList.add("nav-mod");
      }
    }
  }
  footerNavQuery(queryBigScreen);
  queryBigScreen.addListener(footerNavQuery);

  // center logo if nav does not exists on big screen
  var logo = document.querySelector(".logo-wrapper");
  if (nav && nav.classList.contains("hidden")) {
    logo.classList.add("logo-nav-mod");
  } else {
    logo.classList.remove("logo-nav-mod");
  }
});

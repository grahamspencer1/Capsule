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

  var automoodCheckbox = document.querySelector('#entry_auto_mood');
  if (automoodCheckbox) {
    automoodCheckbox.addEventListener('change', function(e) {
      if (!(e.target.checked)) {
          picture_container.style.display = "block";
        }
    });
  }

  // footer height if nav exists
  var nav = document.querySelector(".main-nav");
  var footer = document.querySelector("footer");

  if (nav && nav.classList.contains("visible")) {
    // nav.classList.remove("hidden");
    footer.classList.add("nav-mod");
  } else {
    footer.classList.remove("nav-mod");
  }

  //dynamically change entry show page background
  // var entries = document.querySelectorAll(".entry-container");
  // var bg = document.querySelector(".bg2");
  //
  // entries.forEach(function(entry) {
  //   entry.addEventListener("click", function(e) {
  //     // e.preventDefault();
  //
  //     $.ajax({
  //       url: "/entries",
  //       method: "GET"
  //     }).done(function(responseData) {
  //       bg.style.backgroundImage = "url('https://images.unsplash.com/photo-1536573538316-9b0e89ad26d3?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=23c93f420502b90ce60d751314022d3a&auto=format&fit=crop&w=1950&q=80')";
  //     });
  //   });
  // });
});

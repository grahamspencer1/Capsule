document.addEventListener('DOMContentLoaded' , function(){
  var checkbox = document.querySelector('#entry_private');
  // var bgImageShow = document.querySelector('#bg-img');


  // var color = window.getComputedStyle(
  //   document.querySelector('.bg1'), ':before'
  // ).getPropertyByValue('background')
  //
  // console.log(color)


var el = document.querySelector('.bg1')

// (function(){
    // $(this).addClass('background').attr('img','backgroundImage');
// });;
if(el){

        el.addEventListener('click', function(e){
          e.preventDefault();

          $.ajax({
            url: '/entries',
            method: 'GET',
            data: {image: 'https://m.blog.hu/je/jegyzetlap/image/jess-watters-684713-unsplash.jpg'},
            dataType: 'html'
          }).done(function(){
                 $("#pic").append html
              }
          );

        });
      }

  // bgImageShow.addEventListener('click', function(){
    // document.body.style.backgroundImage = "url('jess-watters-684713-unsplash.jpg')";
  // });

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

  ///click event for show page background image display




});

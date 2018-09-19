  var entryIndex = 1;
  showEntry(entryIndex);

  function goEntry(n) {
  showEntry(entryIndex += n);
  }
  function showEntry(n) {
      var i;
      var x = document.selectqueery("currentEntry");
      if (n > x.length) {entryIndex = 1}
      if (n < 1) {entryIndex = x.length} ;
      for (i = 0; i < x.length; i++) {
          x[i].style.display = "none";
      }
      x[entryIndex-1].style.display = "block";
  }

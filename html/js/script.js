function displayCrosshair(link, size) {
  var crosshair = document.getElementById('crosshair');
  
  if (link) {
    crosshair.src = link;
    crosshair.style.width = size + 'px';
    crosshair.style.height = size + 'px';
    crosshair.style.display = 'block';
  } else {
    crosshair.style.display = 'none';
  }
}

window.addEventListener('message', function(event) {
  var eventData = event.data;
  
  if (eventData.type === 'displayCrosshair') {
    displayCrosshair(eventData.link, eventData.size);
  }
});

window.addEventListener('DOMContentLoaded', function() {
  window.postMessage({ type: 'crosshairLoaded' }, '*');
});


displayCrosshair('', 0);
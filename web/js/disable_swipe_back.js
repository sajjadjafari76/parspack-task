document.addEventListener('touchmove', function(event) {
    event.preventDefault();
}, { passive: false });

document.body.style.touchAction = 'none';

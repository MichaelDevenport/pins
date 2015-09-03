document.addEventListener('page:change', function() {
        document.getElementById('primary-content').className += 'animated flipInY';
});
document.addEventListener('page:fetch', function() {
        document.getElementById('primary-content').className += 'animated flipOutY';
});

document.addEventListener('page:change', function() {
        document.getElementById('bounce-content').className += 'animated bounceInDown';
});
document.addEventListener('page:fetch', function() {
        document.getElementById('bounce-content').className += 'animated bounceOutDown';
});

document.addEventListener('page:change', function() {
        document.getElementById('up-content').className += 'animated bounceInUp';
});
document.addEventListener('page:fetch', function() {
        document.getElementById('up-content').className += 'animated BounceOutUp';
});

document.addEventListener('page:change', function() {
        document.getElementById('bounce-right').className += 'animated bounceInRight';
});
document.addEventListener('page:fetch', function() {
        document.getElementById('bounce-right').className += 'animated bounceOutRight';
});

document.addEventListener('page:change', function() {
        document.getElementById('bounceleft-content').className += 'animated bounceInLeft';
});
document.addEventListener('page:fetch', function() {
        document.getElementById('bounceleft-content').className += 'animated bounceOutLeft';
});

document.addEventListener('page:change', function() {
        document.getElementById('hinge-content').className += 'animated hinge';
});
document.addEventListener('page:fetch', function() {
        document.getElementById('hinge-content').className += 'animated hinge';
});

document.addEventListener('page:change', function() {
        document.getElementById('zoom-content').className += 'animated zoomIn';
});
document.addEventListener('page:fetch', function() {
        document.getElementById('zoom-content').className += 'animated zoomOut';
});

document.addEventListener('page:change', function() {
        document.getElementById('zoom-down').className += 'animated zoomInDown';
});
document.addEventListener('page:fetch', function() {
        document.getElementById('zoom-down').className += 'animated zoomInDown';
});

document.addEventListener('page:change', function() {
        document.getElementById('lightspeed').className += 'animated lightSpeedIn';
});
document.addEventListener('page:fetch', function() {
        document.getElementById('lightspeed').className += 'animated lightSpeedOut';
});

document.addEventListener('page:change', function() {
        document.getElementById('lightspeed2').className += 'animated lightSpeedIn';
});
document.addEventListener('page:fetch', function() {
        document.getElementById('lightspeed2').className += 'animated lightSpeedOut';
});

document.addEventListener('page:change', function() {
        document.getElementById('flip-element').className += 'animated flip';
});
document.addEventListener('page:fetch', function() {
        document.getElementById('flip-element').className += 'animated flip';
});
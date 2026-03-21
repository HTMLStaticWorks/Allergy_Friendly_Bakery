(function ($) {
    "use strict";

    // Spinner
    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner();
    
    
    // Initiate the wowjs
    new WOW().init();


    // Fixed Navbar
    $('.fixed-top').css('top', $('.top-bar').height());
    $(window).scroll(function () {
        if ($(this).scrollTop()) {
            $('.fixed-top').addClass('bg-dark').css('top', 0);
        } else {
            $('.fixed-top').removeClass('bg-dark').css('top', $('.top-bar').height());
        }
    });
    
    
    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
        return false;
    });


    // Header carousel
    $(".header-carousel").owlCarousel({
        autoplay: false,
        smartSpeed: 1500,
        loop: true,
        nav: true,
        dots: false,
        items: 1,
        navText : [
            '<i class="bi bi-chevron-left"></i>',
            '<i class="bi bi-chevron-right"></i>'
        ]
    });


    // Facts counter
    $('[data-toggle="counter-up"]').counterUp({
        delay: 10,
        time: 2000
    });


    // Testimonials carousel
    $(".testimonial-carousel").owlCarousel({
        autoplay: false,
        smartSpeed: 1000,
        margin: 25,
        loop: true,
        center: true,
        dots: false,
        nav: true,
        navText : [
            '<i class="bi bi-chevron-left"></i>',
            '<i class="bi bi-chevron-right"></i>'
        ],
        responsive: {
            0:{
                items:1
            },
            768:{
                items:2
            },
            992:{
                items:3
            }
        }
    });

    
    
    // Cart Logic
    function updateCartCount() {
        let count = localStorage.getItem('cartCount') || 0;
        $('#cartCount').text(count);
        $('.cart-count-header').text(count);
    }
    updateCartCount();

    $('.add-to-cart').click(function(e) {
        e.preventDefault();
        let count = parseInt(localStorage.getItem('cartCount') || 0);
        localStorage.setItem('cartCount', count + 1);
        updateCartCount();
        
        // Visual feedback
        let originalText = $(this).html();
        $(this).html('<i class="fa fa-check me-2"></i>Added');
        $(this).addClass('btn-success').removeClass('btn-outline-primary');
        setTimeout(() => {
            $(this).html(originalText);
            $(this).addClass('btn-outline-primary').removeClass('btn-success');
        }, 2000);
    });

    // Clear Cart
    $('#clearCart').click(function() {
        localStorage.setItem('cartCount', 0);
        updateCartCount();
        location.reload();
    });

})(jQuery);


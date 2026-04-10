document.addEventListener('DOMContentLoaded', () => {
    initTheme();
    initRTL();
    initMobileMenu();
    initAnimations();
    initCart();
    initDashboardTabs();
    initProductFilter();
});

// Cart Management
let cartCount = parseInt(localStorage.getItem('cartCount')) || 0;

function initCart() {
    updateCartBadge();
}

function updateCartBadge() {
    const badges = document.querySelectorAll('.cart-badge');
    badges.forEach(badge => {
        badge.textContent = cartCount;
        
        // Add a little animation when count changes
        badge.classList.remove('animate-pop');
        void badge.offsetWidth; // Trigger reflow
        badge.classList.add('animate-pop');
    });
}

// Theme Management
function initTheme() {
    const themeToggle = document.getElementById('theme-toggle');
    const mobileThemeToggle = document.getElementById('mobile-theme-toggle');
    
    if (!themeToggle && !mobileThemeToggle) return;

    const savedTheme = localStorage.getItem('theme') || 'light';
    document.documentElement.setAttribute('data-theme', savedTheme);
    updateThemeIcon(savedTheme);

    function toggleTheme() {
        const currentTheme = document.documentElement.getAttribute('data-theme');
        const newTheme = currentTheme === 'light' ? 'dark' : 'light';
        
        document.documentElement.setAttribute('data-theme', newTheme);
        localStorage.setItem('theme', newTheme);
        updateThemeIcon(newTheme);
    }

    if (themeToggle) {
        themeToggle.addEventListener('click', toggleTheme);
    }
    
    if (mobileThemeToggle) {
        mobileThemeToggle.addEventListener('click', toggleTheme);
    }
}

function updateThemeIcon(theme) {
    // Update desktop theme icon
    const desktopIcon = document.querySelector('#theme-toggle i');
    if (desktopIcon) {
        desktopIcon.className = theme === 'light' ? 'fas fa-moon' : 'fas fa-sun';
    }
    
    // Update mobile theme icon
    const mobileIcon = document.querySelector('#mobile-theme-toggle i');
    if (mobileIcon) {
        mobileIcon.className = theme === 'light' ? 'fas fa-moon' : 'fas fa-sun';
    }
}

// RTL Management
function initRTL() {
    const rtlToggle = document.getElementById('rtl-toggle');
    const mobileRtlToggle = document.getElementById('mobile-rtl-toggle');
    
    if (!rtlToggle && !mobileRtlToggle) return;

    const savedRTL = localStorage.getItem('rtl') === 'true';
    document.documentElement.setAttribute('dir', savedRTL ? 'rtl' : 'ltr');

    function toggleRTL() {
        const currentRTL = document.documentElement.getAttribute('dir') === 'rtl';
        const newRTL = !currentRTL;
        
        document.documentElement.setAttribute('dir', newRTL ? 'rtl' : 'ltr');
        localStorage.setItem('rtl', newRTL);
    }

    if (rtlToggle) {
        rtlToggle.addEventListener('click', toggleRTL);
    }
    
    if (mobileRtlToggle) {
        mobileRtlToggle.addEventListener('click', toggleRTL);
    }
}

// Mobile Menu
function initMobileMenu() {
    const menuToggle = document.getElementById('mobileMenuToggle');
    const menuOverlay = document.getElementById('mobileMenuOverlay');
    const menuClose = document.getElementById('mobileMenuClose');
    const menuBackdrop = document.getElementById('mobileMenuBackdrop');
    
    if (!menuToggle || !menuOverlay || !menuBackdrop) return;

    // Open mobile menu
    menuToggle.addEventListener('click', () => {
        menuOverlay.classList.add('active');
        menuBackdrop.classList.add('active');
        document.body.style.overflow = 'hidden'; // Prevent body scroll
    });

    // Close mobile menu
    function closeMobileMenu() {
        menuOverlay.classList.remove('active');
        menuBackdrop.classList.remove('active');
        document.body.style.overflow = ''; // Restore body scroll
    }

    // Close menu when clicking close button
    if (menuClose) {
        menuClose.addEventListener('click', closeMobileMenu);
    }

    // Close menu when clicking backdrop
    menuBackdrop.addEventListener('click', closeMobileMenu);

    // Close menu when clicking on a menu link
    const menuLinks = menuOverlay.querySelectorAll('.mobile-menu-nav a');
    menuLinks.forEach(link => {
        link.addEventListener('click', closeMobileMenu);
    });

    // Close menu on Escape key
    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape' && menuOverlay.classList.contains('active')) {
            closeMobileMenu();
        }
    });
}

// Scroll Animations
function initAnimations() {
    const observerOptions = {
        threshold: 0.1
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('animate-in');
                observer.unobserve(entry.target);
            }
        });
    }, observerOptions);

    document.querySelectorAll('.reveal').forEach(el => observer.observe(el));
}

// Add to Cart Interaction
function addToCart(productId) {
    console.log(`Added product ${productId} to cart`);
    
    // Increment cart count
    cartCount++;
    localStorage.setItem('cartCount', cartCount);
    updateCartBadge();

    const btn = event.currentTarget;
    const originalText = btn.innerHTML;
    
    btn.innerHTML = '<span>Added!</span>';
    btn.classList.add('btn-success');
    
    setTimeout(() => {
        btn.innerHTML = originalText;
        btn.classList.remove('btn-success');
    }, 2000);
}

// Dashboard Tab Switching
function initDashboardTabs() {
    const tabLinks = document.querySelectorAll('.sidebar-nav-link[data-tab]');
    const tabSections = document.querySelectorAll('.dashboard-section');

    if (tabLinks.length === 0) return;

    tabLinks.forEach(link => {
        link.addEventListener('click', (e) => {
            e.preventDefault();
            const targetTab = link.getAttribute('data-tab');

            // Update Active Link
            tabLinks.forEach(l => l.classList.remove('active'));
            link.classList.add('active');

            // Update Active Section
            tabSections.forEach(section => {
                section.classList.remove('active');
                if (section.id === targetTab) {
                    section.classList.add('active');
                }
            });
        });
    });
}

// Product Filtering
function initProductFilter() {
    const filters = document.querySelectorAll('.filter-chip');
    const products = document.querySelectorAll('.grid-3 .card');

    if (filters.length === 0 || products.length === 0) return;

    filters.forEach(filter => {
        filter.addEventListener('click', () => {
            const category = filter.getAttribute('data-filter');

            // Update active state
            filters.forEach(f => f.classList.remove('active'));
            filter.classList.add('active');

            // Filter products
            products.forEach(product => {
                const productCategory = product.getAttribute('data-category');
                
                if (category === 'all' || productCategory === category) {
                    product.style.display = 'flex';
                    // Trigger reveal animation again if needed
                    setTimeout(() => {
                        product.classList.add('animate-in');
                    }, 10);
                } else {
                    product.style.display = 'none';
                    product.classList.remove('animate-in');
                }
            });
        });
    });
}

document.addEventListener('DOMContentLoaded', () => {
    initTheme();
    initRTL();
    initMobileMenu();
    initAnimations();
    initCart();
    initDashboardTabs();
    initDashboardMobileSidebar();
    initProductFilter();
    initBackToTop();
    initActiveNav();
    initFAQAccordion();
    initTimelineMilestones();
    initPasswordToggle();
});

// Cart Management
let cartCount = parseInt(localStorage.getItem('cartCount')) || 0;

function initCart() {
    updateCartBadge();

    // Add click event to cart buttons
    const cartButtons = document.querySelectorAll('.cart-btn');
    cartButtons.forEach(button => {
        button.addEventListener('click', () => {
            window.location.href = 'cart.html';
        });
    });
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

    const authThemeToggle = document.getElementById('auth-theme-toggle');
    if (authThemeToggle) {
        authThemeToggle.addEventListener('click', toggleTheme);
    }
}

function updateThemeIcon(theme) {
    const iconClass = theme === 'light' ? 'fas fa-moon' : 'fas fa-sun';
    document.querySelectorAll('#theme-toggle i, #mobile-theme-toggle i, #auth-theme-toggle i').forEach((icon) => {
        icon.className = iconClass;
    });
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
function addToCart(productId, ev) {
    console.log(`Added product ${productId} to cart`);

    // Increment cart count
    cartCount++;
    localStorage.setItem('cartCount', cartCount);
    updateCartBadge();

    const e = ev || (typeof window !== 'undefined' && window.event);
    const btn = e && e.currentTarget ? e.currentTarget : null;
    if (!btn) return;
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

// Dashboard: hamburger drawer for sidebar (mobile / tablet)
function initDashboardMobileSidebar() {
    const toggle = document.getElementById('dashboardSidebarToggle');
    const sidebar = document.getElementById('dashboardSidebar');
    const backdrop = document.getElementById('dashboardSidebarBackdrop');
    const closeBtn = document.getElementById('dashboardSidebarClose');

    if (!toggle || !sidebar || !backdrop) return;

    const mq = window.matchMedia('(max-width: 1024px)');

    function isDrawerMode() {
        return mq.matches;
    }

    function openDrawer() {
        sidebar.classList.add('is-open');
        backdrop.classList.add('is-active');
        document.body.classList.add('dashboard-sidebar-open');
        toggle.setAttribute('aria-expanded', 'true');
        backdrop.setAttribute('aria-hidden', 'false');
    }

    function closeDrawer() {
        sidebar.classList.remove('is-open');
        backdrop.classList.remove('is-active');
        document.body.classList.remove('dashboard-sidebar-open');
        toggle.setAttribute('aria-expanded', 'false');
        backdrop.setAttribute('aria-hidden', 'true');
    }

    toggle.addEventListener('click', () => {
        if (sidebar.classList.contains('is-open')) {
            closeDrawer();
        } else {
            openDrawer();
        }
    });

    backdrop.addEventListener('click', closeDrawer);

    if (closeBtn) {
        closeBtn.addEventListener('click', closeDrawer);
    }

    sidebar.querySelectorAll('.sidebar-nav-link').forEach((link) => {
        link.addEventListener('click', () => {
            if (isDrawerMode()) closeDrawer();
        });
    });

    const onMqChange = (e) => {
        if (!e.matches) closeDrawer();
    };

    if (typeof mq.addEventListener === 'function') {
        mq.addEventListener('change', onMqChange);
    } else {
        mq.addListener(onMqChange);
    }

    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape' && sidebar.classList.contains('is-open')) {
            closeDrawer();
        }
    });
}

// Back to top
function initBackToTop() {
    let btn = document.getElementById('back-to-top');
    if (!btn) {
        btn = document.createElement('button');
        btn.type = 'button';
        btn.id = 'back-to-top';
        btn.className = 'back-to-top';
        btn.setAttribute('aria-label', 'Back to top');
        btn.innerHTML = '<i class="fas fa-arrow-up" aria-hidden="true"></i>';
        document.body.appendChild(btn);
    }

    const onScroll = () => {
        if (window.scrollY > 300) {
            btn.classList.add('visible');
        } else {
            btn.classList.remove('visible');
        }
    };

    window.addEventListener('scroll', onScroll, { passive: true });
    onScroll();

    btn.addEventListener('click', () => {
        window.scrollTo({ top: 0, behavior: 'smooth' });
    });
}

// Active navigation (desktop + mobile drawer)
function initActiveNav() {
    let page = window.location.pathname.split('/').pop();
    if (!page) page = 'index.html';
    page = page.toLowerCase();

    const links = document.querySelectorAll('.nav-links a[href], .mobile-menu-nav a[href]');
    links.forEach((anchor) => {
        const href = anchor.getAttribute('href');
        if (!href || href.startsWith('#')) return;
        const file = href.split('/').pop().toLowerCase();
        if (file === page) {
            anchor.classList.add('active');
        } else {
            anchor.classList.remove('active');
        }
    });
}

// FAQ accordion
function initFAQAccordion() {
    const roots = document.querySelectorAll('.faq-accordion');
    roots.forEach((root) => {
        const items = root.querySelectorAll('.faq-accordion-item');
        items.forEach((item) => {
            const trigger = item.querySelector('.faq-accordion-trigger');
            const panel = item.querySelector('.faq-accordion-panel');
            if (!trigger || !panel) return;

            trigger.addEventListener('click', () => {
                const isOpen = item.classList.contains('is-open');

                // Optional: Close others in the same accordion
                items.forEach((other) => {
                    other.classList.remove('is-open');
                    const p = other.querySelector('.faq-accordion-panel');
                    const t = other.querySelector('.faq-accordion-trigger');
                    if (p) p.style.maxHeight = null;
                    if (t) t.setAttribute('aria-expanded', 'false');
                });

                if (!isOpen) {
                    item.classList.add('is-open');
                    panel.style.maxHeight = panel.scrollHeight + 'px';
                    trigger.setAttribute('aria-expanded', 'true');
                }
            });
        });
    });
}

// About page timeline
function initTimelineMilestones() {
    const milestones = document.querySelectorAll('.timeline-milestone');
    if (milestones.length === 0) return;

    const observer = new IntersectionObserver(
        (entries) => {
            entries.forEach((entry) => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('is-visible');
                }
            });
        },
        { threshold: 0.15, rootMargin: '0px 0px -10% 0px' }
    );

    milestones.forEach((m) => observer.observe(m));
}

// Product Filtering
function initProductFilter() {
    const filters = document.querySelectorAll('.filter-chip[data-filter], .category-btn[data-filter]');
    const products = document.querySelectorAll('.card[data-category]');

    if (filters.length === 0) return;

    const filterProducts = (category) => {
        // Update active state
        filters.forEach(f => {
            if (f.getAttribute('data-filter') === category) {
                f.classList.add('active');
            } else {
                f.classList.remove('active');
            }
        });

        // Filter products with a smooth transition
        products.forEach(product => {
            const attr = product.getAttribute('data-category');
            if (!attr) return;

            const productCategories = attr.toLowerCase().split(/\s+/);
            const targetCategory = category.toLowerCase();

            if (targetCategory === 'all' || productCategories.includes(targetCategory)) {
                // Show item
                product.style.display = 'flex';
                // Ensure it's rendered before animating
                setTimeout(() => {
                    product.classList.add('animate-in');
                    product.style.pointerEvents = 'auto';
                }, 10);
            } else {
                // Hide item
                product.classList.remove('animate-in');
                product.style.pointerEvents = 'none';

                // Wait for transition before setting display: none
                setTimeout(() => {
                    if (!product.classList.contains('animate-in')) {
                        product.style.display = 'none';
                    }
                }, 400); // Slightly less than the 0.6s transition in CSS
            }
        });
    };

    filters.forEach(filter => {
        filter.addEventListener('click', (e) => {
            const category = filter.getAttribute('data-filter');

            // Handle cross-page navigation vs in-page filtering
            const href = filter.getAttribute('href');
            if (!href || href === '#' || href.includes('menu.html')) {
                if (e.cancelable) e.preventDefault();
                filterProducts(category);

                // Update URL for sharing without reload
                const newUrl = new URL(window.location);
                newUrl.searchParams.set('category', category);
                window.history.pushState({}, '', newUrl);
            }
        });
    });

    // Check for URL parameter on load
    const urlParams = new URLSearchParams(window.location.search);
    const categoryParam = urlParams.get('category');
    if (categoryParam) {
        // Wait a bit for initial reveal animations to potentially start
        setTimeout(() => filterProducts(categoryParam), 100);
    }
}

// Password Visibility Toggle
function initPasswordToggle() {
    const toggles = document.querySelectorAll('.password-toggle');
    toggles.forEach(toggle => {
        toggle.addEventListener('click', () => {
            const input = toggle.previousElementSibling;
            if (input && (input.type === 'password' || input.id.includes('password'))) {
                const isPassword = input.type === 'password';
                input.type = isPassword ? 'text' : 'password';

                // Toggle icon
                toggle.classList.toggle('fa-eye');
                toggle.classList.toggle('fa-eye-slash');

                // Optional: Update title
                toggle.title = isPassword ? 'Hide password' : 'Show password';
            }
        });
    });
}

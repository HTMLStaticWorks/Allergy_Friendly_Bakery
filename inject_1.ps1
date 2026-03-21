$files = @("index.html", "index2.html", "about.html", "service.html", "product.html")

foreach ($f in $files) {
    if (Test-Path $f) {
        $content = [System.IO.File]::ReadAllText($f)
        $sections = ""

        if ($f -eq "index.html") {
            $sections = @"
    <!-- Section 1: Highlights -->
    <div class="container-xxl py-6">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <p class="text-primary text-uppercase fw-bold mb-2">// Why Choose Us</p>
                <h1 class="display-6 mb-4">Baked to Perfection</h1>
            </div>
            <div class="row g-4 justify-content-center">
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="bg-light rounded text-center h-100 p-5 hover-scale shadow-sm">
                        <div class="btn-lg-square bg-white text-primary rounded-circle mx-auto mb-4 border border-primary">
                            <i class="fa fa-leaf fa-2x icon-glow"></i>
                        </div>
                        <h4 class="mb-3">100% Organic</h4>
                        <p class="mb-0 text-justify">We only use the finest organic ingredients sourced from local farms for the purest taste.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="bg-light text-center h-100 p-5 hover-scale shadow-sm rounded" style="background-color: var(--primary) !important;">
                        <div class="btn-lg-square bg-white text-primary rounded-circle mx-auto mb-4 border border-light">
                            <i class="fa fa-clock fa-2x icon-glow"></i>
                        </div>
                        <h4 class="mb-3 text-white">Fresh Daily</h4>
                        <p class="mb-0 text-white text-justify">Our ovens start at 3 AM every morning so you can wake up to perfectly fresh pastries.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="bg-light rounded text-center h-100 p-5 hover-scale shadow-sm">
                        <div class="btn-lg-square bg-white text-primary rounded-circle mx-auto mb-4 border border-primary">
                            <i class="fa fa-heart fa-2x icon-glow"></i>
                        </div>
                        <h4 class="mb-3">Made with Love</h4>
                        <p class="mb-0 text-justify">Decades of passion and family recipes go into every single cake we bake for you.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Section 2: Image + Content -->
    <div class="container-xxl py-6 bg-light my-6">
        <div class="container">
            <div class="row g-5 align-items-center">
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="position-relative shadow-sm rounded overflow-hidden hover-scale">
                        <img class="img-fluid w-100" src="img/about-2.jpg" alt="">
                    </div>
                </div>
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.5s">
                    <p class="text-primary text-uppercase fw-bold mb-2">// The Art of Baking</p>
                    <h1 class="display-6 mb-4">Discover Our Mastery</h1>
                    <p class="mb-4 text-justify">Baking is our passion. Every slice, every crumb, and every bite brings out the timeless tradition of our artisanal techniques perfectly balanced with modern flavors.</p>
                    <a href="about.html" class="btn btn-primary rounded-pill py-3 px-5 hover-scale">Learn Our Story</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Section 3: Stats -->
    <div class="container-xxl py-6 mb-6">
        <div class="container">
            <div class="row g-4">
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="counter-box hover-scale">
                        <h1 class="display-4 text-primary mb-0" data-toggle="counter-up">25000</h1>
                        <h5 class="mt-2">Happy Customers</h5>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="counter-box hover-scale" style="background-color: var(--primary);">
                        <h1 class="display-4 text-white mb-0" data-toggle="counter-up">150</h1>
                        <h5 class="mt-2 text-white">Original Recipes</h5>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="counter-box hover-scale">
                        <h1 class="display-4 text-primary mb-0" data-toggle="counter-up">35</h1>
                        <h5 class="mt-2">Master Bakers</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>

"@
        } elseif ($f -eq "index2.html") {
            $sections = @"
    <!-- Section 1: Highlights -->
    <div class="container-xxl py-6">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <p class="text-primary text-uppercase fw-bold mb-2">// Our Specialities</p>
                <h1 class="display-6 mb-4">Signature Creations</h1>
            </div>
            <div class="row g-4 justify-content-center">
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="bg-light rounded text-center h-100 p-4 hover-scale shadow-sm">
                        <img src="img/product-1.jpg" class="img-fluid rounded mb-3" alt="">
                        <h5 class="mb-2">Pastries</h5>
                        <p class="mb-0 text-justify" style="font-size: 14px;">Flaky, buttery, and utterly irresistible daily.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="bg-light rounded text-center h-100 p-4 hover-scale shadow-sm">
                        <img src="img/product-2.jpg" class="img-fluid rounded mb-3" alt="">
                        <h5 class="mb-2">Rustic Breads</h5>
                        <p class="mb-0 text-justify" style="font-size: 14px;">Hearty and baked fresh with an artisan touch.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="bg-light rounded text-center h-100 p-4 hover-scale shadow-sm">
                        <img src="img/product-3.jpg" class="img-fluid rounded mb-3" alt="">
                        <h5 class="mb-2">Custom Cakes</h5>
                        <p class="mb-0 text-justify" style="font-size: 14px;">Beautiful designs personalized for your events.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.7s">
                    <div class="bg-light rounded text-center h-100 p-4 hover-scale shadow-sm">
                        <img src="img/product-1.jpg" class="img-fluid rounded mb-3" alt="">
                        <h5 class="mb-2">Sweet Delights</h5>
                        <p class="mb-0 text-justify" style="font-size: 14px;">Muffins and cookies that melt in your mouth.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Section 2: Content + Image -->
    <div class="container-xxl py-6 my-6" style="background-color: var(--primary);">
        <div class="container">
            <div class="row g-5 align-items-center flex-column-reverse flex-lg-row">
                <div class="col-lg-6 wow fadeInUp text-white" data-wow-delay="0.1s">
                    <p class="text-white text-uppercase fw-bold mb-2">// The Journey</p>
                    <h1 class="display-6 mb-4 text-white">Morning Freshness</h1>
                    <p class="mb-4 text-justify">A great day starts with great bread. Our bakers craft each loaf from scratch, ensuring that the aroma of warm, freshly baked goodness welcomes you the moment you step out.</p>
                    <a href="product.html" class="btn btn-dark rounded-pill py-3 px-5 hover-scale">Explore Menu</a>
                </div>
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="position-relative shadow rounded overflow-hidden hover-scale border border-light border-5">
                        <img class="img-fluid w-100" src="img/about-1.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Section 3: CTA Banner -->
    <div class="container-xxl mb-6 py-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container bg-light rounded text-center p-5 shadow-sm hover-scale">
            <h1 class="display-5 mb-4">Ready for something sweet?</h1>
            <p class="fs-5 mb-4">Indulge in our exquisite range of custom cakes tailored to your taste!</p>
            <a href="contact.html" class="btn btn-primary rounded-pill py-3 px-5 hover-scale">Order Your Custom Cake Today</a>
        </div>
    </div>

"@
        } elseif ($f -eq "about.html") {
            $sections = @"
    <!-- Section 1: Highlights -->
    <div class="container-xxl py-6 bg-light">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <p class="text-primary text-uppercase fw-bold mb-2">// Our Values</p>
                <h1 class="display-6 mb-4">What Drives Us</h1>
            </div>
            <div class="row g-4 justify-content-center">
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="bg-white rounded text-center h-100 p-5 hover-scale shadow-sm">
                        <div class="btn-lg-square bg-primary text-white rounded-circle mx-auto mb-4">
                            <i class="fa fa-scroll fa-2x icon-glow"></i>
                        </div>
                        <h4 class="mb-3">Tradition</h4>
                        <p class="mb-0 text-justify">Honoring the time-tested techniques that guarantee a perfectly golden crust every time.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="bg-white rounded text-center h-100 p-5 hover-scale shadow-sm">
                        <div class="btn-lg-square bg-primary text-white rounded-circle mx-auto mb-4">
                            <i class="fa fa-users fa-2x icon-glow"></i>
                        </div>
                        <h4 class="mb-3">Community</h4>
                        <p class="mb-0 text-justify">A bakery is the heart of a neighborhood. We are proud to serve and support our local community.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="bg-white rounded text-center h-100 p-5 hover-scale shadow-sm">
                        <div class="btn-lg-square bg-primary text-white rounded-circle mx-auto mb-4">
                            <i class="fa fa-star fa-2x icon-glow"></i>
                        </div>
                        <h4 class="mb-3">Quality</h4>
                        <p class="mb-0 text-justify">Uncompromising standards in every ingredient and every recipe we produce.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Section 2: Content + Image -->
    <div class="container-xxl py-6 my-6">
        <div class="container">
            <div class="row g-5 align-items-center">
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="position-relative shadow-sm rounded overflow-hidden hover-scale border border-primary p-2">
                        <img class="img-fluid w-100 rounded" src="img/team-1.jpg" alt="">
                    </div>
                </div>
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.5s">
                    <p class="text-primary text-uppercase fw-bold mb-2">// The Visionary</p>
                    <h1 class="display-6 mb-4">Meet the Founder</h1>
                    <p class="mb-4 text-justify">Started by John Baker in 1974, our dream was always to provide the freshest and highest-quality bread to the city. Decades later, our founder's vision still guides every batch we bake.</p>
                    <a href="contact.html" class="btn btn-outline-primary rounded-pill py-3 px-5 hover-scale">Get in Touch</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Section 3: Testimonials -->
    <div class="container-xxl py-6 bg-light mb-6">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <p class="text-primary text-uppercase mb-2">// Word of Mouth</p>
                <h1 class="display-6 mb-4">What Locals Say</h1>
            </div>
            <div class="row g-4 justify-content-center">
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="bg-white p-4 rounded shadow-sm hover-scale text-center">
                        <i class="fa fa-quote-left fa-3x text-primary mb-3"></i>
                        <p class="fs-5 text-justify">"Absolutely the best sourdough in town. I come here every Saturday morning."</p>
                        <h5 class="mb-1 text-primary">- Sarah J.</h5>
                    </div>
                </div>
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="bg-primary p-4 rounded shadow-sm hover-scale text-center text-white">
                        <i class="fa fa-quote-left fa-3x text-white mb-3"></i>
                        <p class="fs-5 text-white text-justify">"Their vegan options are incredible. The chocolate cake is to die for!"</p>
                        <h5 class="mb-1 text-white">- Mark D.</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>

"@
        } elseif ($f -eq "service.html") {
            $sections = @"
    <!-- Section 1: Highlights -->
    <div class="container-xxl py-6 bg-light">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <p class="text-primary text-uppercase fw-bold mb-2">// Make it Special</p>
                <h1 class="display-6 mb-4">Catering Options</h1>
            </div>
            <div class="row g-4 justify-content-center">
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="bg-white rounded text-center h-100 p-5 hover-scale shadow-sm">
                        <div class="btn-lg-square bg-primary text-white rounded-circle mx-auto mb-4">
                            <i class="fa fa-ring fa-2x icon-glow"></i>
                        </div>
                        <h4 class="mb-3">Weddings</h4>
                        <p class="mb-0 text-justify">Elegant multi-tier cakes and dessert tables crafted for your perfect day.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="bg-white rounded text-center h-100 p-5 hover-scale shadow-sm">
                        <div class="btn-lg-square bg-primary text-white rounded-circle mx-auto mb-4">
                            <i class="fa fa-briefcase fa-2x icon-glow"></i>
                        </div>
                        <h4 class="mb-3">Corporate Events</h4>
                        <p class="mb-0 text-justify">Impress your clients with our premium selections of pastries and coffee splits.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="bg-white rounded text-center h-100 p-5 hover-scale shadow-sm">
                        <div class="btn-lg-square bg-primary text-white rounded-circle mx-auto mb-4">
                            <i class="fa fa-birthday-cake fa-2x icon-glow"></i>
                        </div>
                        <h4 class="mb-3">Birthday Parties</h4>
                        <p class="mb-0 text-justify">Fun, customizable cakes that the whole family will love and remember.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Section 2: Content + Image -->
    <div class="container-xxl py-6 my-6">
        <div class="container">
            <div class="row g-5 align-items-center flex-column-reverse flex-lg-row">
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                    <p class="text-primary text-uppercase fw-bold mb-2">// Hassle-free</p>
                    <h1 class="display-6 mb-4">Event Planning Made Easy</h1>
                    <p class="mb-4 text-justify">Organizing an event is stressful enough without worrying about the dessert. Our team will handle everything from baking to setup, so you can enjoy your special day to the fullest.</p>
                    <a href="contact.html" class="btn btn-primary rounded-pill py-3 px-5 hover-scale">Request A Quote</a>
                </div>
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="position-relative shadow-sm rounded overflow-hidden hover-scale border border-primary p-2">
                        <img class="img-fluid w-100 rounded" src="img/service-1.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Section 3: Stats -->
    <div class="container-xxl py-6 bg-primary mb-6">
        <div class="container">
            <div class="row g-4 text-center text-white">
                <div class="col-lg-6 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="counter-box bg-dark hover-scale">
                        <h1 class="display-4 text-primary mb-0" data-toggle="counter-up">500</h1>
                        <h5 class="mt-2 text-white">Events Catered</h5>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="counter-box bg-light hover-scale">
                        <h1 class="display-4 text-primary mb-0" data-toggle="counter-up">1200</h1>
                        <h5 class="mt-2 text-dark">Menus Created</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>

"@
        } elseif ($f -eq "product.html") {
            $sections = @"
    <!-- Section 1: Highlights -->
    <div class="container-xxl py-6 bg-light">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <p class="text-primary text-uppercase fw-bold mb-2">// Top Quality</p>
                <h1 class="display-6 mb-4">Featured Ingredients</h1>
            </div>
            <div class="row g-4 justify-content-center">
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="bg-white rounded text-center h-100 p-4 hover-scale shadow-sm border-top border-5 border-primary">
                        <h5 class="mb-3 mt-2">Madagascar Vanilla</h5>
                        <p class="mb-0 text-justify" style="font-size: 14px;">The richest, most authentic vanilla for our cakes.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="bg-white rounded text-center h-100 p-4 hover-scale shadow-sm border-top border-5 border-primary">
                        <h5 class="mb-3 mt-2">Belgian Dark Coco</h5>
                        <p class="mb-0 text-justify" style="font-size: 14px;">Deep, flavorful cocoa for the ultimate brownie bite.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="bg-white rounded text-center h-100 p-4 hover-scale shadow-sm border-top border-5 border-primary">
                        <h5 class="mb-3 mt-2">Artisan Sea Salt</h5>
                        <p class="mb-0 text-justify" style="font-size: 14px;">Perfectly balances the sweetness in our cookies.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.7s">
                    <div class="bg-white rounded text-center h-100 p-4 hover-scale shadow-sm border-top border-5 border-primary">
                        <h5 class="mb-3 mt-2">Organic Flour</h5>
                        <p class="mb-0 text-justify" style="font-size: 14px;">Unbleached and natural for a lighter, healthier loaf.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Section 2: Content + Image -->
    <div class="container-xxl py-6 my-6">
        <div class="container">
            <div class="row g-5 align-items-center">
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="position-relative shadow-sm rounded overflow-hidden hover-scale border-start border-5 border-primary">
                        <img class="img-fluid w-100" src="img/about-2.jpg" alt="">
                    </div>
                </div>
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.5s">
                    <p class="text-primary text-uppercase fw-bold mb-2">// Behind the Scenes</p>
                    <h1 class="display-6 mb-4">Our Baking Process Unveiled</h1>
                    <p class="mb-4 text-justify">It takes patience, skill, and perfect timing to bake a product we are truly proud of. We combine traditional resting times with highly controlled baking temperatures to seal in the flavor and perfect the crumb structure.</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Section 3: CTA Banner -->
    <div class="container-xxl mb-6 py-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container bg-primary text-white rounded text-center p-5 shadow-sm hover-scale header-carousel" style="background: linear-gradient(rgba(0, 0, 0, .5), rgba(0, 0, 0, .5)), url(img/carousel-2.jpg) center center no-repeat; background-size: cover;">
            <h1 class="display-5 mb-4 text-white">Want to see all our treats?</h1>
            <p class="fs-5 mb-4 text-white">Get our full PDF menu with exclusive bakery specials.</p>
            <a href="#" class="btn btn-light text-primary rounded-pill py-3 px-5 hover-scale">Download Our Full Menu</a>
        </div>
    </div>

"@
        }

        # Inject sections before <!-- Footer Start -->
        if ($sections -ne "") {
            $content = $content -replace '(?s)(?=<!-- Footer Start -->)', "$sections`n"
            [System.IO.File]::WriteAllText($f, $content, [System.Text.Encoding]::UTF8)
        }
    }
}
Write-Output "Successfully injected sections part 1"

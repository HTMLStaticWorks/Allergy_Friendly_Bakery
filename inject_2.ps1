$files = @("team.html", "testimonial.html", "404.html", "contact.html", "dashboard.html")

foreach ($f in $files) {
    if (Test-Path $f) {
        $content = [System.IO.File]::ReadAllText($f)
        $sections = ""

        if ($f -eq "team.html") {
            $sections = @"
    <!-- Section 1: Highlights -->
    <div class="container-xxl py-6 bg-light">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <p class="text-primary text-uppercase fw-bold mb-2">// Careers</p>
                <h1 class="display-6 mb-4">Join Our Team</h1>
            </div>
            <div class="row g-4 justify-content-center">
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="bg-white rounded text-center h-100 p-5 hover-scale shadow-sm">
                        <div class="btn-lg-square bg-primary text-white rounded-circle mx-auto mb-4">
                            <i class="fa fa-bread-slice fa-2x icon-glow"></i>
                        </div>
                        <h4 class="mb-3">Master Bakers</h4>
                        <p class="mb-0 text-justify">Bring your passion for baking to our expanding kitchen team.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="bg-white rounded text-center h-100 p-5 hover-scale shadow-sm">
                        <div class="btn-lg-square bg-primary text-white rounded-circle mx-auto mb-4">
                            <i class="fa fa-paint-brush fa-2x icon-glow"></i>
                        </div>
                        <h4 class="mb-3">Cake Decorators</h4>
                        <p class="mb-0 text-justify">Showcase your artistic flair by designing custom wedding cakes.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="bg-white rounded text-center h-100 p-5 hover-scale shadow-sm">
                        <div class="btn-lg-square bg-primary text-white rounded-circle mx-auto mb-4">
                            <i class="fa fa-motorcycle fa-2x icon-glow"></i>
                        </div>
                        <h4 class="mb-3">Delivery Experts</h4>
                        <p class="mb-0 text-justify">Help us transport happiness securely to our local customers.</p>
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
                    <p class="text-primary text-uppercase fw-bold mb-2">// Culture</p>
                    <h1 class="display-6 mb-4">Life at the Bakery</h1>
                    <p class="mb-4 text-justify">We are more than just a workplace. We are a family of individuals deeply passionate about bringing joy to our community through food. Expect early mornings, lots of flour, and endless fun.</p>
                    <a href="contact.html" class="btn btn-primary rounded-pill py-3 px-5 hover-scale">Apply Today</a>
                </div>
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="position-relative shadow-sm rounded overflow-hidden hover-scale border border-primary p-2">
                        <img class="img-fluid w-100 rounded" src="img/team-2.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Section 3: Testimonials -->
    <div class="container-xxl py-6 bg-primary mb-6">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <p class="text-white text-uppercase mb-2">// Employee Voices</p>
                <h1 class="display-6 mb-4 text-white">Why They Love It</h1>
            </div>
            <div class="row g-4 justify-content-center">
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="bg-white p-4 rounded shadow-sm hover-scale text-center">
                        <p class="fs-5 text-justify">"I've worked here for 5 years and the supportive environment keeps me motivated every single day."</p>
                        <h5 class="mb-1 text-primary">- Jessica P, Manager</h5>
                    </div>
                </div>
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="bg-dark p-4 rounded shadow-sm hover-scale text-center text-white">
                        <p class="fs-5 text-white text-justify">"There is nothing better than seeing a customer smile when they receive a cake I designed."</p>
                        <h5 class="mb-1 text-primary">- David M, Decorator</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>

"@
        } elseif ($f -eq "testimonial.html") {
            $sections = @"
    <!-- Section 1: Highlights -->
    <div class="container-xxl py-6 bg-light">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <p class="text-primary text-uppercase fw-bold mb-2">// External Reviews</p>
                <h1 class="display-6 mb-4">Find Us On</h1>
            </div>
            <div class="row g-4 justify-content-center">
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="bg-white rounded text-center h-100 p-4 hover-scale shadow-sm">
                        <i class="fab fa-google fa-3x text-primary mb-3 icon-glow"></i>
                        <h4 class="mb-2">Google</h4>
                        <p class="mb-0 text-justify">4.9/5 Average Rating based on 1.2k local reviews in our area.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="bg-white rounded text-center h-100 p-4 hover-scale shadow-sm">
                        <i class="fab fa-yelp fa-3x text-primary mb-3 icon-glow"></i>
                        <h4 class="mb-2">Yelp</h4>
                        <p class="mb-0 text-justify">Voted #1 Artisan Bakery for 3 consecutive years by our community.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="bg-white rounded text-center h-100 p-4 hover-scale shadow-sm">
                        <i class="fab fa-facebook fa-3x text-primary mb-3 icon-glow"></i>
                        <h4 class="mb-2">Facebook</h4>
                        <p class="mb-0 text-justify">Engaging with over 10,000 followers and daily interactive updates.</p>
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
                        <img class="img-fluid w-100 rounded" src="img/carousel-2.jpg" alt="">
                    </div>
                </div>
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.5s">
                    <p class="text-primary text-uppercase fw-bold mb-2">// Your Opinion</p>
                    <h1 class="display-6 mb-4">Share Your Feedback</h1>
                    <p class="mb-4 text-justify">We are constantly striving to improve and bring you the very best. Have an experience you'd like to share? Your feedback shapes the future of our bakery.</p>
                    <a href="contact.html" class="btn btn-primary rounded-pill py-3 px-5 hover-scale">Leave a Review</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Section 3: Stats -->
    <div class="container-xxl py-6 mb-6 bg-dark">
        <div class="container">
            <div class="row g-4 text-center">
                <div class="col-12 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="counter-box bg-light hover-scale d-inline-block px-5">
                        <h1 class="display-3 text-primary mb-0" data-toggle="counter-up">5000</h1>
                        <h3 class="mt-2 text-dark">+ Total 5-Star Reviews</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>

"@
        } elseif ($f -eq "404.html") {
            $sections = @"
    <!-- Section 1: Highlights -->
    <div class="container-xxl py-6 bg-light">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <p class="text-primary text-uppercase fw-bold mb-2">// Navigational Help</p>
                <h1 class="display-6 mb-4">Popular Links</h1>
            </div>
            <div class="row g-4 justify-content-center">
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <a href="index.html" class="d-block text-decoration-none">
                        <div class="bg-white rounded text-center h-100 p-5 hover-scale shadow-sm border border-primary">
                            <i class="fa fa-home fa-3x text-primary mb-3 icon-glow"></i>
                            <h4 class="mb-3 text-dark">Home Page</h4>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <a href="product.html" class="d-block text-decoration-none">
                        <div class="bg-white rounded text-center h-100 p-5 hover-scale shadow-sm border border-primary">
                            <i class="fa fa-shopping-bag fa-3x text-primary mb-3 icon-glow"></i>
                            <h4 class="mb-3 text-dark">Our Shop</h4>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <a href="contact.html" class="d-block text-decoration-none">
                        <div class="bg-white rounded text-center h-100 p-5 hover-scale shadow-sm border border-primary">
                            <i class="fa fa-envelope fa-3x text-primary mb-3 icon-glow"></i>
                            <h4 class="mb-3 text-dark">Contact Us</h4>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Section 2: Content + Image -->
    <div class="container-xxl py-6 my-6">
        <div class="container">
            <div class="row g-5 align-items-center flex-column-reverse flex-lg-row">
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                    <p class="text-primary text-uppercase fw-bold mb-2">// Lost your way?</p>
                    <h1 class="display-6 mb-4">Even our bakers get lost sometimes</h1>
                    <p class="mb-4 text-justify">It looks like the page you are searching for is currently not available, moved, or deleted. Don't worry, there's always fresh bread waiting on the home page.</p>
                </div>
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="position-relative shadow-sm rounded overflow-hidden hover-scale">
                        <img class="img-fluid w-100 rounded" src="img/service-2.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Section 3: CTA Banner -->
    <div class="container-xxl mb-6 py-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container bg-primary rounded text-center p-5 shadow-sm hover-scale">
            <h1 class="display-5 mb-4 text-white">Let's get you back!</h1>
            <a href="index.html" class="btn btn-light text-primary rounded-pill py-3 px-5 hover-scale fw-bold mt-2">Go Back to Shopping</a>
        </div>
    </div>

"@
        } elseif ($f -eq "contact.html") {
            $sections = @"
    <!-- Section 1: Highlights -->
    <div class="container-xxl py-6 bg-light">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <p class="text-primary text-uppercase fw-bold mb-2">// Locations</p>
                <h1 class="display-6 mb-4">Visit Us</h1>
            </div>
            <div class="row g-4 justify-content-center">
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="bg-white rounded text-center h-100 p-4 hover-scale shadow-sm">
                        <i class="fa fa-map-marker-alt fa-3x text-primary mb-3 icon-glow"></i>
                        <h4 class="mb-2">Downtown Store</h4>
                        <p class="mb-0 text-justify">123 Street, New York, USA<br>Open 6 AM - 8 PM</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="bg-white rounded text-center h-100 p-4 hover-scale shadow-sm">
                        <i class="fa fa-map-marker-alt fa-3x text-primary mb-3 icon-glow"></i>
                        <h4 class="mb-2">Brooklyn Branch</h4>
                        <p class="mb-0 text-justify">456 Avenue, Brooklyn, NY<br>Open 7 AM - 9 PM</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="bg-white rounded text-center h-100 p-4 hover-scale shadow-sm">
                        <i class="fa fa-map-marker-alt fa-3x text-primary mb-3 icon-glow"></i>
                        <h4 class="mb-2">Queens Outlet</h4>
                        <p class="mb-0 text-justify">789 Blvd, Queens, NY<br>Open 6 AM - 7 PM</p>
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
                        <img class="img-fluid w-100 rounded" src="img/about-1.jpg" alt="">
                    </div>
                </div>
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.5s">
                    <p class="text-primary text-uppercase fw-bold mb-2">// Connect</p>
                    <h1 class="display-6 mb-4">We Love Hearing From You</h1>
                    <p class="mb-4 text-justify">Whether you have a question about an order, want to learn more about our gluten-free options, or simply want to say hi, our dedicated support team is here to help you.</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Section 3: Stats -->
    <div class="container-xxl py-6 mb-6">
        <div class="container">
            <div class="row g-4 text-center">
                <div class="col-lg-6 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="counter-box bg-dark hover-scale">
                        <h1 class="display-4 text-primary mb-0"><span data-toggle="counter-up">2</span> Hrs</h1>
                        <h5 class="mt-2 text-white">Average Email Response Time</h5>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="counter-box bg-primary hover-scale">
                        <h1 class="display-4 text-white mb-0"><span data-toggle="counter-up">15</span> Mins</h1>
                        <h5 class="mt-2 text-white">Average Delivery Delay</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>

"@
        } elseif ($f -eq "dashboard.html") {
            $sections = @"
    <!-- Section 1: Highlights (Analytics Grid) -->
    <div class="container-xxl py-5 bg-transparent">
        <div class="container">
            <h4 class="mb-4 wow fadeInUp" data-wow-delay="0.1s"><i class="fa fa-bolt text-primary me-2"></i>Quick Actions</h4>
            <div class="row g-4">
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="bg-white rounded h-100 p-4 hover-scale shadow-sm border-start border-5 border-primary">
                        <div class="d-flex align-items-center">
                            <i class="fa fa-plus-circle fa-2x text-primary me-3 icon-glow"></i>
                            <h5 class="mb-0">New Order</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="bg-white rounded h-100 p-4 hover-scale shadow-sm border-start border-5 border-primary">
                        <div class="d-flex align-items-center">
                            <i class="fa fa-chart-line fa-2x text-primary me-3 icon-glow"></i>
                            <h5 class="mb-0">Analytics</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="bg-white rounded h-100 p-4 hover-scale shadow-sm border-start border-5 border-primary">
                        <div class="d-flex align-items-center">
                            <i class="fa fa-envelope fa-2x text-primary me-3 icon-glow"></i>
                            <h5 class="mb-0">Messages</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.7s">
                    <div class="bg-white rounded h-100 p-4 hover-scale shadow-sm border-start border-5 border-primary">
                        <div class="d-flex align-items-center">
                            <i class="fa fa-cog fa-2x text-primary me-3 icon-glow"></i>
                            <h5 class="mb-0">Settings</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Section 2: Content + Image (Chart) -->
    <div class="container-xxl py-5 bg-transparent my-3">
        <div class="container">
            <div class="row g-5 align-items-center bg-white rounded shadow-sm p-4 wow fadeInUp" data-wow-delay="0.1s">
                <div class="col-lg-7">
                    <div class="position-relative rounded overflow-hidden hover-scale border" style="background: #f8f9fa;">
                        <!-- Mocking a chart visual -->
                        <div class="p-5 text-center" style="height: 300px; display:flex; flex-direction:column; justify-content:flex-end; gap: 10px;">
                            <div class="d-flex align-items-end justify-content-around h-100 w-100">
                                <div class="bg-primary hover-scale rounded-top" style="width: 15%; height: 40%;"></div>
                                <div class="bg-primary hover-scale rounded-top" style="width: 15%; height: 60%; opacity: 0.8;"></div>
                                <div class="bg-primary hover-scale rounded-top" style="width: 15%; height: 35%;"></div>
                                <div class="bg-primary hover-scale rounded-top" style="width: 15%; height: 80%;"></div>
                                <div class="bg-primary hover-scale rounded-top" style="width: 15%; height: 100%; opacity: 0.9;"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5">
                    <h4 class="mb-4"><i class="fa fa-chart-pie text-primary me-2"></i>Weekly Performance Insights</h4>
                    <p class="mb-4 text-justify">Your engagement and orders are up by <strong>24%</strong> compared to last week. The most popular item ordered was the Artisan Sourdough.</p>
                    <a href="#" class="btn btn-outline-primary rounded-pill py-2 px-4 hover-scale">Generate Full Report</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Section 3: Live Metrics -->
    <div class="container-xxl py-5 mb-5 bg-transparent">
        <div class="container">
            <h4 class="mb-4 wow fadeInUp" data-wow-delay="0.1s"><i class="fa fa-tachometer-alt text-primary me-2"></i>Live Metrics</h4>
            <div class="row g-4">
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="counter-box hover-scale p-4 d-flex flex-column justify-content-center h-100 border border-light">
                        <p class="text-muted mb-1 text-uppercase fw-bold" style="font-size: 12px;">Total Revenue</p>
                        <h2 class="text-dark mb-0">$<span data-toggle="counter-up">12450</span></h2>
                        <small class="text-success"><i class="fa fa-arrow-up"></i> 15%</small>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="counter-box hover-scale p-4 d-flex flex-column justify-content-center h-100 border border-light">
                        <p class="text-muted mb-1 text-uppercase fw-bold" style="font-size: 12px;">Unique Visitors</p>
                        <h2 class="text-dark mb-0" data-toggle="counter-up">3480</h2>
                        <small class="text-success"><i class="fa fa-arrow-up"></i> 8%</small>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="counter-box hover-scale p-4 d-flex flex-column justify-content-center h-100 border border-light">
                        <p class="text-muted mb-1 text-uppercase fw-bold" style="font-size: 12px;">Conversion Rate</p>
                        <h2 class="text-dark mb-0"><span data-toggle="counter-up">12</span>%</h2>
                        <small class="text-danger"><i class="fa fa-arrow-down"></i> 2%</small>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.7s">
                    <div class="counter-box hover-scale p-4 d-flex flex-column justify-content-center h-100 border border-light text-white" style="background-color: var(--primary);">
                        <p class="text-light mb-1 text-uppercase fw-bold" style="font-size: 12px;">Bounce Rate</p>
                        <h2 class="text-white mb-0"><span data-toggle="counter-up">45</span>%</h2>
                        <small class="text-white opacity-75"><i class="fa fa-minus"></i> 0%</small>
                    </div>
                </div>
            </div>
        </div>
    </div>

"@
        }

        # Inject sections before <!-- Footer Start -->
        # For Dashboard, it has custom wrappers, but injecting before footer still works well and looks standard
        if ($sections -ne "") {
            $content = $content -replace '(?s)(?=<!-- Footer Start -->)', "$sections`n"
            [System.IO.File]::WriteAllText($f, $content, [System.Text.Encoding]::UTF8)
        }
    }
}
Write-Output "Successfully injected sections part 2"

$nav_replacement = @"
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav mx-auto p-4 p-lg-0">
                <a href="index.html" class="nav-item nav-link">Home</a>
                <a href="about.html" class="nav-item nav-link">About</a>
                <a href="service.html" class="nav-item nav-link">Services</a>
                <a href="product.html" class="nav-item nav-link">Products</a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                    <div class="dropdown-menu m-0">
                        <a href="team.html" class="dropdown-item">Our Team</a>
                        <a href="testimonial.html" class="dropdown-item">Testimonial</a>
                        <a href="404.html" class="dropdown-item">404 Page</a>
                        <a href="index2.html" class="dropdown-item">Home v2</a>
                    </div>
                </div>
                <a href="contact.html" class="nav-item nav-link">Contact</a>
                <a href="dashboard.html" class="nav-item nav-link">Dashboard</a>
            </div>
            <div class="d-flex align-items-center ms-lg-3">
                <a href="login.html" class="btn btn-primary rounded-pill py-2 px-4 me-3">Login</a>
                <button id="rtlToggle" class="btn btn-sm btn-outline-light rounded-circle border-light me-2" title="Toggle RTL" style="width: 32px; height: 32px; padding: 0; display: flex; align-items: center; justify-content: center;">
                    <span id="rtlText" style="font-size: 10px; font-weight: bold;">RTL</span>
                </button>
                <button id="themeToggle" class="btn btn-sm btn-outline-light rounded-circle border-light" title="Toggle theme" style="width: 32px; height: 32px; padding: 0; display: flex; align-items: center; justify-content: center;">
                    <i class="bi bi-moon-fill" id="themeIcon"></i>
                </button>
            </div>
        </div>
"@

$htmlFiles = Get-ChildItem -Path . -Filter *.html

foreach ($file in $htmlFiles) {
    $content = [System.IO.File]::ReadAllText($file.FullName)
    
    # Update the navbar
    $regexNav = '(?s)<div class="collapse navbar-collapse" id="navbarCollapse">.*?</div>\s*</nav>'
    $content = [System.Text.RegularExpressions.Regex]::Replace($content, $regexNav, "$nav_replacement`n    </nav>")

    # Set active class based on filename
    $basename = $file.Name
    $content = $content -replace 'class="nav-item nav-link active"', 'class="nav-item nav-link"'
    $content = $content -replace 'class="nav-link dropdown-toggle active"', 'class="nav-link dropdown-toggle"'
    $content = $content -replace 'class="dropdown-item active"', 'class="dropdown-item"'

    $content = $content -replace "href=`"$basename`" class=`"nav-item nav-link`"", "href=`"$basename`" class=`"nav-item nav-link active`""
    $content = $content -replace "href=`"$basename`" class=`"dropdown-item`"", "href=`"$basename`" class=`"dropdown-item active`""
    
    if ($basename -in @('team.html', 'testimonial.html', '404.html', 'index2.html')) {
        $content = $content -replace 'class="nav-link dropdown-toggle"', 'class="nav-link dropdown-toggle active"'
    }

    [System.IO.File]::WriteAllText($file.FullName, $content, [System.Text.Encoding]::UTF8)
}
Write-Output "Successfully updated navbars to have Login as a button."

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
                <a href="dashboard.html" class="nav-item nav-link">Dashboard</a>
                <a href="login.html" class="nav-item nav-link">Login</a>
                <a href="contact.html" class="nav-item nav-link">Contact</a>
            </div>
            <div class="d-flex align-items-center ms-lg-3">
                <button id="rtlToggle" class="btn btn-sm btn-outline-light rounded-circle border-light me-2" title="Toggle RTL" style="width: 32px; height: 32px; padding: 0; display: flex; align-items: center; justify-content: center;">
                    <span id="rtlText" style="font-size: 10px; font-weight: bold;">RTL</span>
                </button>
                <button id="themeToggle" class="btn btn-sm btn-outline-light rounded-circle border-light" title="Toggle theme" style="width: 32px; height: 32px; padding: 0; display: flex; align-items: center; justify-content: center;">
                    <i class="bi bi-moon-fill" id="themeIcon"></i>
                </button>
            </div>
        </div>
"@

$script_replacement = @"
    <script>
        // RTL Toggle
        const rtlToggle = document.getElementById('rtlToggle');
        const rtlText = document.getElementById('rtlText');
        const htmlElement = document.documentElement;

        const savedDir = localStorage.getItem('bakerDir') || 'ltr';
        htmlElement.setAttribute('dir', savedDir);
        
        if (savedDir === 'rtl') {
            document.body.classList.add('text-end');
            if(rtlText) rtlText.innerText = 'LTR';
        } else {
            document.body.classList.remove('text-end');
            if(rtlText) rtlText.innerText = 'RTL';
        }

        if(rtlToggle) {
            rtlToggle.addEventListener('click', () => {
                const currentDir = htmlElement.getAttribute('dir');
                const newDir = currentDir === 'ltr' ? 'rtl' : 'ltr';
                
                htmlElement.setAttribute('dir', newDir);
                localStorage.setItem('bakerDir', newDir);
                
                if (newDir === 'rtl') {
                    document.body.classList.add('text-end');
                    if(rtlText) rtlText.innerText = 'LTR';
                } else {
                    document.body.classList.remove('text-end');
                    if(rtlText) rtlText.innerText = 'RTL';
                }
            });
        }

        // Theme Toggle
        const themeToggle = document.getElementById('themeToggle');
        const themeIcon = document.getElementById('themeIcon');

        const savedTheme = localStorage.getItem('bakerTheme') || 'dark';
        htmlElement.setAttribute('data-theme', savedTheme);
        updateIcon(savedTheme);

        if(themeToggle) {
            themeToggle.addEventListener('click', () => {
                const currentTheme = htmlElement.getAttribute('data-theme');
                const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
                
                htmlElement.setAttribute('data-theme', newTheme);
                localStorage.setItem('bakerTheme', newTheme);
                updateIcon(newTheme);
            });
        }

        function updateIcon(theme) {
            if (!themeIcon || !themeToggle) return;
            if (theme === 'light') {
                themeIcon.classList.replace('bi-moon-fill', 'bi-sun-fill');
                themeToggle.classList.replace('btn-outline-light', 'btn-outline-dark');
                themeToggle.classList.replace('border-light', 'border-dark');
                if(rtlToggle) {
                   rtlToggle.classList.replace('btn-outline-light', 'btn-outline-dark');
                   rtlToggle.classList.replace('border-light', 'border-dark');
                }
            } else {
                themeIcon.classList.replace('bi-sun-fill', 'bi-moon-fill');
                themeToggle.classList.replace('btn-outline-dark', 'btn-outline-light');
                themeToggle.classList.replace('border-dark', 'border-light');
                if(rtlToggle) {
                   rtlToggle.classList.replace('btn-outline-dark', 'btn-outline-light');
                   rtlToggle.classList.replace('border-dark', 'border-light');
                }
            }
        }
    </script>
"@

$htmlFiles = Get-ChildItem -Path . -Filter *.html

foreach ($file in $htmlFiles) {
    # Read entire content as a single string
    $content = [System.IO.File]::ReadAllText($file.FullName)
    
    # Replace the navbar block
    # Regex match from <div class="collapse navbar-collapse" to nearest </div>\s*</nav>
    $regexNav = '(?s)<div class="collapse navbar-collapse" id="navbarCollapse">.*?</div>\s*</nav>'
    $content = [System.Text.RegularExpressions.Regex]::Replace($content, $regexNav, "$nav_replacement`n    </nav>")

    # Add active class back logically based on filename
    $basename = $file.Name
    $content = $content -replace 'class="nav-item nav-link active"', 'class="nav-item nav-link"'
    $content = $content -replace 'class="nav-link dropdown-toggle active"', 'class="nav-link dropdown-toggle"'
    $content = $content -replace 'class="dropdown-item active"', 'class="dropdown-item"'

    $content = $content -replace "href=`"$basename`" class=`"nav-item nav-link`"", "href=`"$basename`" class=`"nav-item nav-link active`""
    $content = $content -replace "href=`"$basename`" class=`"dropdown-item`"", "href=`"$basename`" class=`"dropdown-item active`""
    
    if ($basename -in @('team.html', 'testimonial.html', '404.html', 'index2.html')) {
        $content = $content -replace 'class="nav-link dropdown-toggle"', 'class="nav-link dropdown-toggle active"'
    }

    # Replace the old theme script
    $regexScript = '(?s)<script>\s*const themeToggle = document.getElementById\(''themeToggle''\);.*?</script>'
    if ($content -match $regexScript) {
        $content = [System.Text.RegularExpressions.Regex]::Replace($content, $regexScript, $script_replacement)
    } else {
        # Fallback: add before </body>
        $content = $content -replace '</body>', "$script_replacement`n</body>"
    }

    [System.IO.File]::WriteAllText($file.FullName, $content, [System.Text.Encoding]::UTF8)
}
Write-Output "Successfully updated navbars."

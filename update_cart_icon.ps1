$files = @(
    "index.html",
    "product.html",
    "testimonial.html",
    "team.html",
    "service.html",
    "index2.html",
    "about.html",
    "404.html",
    "contact.html",
    "dashboard.html"
)

$target = '<a href="login.html" class="btn btn-primary rounded-pill py-2 px-4 me-3 mt-3 mt-lg-0">Login</a>'
$replacement = @"
<a href="login.html" class="btn btn-primary rounded-pill py-2 px-4 me-3 mt-3 mt-lg-0">Login</a>
                <a href="cart.html" class="btn btn-sm btn-outline-light rounded-circle border-light me-2 mt-3 mt-lg-0" title="Shopping Cart" style="width: 32px; height: 32px; padding: 0; display: flex; align-items: center; justify-content: center; position: relative;">
                    <i class="bi bi-cart-fill"></i>
                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-primary" id="cartCount" style="font-size: 0.6rem;">0</span>
                </a>
"@

foreach ($file in $files) {
    $path = Join-Path "c:\slot 4\Allergy-Friendly Bakery (Gluten-Free, Vegan)" $file
    if (Test-Path $path) {
        $content = Get-Content $path -Raw
        if ($content -like "*$target*" -and $content -notlike "*cartCount*") {
            $content = $content.Replace($target, $replacement)
            Set-Content $path $content -NoNewline
            Write-Host "Updated $file"
        } else {
            Write-Host "Skipped $file (not found or already updated)"
        }
    } else {
        Write-Host "File not found: $path"
    }
}

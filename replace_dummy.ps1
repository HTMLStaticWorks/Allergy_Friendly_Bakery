$files = Get-ChildItem -Path . -Filter *.html

# Replacements array of hashtables holding the pattern and the replacement text
$replacements = @(
    @{
        # Session 1
        Pattern = "Session 1"
        Replacement = "Quality Ingredients"
    },
    @{
        Pattern = "Lorem ipsum dolor sit amet, consectetur adipiscing elit\. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua\."
        Replacement = "We source only the highest quality organic flour and the freshest dairy to ensure our products taste exceptional."
    },
    @{
        # Session 2
        Pattern = "Session 2"
        Replacement = "Master Bakers"
    },
    @{
        Pattern = "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat\."
        Replacement = "Our experienced team of bakers brings decades of passion and skill to every loaf, cake, and pastry."
    },
    @{
        # Session 3
        Pattern = "Session 3"
        Replacement = "Baked Fresh Daily"
    },
    @{
        Pattern = "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur\."
        Replacement = "Every morning, our ovens are fired up before dawn so you can enjoy warm, fresh bread straight from the bakery."
    },
    @{
        Pattern = "Tempor erat elitr rebum at clita\. Diam dolor diam ipsum sit\. Aliqu diam amet diam et eos\.\s*Clita erat ipsum et lorem et sit, sed stet lorem sit clita duo justo magna dolore erat amet"
        Replacement = "Experience the finest baked goods crafted with passion. Our bakery uses only premium ingredients to bring you authentic, mouth-watering pastries and breads every single day."
    },
    @{
        Pattern = "Tempor erat elitr rebum at clita\. Diam dolor diam ipsum sit diam amet diam et eos\.\s*Clita erat ipsum et lorem et sit\."
        Replacement = "Freshly baked delights made with love and care, bringing joy and sweetness to your everyday moments."
    },
    @{
        Pattern = "Vero elitr justo clita lorem\. Ipsum dolor sed stet\s*sit diam rebum ipsum\."
        Replacement = "Savor the rich, comforting flavors of our freshly baked artisanal treats."
    },
    @{
        Pattern = "Tempor erat elitr rebum at clita dolor diam ipsum sit diam amet diam et eos"
        Replacement = "Handcrafted with premium organic ingredients and absolute devotion."
    },
    @{
        Pattern = "Magna sea eos sit dolor, ipsum amet ipsum lorem diam eos"
        Replacement = "Authentic recipes layered with incredible, rich flavors."
    },
    @{
        Pattern = "Erat ipsum justo amet duo et elitr dolor, est duo duo eos lorem sed diam stet diam sed stet lorem\."
        Replacement = "Taste the dedication in every single bite from our community favorites."
    },
    @{
        Pattern = "Tempor erat elitr rebum at clita\."
        Replacement = "Baked with traditional techniques."
    },
    @{
        Pattern = "Diam dolor diam ipsum sit diam amet diam et eos\."
        Replacement = "Delicious treats baked perfectly for you."
    },
    @{
        Pattern = "Clita erat ipsum et lorem et sit\."
        Replacement = "Enjoy our gluten-free and vegan specialties."
    }
)

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file.FullName)
    $original = $content
    
    foreach ($r in $replacements) {
        $content = [System.Text.RegularExpressions.Regex]::Replace($content, $r.Pattern, $r.Replacement)
    }

    if ($content -cne $original) {
        [System.IO.File]::WriteAllText($file.FullName, $content, [System.Text.Encoding]::UTF8)
        Write-Output "Updated $($file.Name)"
    }
}
Write-Output "Dummy text replacement complete!"

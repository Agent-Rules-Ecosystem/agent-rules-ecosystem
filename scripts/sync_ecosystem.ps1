# ==============================================================================
# Agent Rules Ecosystem - Script de Sincronizacion Canonica (PowerShell)
# Organizacion: xolotl-hub (https://github.com/xolotl-hub)
#
# Uso:
#   cd \ruta\hacia\tu-directorio-raiz
#   powershell -ExecutionPolicy Bypass -File agent-rules-ecosystem\scripts\sync_ecosystem.ps1
# ==============================================================================

$GH_ORG = "xolotl-hub"

# Detectar directorio raiz (si se ejecuta dentro de agent-rules-ecosystem, subir un nivel)
$currentPath = Get-Location
if ((Split-Path -Leaf $currentPath) -eq "agent-rules-ecosystem") {
    $baseDir = Split-Path -Parent $currentPath
} else {
    $baseDir = $currentPath.Path
}

Write-Host "========================================================"
Write-Host "Sincronizando Ecosistema xolotl-hub"
Write-Host "Directorio Raiz: $baseDir"
Write-Host "========================================================"

$repos = @(
    # Cores de Gobernanza
    @{ Parent = "Backend"; Sub = ""; Name = "backend-agent-rules" },
    @{ Parent = "Flutter"; Sub = ""; Name = "flutter-agent-rules" },
    @{ Parent = "Game"; Sub = ""; Name = "game-agent-rules" },
    @{ Parent = "Web"; Sub = ""; Name = "web-agent-rules" },

    # Transversales
    @{ Parent = "Transversal"; Sub = ""; Name = "infra-agent-skill" },
    @{ Parent = "Transversal"; Sub = ""; Name = "monitoring-agent-skill" },
    @{ Parent = "Transversal"; Sub = ""; Name = "security-agent-skill" },

    # Skills Flutter
    @{ Parent = "Flutter"; Sub = "flutter-agent-skill"; Name = "flutter-bloc-patterns-agent-skill" },
    @{ Parent = "Flutter"; Sub = "flutter-agent-skill"; Name = "flutter-firebase-auth-agent-skill" },
    @{ Parent = "Flutter"; Sub = "flutter-agent-skill"; Name = "flutter-firebase-odoo-agent-skill" },

    # Skills Web
    @{ Parent = "Web"; Sub = "web-agent-skill"; Name = "web-svelte-patterns-agent-skill" },
    @{ Parent = "Web"; Sub = "web-agent-skill"; Name = "web-realtime-agent-skill" },
    @{ Parent = "Web"; Sub = "web-agent-skill"; Name = "three-js-agent-skills" },

    # Skills Backend
    @{ Parent = "Backend"; Sub = "backend-agent-skill"; Name = "backend-auth-oauth-agent-skill" },
    @{ Parent = "Backend"; Sub = "backend-agent-skill"; Name = "backend-graphql-agent-skill" },
    @{ Parent = "Backend"; Sub = "backend-agent-skill"; Name = "backend-stripe-agent-skill" },

    # Skills Game (Godot)
    @{ Parent = "Game"; Sub = "game-agent-skill"; Name = "godot-steamworks-agent-skill" },
    @{ Parent = "Game"; Sub = "game-agent-skill"; Name = "godot-firebase-agent-skill" },
    @{ Parent = "Game"; Sub = "game-agent-skill"; Name = "godot-mobile-monetization-agent-skill" },
    @{ Parent = "Game"; Sub = "game-agent-skill"; Name = "godot-dialogue-plugin-agent-skill" },
    @{ Parent = "Game"; Sub = "game-agent-skill"; Name = "godot-nakama-agent-skill" }
)

# 1. Crear carpetas principales
$categories = @("Backend", "Flutter", "Game", "Transversal", "Web")
foreach ($cat in $categories) {
    $catPath = Join-Path $baseDir $cat
    if (-not (Test-Path $catPath)) {
        New-Item -ItemType Directory -Path $catPath | Out-Null
    }
}

# 2. Procesar cada repositorio
foreach ($item in $repos) {
    $parent = $item.Parent
    $sub = $item.Sub
    $name = $item.Name

    if ($sub -ne "") {
        $parentPath = Join-Path (Join-Path $baseDir $parent) $sub
    } else {
        $parentPath = Join-Path $baseDir $parent
    }

    if (-not (Test-Path $parentPath)) {
        New-Item -ItemType Directory -Path $parentPath | Out-Null
    }

    $targetPath = Join-Path $parentPath $name
    $gitPath = Join-Path $targetPath ".git"
    $repoUrl = "https://github.com/$GH_ORG/$name.git"

    Write-Host "--------------------------------------------------------"
    Write-Host "Procesando: $parent / $sub / $name"

    if (Test-Path $gitPath) {
        Write-Host "OK: Repositorio presente en $targetPath."
        $remotes = git -C "$targetPath" remote 2>$null
        if ($remotes -contains "origin") {
            Write-Host "   Actualizando desde origin..."
            git -C "$targetPath" pull origin main 2>$null | Out-Null
        }
    } else {
        Write-Host "Clonando $name desde $repoUrl ..."
        git clone "$repoUrl" "$targetPath" 2>$null
        if (-not (Test-Path $gitPath)) {
            Write-Host "AVISO: Remoto no disponible. Inicializando git localmente..."
            if (-not (Test-Path $targetPath)) {
                New-Item -ItemType Directory -Path $targetPath | Out-Null
            }
            git -C "$targetPath" init
        }
    }
}

Write-Host "========================================================"
Write-Host "Estructura completada y sincronizada correctamente."
Write-Host "========================================================"

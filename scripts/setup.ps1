clear-host

$misc = join-path $PSScriptRoot 'helpers/misc.ps1'
. $misc

$path_root      = git rev-parse --show-toplevel
$path_build     = join-path $path_root 'build'
$path_toolchain = join-path $path_root 'toolchain'

verify-path $path_toolchain

$url_godot = 'https://github.com/godotengine/godot.git'

$path_godot        = join-path $path_toolchain 'godot'
$path_godot_editor = join-path $path_godot 'bin/godot.windows.editor.x86_64.exe'

$script_godot_setup_repo = join-path $PSScriptRoot 'godot_setup_repo.ps1'

# update-gitrepo -path $path_godot -url $url_godot -build_command $script_godot_setup_repo


$path_pong        = join-path $path_root '1_pong'
$path_pong_gdproj = join-path $path_pong 'project/project.godot'

New-GodotProjectShortcut                `
    -shortcut_name   '1_pong'           `
    -godot_path      $path_godot_editor `
    -project_path    $path_pong_gdproj  `
    -shortcut_folder $path_pong         `
    # -IconPath "C:\Path\To\CustomIcon.ico"

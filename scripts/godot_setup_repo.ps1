$godot_4_2_1_stable_tagged_commit = 'b09f793f564a6c95dc76acc654b390e68441bd01'

& git checkout $godot_4_2_1_stable_tagged_commit

$scons_args = @()
$scons_args += 'platform=windows'
# $scons_args += 'target=template_debug'
$scons_args += 'target=editor'
$scons_args += 'debug_symbols=true'
$scons_args += 'dev_bulid=true'
$scons_args += 'progress=true'
$scons_args += 'optimize=debug'
$scons_args += 'num_jobs=15'

& scons $scons_args



define dconf_profile::systemdb::lock(
	$keys		= undef,
	$lockfilename	= '10-puppet-managed-settings',
) {

	if ($keys != undef) {
		validate_array($keys)
	}
	else {
		fail('dconf_profile::systemdb::lock: keys array empty')
	}
	$filename 	= "/etc/dconf/db/local.d/locks/$lockfilename"
	validate_absolute_path($filename)
	
	file { $filename:
		owner		=> root,
		group		=> root,
		mode		=> 0644,
		content		=> template("${module_name}/lock.erb"),
		notify		=> Exec['/usr/bin/dconf update'],
	}

}

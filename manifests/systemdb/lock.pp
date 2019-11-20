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
	
	file { "/etc/dconf/db/local.d/locks/${lockfilename}":
		owner		=> root,
		group		=> root,
		mode		=> 0644,
		content		=> template("${module_name}/lock.erb"),
	}~>
	exec { 'touch /etc/dconf/db/local.d/locks':
		# Workaround for https://gitlab.gnome.org/GNOME/dconf/issues/11 .
		refreshonly	=> true,
		notify		=> Exec['/usr/bin/dconf update'],
	}

}

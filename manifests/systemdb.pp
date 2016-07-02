define dconf_profile::systemdb(
	$schema		= $name,
	$key		= undef,
	$value		= undef,
	$keyfilename	= '10-puppet-managed-settings',
) {

	if (($schema != undef) and ($key != undef) and ($value != undef) and ($keyfilename != undef)) {
		ini_setting { "$schema/$key":
			ensure		=> present,
			path		=> "/etc/dconf/db/local.d/$keyfilename",
			section		=> $schema,
			setting		=> $key,
			value		=> $value,
			notify		=> Exec['/usr/bin/dconf update'],
		}
	}
	else {
		fail('dconf_profile::systemdb: At least one parameter is undefined')
	}

}

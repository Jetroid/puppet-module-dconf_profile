#dconf_profile

#### Table of Contents

1. [Overview](#overview)
2. [Parameters](#parameters)
3. [Limitations](#limitations)
4. [Release Notes](#release-notes)

## Overview

This module simply ensures that dconf is installed; a profile is added; and that the correct directories are present for keys to be added into.

dconf is used for low-level configuration and settings management.

This module also allows to manage system-db contents (key files and locks). For more information on dconf, have a look at [this dconf overview](https://developer.gnome.org/dconf/unstable/dconf-overview.html).

This module depends on the following puppet modules:

- [puppetlabs-stdlib](https://github.com/puppetlabs/puppetlabs-stdlib)
- [puppetlabs-inifile](https://github.com/puppetlabs/puppetlabs-inifile)

## Usage

Using this module without setting system-db contents just requires 

```puppet
include dconf_profile
```

An example how to set a system-db key is

```puppet
dconf_profile::systemdb { 'background picture':
        schema          => 'org/gnome/desktop/background',
        key             => 'picture-uri',
        value           => "'file:///path/to/background.png'",
}
```

An example how to set a system-db lock is

```puppet
dconf_profile::systemdb::lock { 'background lock':
        keys            => ['/org/gnome/desktop/background'],
}
```

## Parameters

None. 

## Limitations

Tested on Ubuntu 14.04 64bit/32bit and Ubuntu 16.04 64bit.

## Release Notes/Contributors/Etc 

0.1.0 - Initial Release 

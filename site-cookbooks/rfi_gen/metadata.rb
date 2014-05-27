name             'rfi_gen'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures rfi_gen'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports 'centos', '~> 6.0'
depends 'mysql'
depends 'database'
depends 'java'
depends 'play'

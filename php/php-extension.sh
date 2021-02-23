#List out all php extension
php -r "print_r(get_loaded_extensions());"
#Check extension location
php -i | grep extension_dir
#Check php.ini location
php -i | grep 'php.ini'
#Check php-fpm log
php -i | grep 'php-error.log'

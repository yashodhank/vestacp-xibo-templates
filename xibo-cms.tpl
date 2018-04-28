<VirtualHost %ip%:%web_port%>

    ServerName %domain_idn%
    %alias_string%
    ServerAdmin %email%

    DocumentRoot %docroot%/cms/web/

    ScriptAlias /cgi-bin/ %home%/%user%/web/%domain%/cgi-bin/
    Alias /vstats/ %home%/%user%/web/%domain%/stats/
    Alias /error/ %home%/%user%/web/%domain%/document_errors/

    #SuexecUserGroup %user% %group%
    CustomLog /var/log/%web_system%/domains/%domain%.bytes bytes
    CustomLog /var/log/%web_system%/domains/%domain%.log combined
    ErrorLog /var/log/%web_system%/domains/%domain%.error.log

    KeepAlive Off
    # XSendFile Apache2 Module works optionally if installed or ignored.
    <IfModule mod_xsendfile.c>
    XSendFile on
    XSendFilePath %docroot%/cms/library
    </IfModule>

    <Directory %docroot%/cms/web/>
        DirectoryIndex index.php index.html
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Require all granted

        #PHP Value Overrides
        php_admin_value session.gc_maxlifetime 1440
        php_admin_value upload_max_filesize 2G
        php_admin_value max_execution_time 300
        php_admin_value post_max_size  2G
        php_admin_value memory_limit 1024M
        php_admin_value always_populate_raw_post_data -1
        php_admin_value max_input_vars 10000
        php_admin_value max_input_time 300

        # Disabled by Default but can be enabled as necessary.
        #php_admin_value open_basedir %docroot%/_data:%docroot%/cms/library:%docroot%/cms/web:%home%/%user%/tmp:/dev/urandom
        php_admin_value open_basedir none

        php_admin_value upload_tmp_dir %home%/%user%/tmp
        php_admin_value session.save_path %home%/%user%/tmp
    </Directory>

    <Directory %home%/%user%/web/%domain%/stats>
        AllowOverride All
    </Directory>

    <IfModule mod_ruid2.c>
        RMode config
        RUidGid %user% %group%
        RGroups www-data
    </IfModule>
    <IfModule itk.c>
        AssignUserID %user% %group%
    </IfModule>

    IncludeOptional %home%/%user%/conf/web/%web_system%.%domain_idn%.conf*

</VirtualHost>

# VestaCP Xibo Templates
## Apache2
Templates for VestaCP to be used with Apache2 for Xibo CMS standard installation.

#### How to use this Template with VestaCP?
```sh
$ cd /usr/local/vesta/data/templates/web/apache2
$ wget https://github.com/yashodhank/vestacp-xibo-templates/raw/master/xibo-cms.tpl
$ service vesta restart
```

##### Where to place Xibo CMS Files?
As per template `DocumentRoot` is `%docroot%/cms/web/`.

For example, you are user `user1` in VestaCP with domain name `user1-example.ext`
then your `DocumentRoot` will be set as ``/home/user1/web/user1-example.ext/public_html/cms/web/``

 - Make sure to extract Xibo CMS archive downloaded under `public_html` with first directory named as `cms`.
`cms` directory should have usual directories such as `bin`, `cache`, `custom`, `install`, `modules`, `tasks`, `views`, etc. including `web` & `library`.
 - Media Library directory reqired by Xibo CMS during installation should be empty and must be located under `../public_html/cms/library/` 
 
 > It is essentinal that `../public_html/cms/` diectory must have `web` and `library` to make this template work.
> Do not forget to restart Apache2 service after changing tamplete from VestaCP to `xibo-cms`

__Note:__
* Tasted on Xibo CMS 1.8.9 & maybe compatible with 1.8.X as well.
> Nginx version coming soon

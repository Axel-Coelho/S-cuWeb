Requirements :
- PHP 7.4
- MySQL 5.7
- Composer

Installation :
- Importer la base de données et insérer les informations dans le .env :

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=mdproject-ecommerce
DB_USERNAME=root
DB_PASSWORD=root

- Installer Composer :
Composer install

- Générer la clé de l'application : 
php artisan key:generate

- Relier le dossier storage au dossier public : 
php artisan storage:link

- Effectuer les migrations de la base de données : 
php artisan migrate

- Lancer les seeders de la base de données : 
php artisan db:seed

- Lancer le projet : 
php artisan serve
#!/bin/bash
docker exec -i medical_panel_api bash -c "cd /var/www && composer install && php artisan migrate"
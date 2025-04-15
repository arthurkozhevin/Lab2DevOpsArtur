python manage.py migrate

python manage.py shell -c "
from django.contrib.auth import get_user_model;
User = get_user_model();
if not User.objects.filter(username='admin').exists():
    User.objects.create_superuser('admin', 'admin@example.com', 'admin')
"

python manage.py collectstatic --noinput

python manage.py runserver 0.0.0.0:8080
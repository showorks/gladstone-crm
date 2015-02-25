# Gladstone CRM


## Heroku Configuration

Set keys:
figaro heroku:set -e production

Push DB to Heroku (overwrites Heroku)
heroku pg:push gladstone_crm X_REMOVETHIS_HEROKU_POSTGRESQL_WHITE --app gladstone-crm

Get DB from Heroku (overwrites local)
heroku pg:pull HEROKU_POSTGRESQL_WHITE gladstone_crm --app gladstone-crm

import os

with open('/run/secrets/pgadmin_secret', 'r') as f:
    OIDC_CLIENT_SECRET = f.read().strip()

AUTHELIA_DOMAIN = 'auth.homelab.cz:8989'

#AUTHENTICATION_SOURCES = ['oauth2', 'internal']
AUTHENTICATION_SOURCES = ['oauth2'] # <DISABLE_FIRST_SETUP>
OAUTH2_AUTO_CREATE_USER = True
OAUTH2_CONFIG = [{
    'OAUTH2_NAME': 'Authelia',
    'OAUTH2_DISPLAY_NAME': 'Authelia',
    'OAUTH2_CLIENT_ID': 'pgadmin',
    'OAUTH2_CLIENT_SECRET': OIDC_CLIENT_SECRET,
    'OAUTH2_API_BASE_URL': f'https://{AUTHELIA_DOMAIN}',
    'OAUTH2_AUTHORIZATION_URL': f'https://{AUTHELIA_DOMAIN}/api/oidc/authorization',
    'OAUTH2_TOKEN_URL': f'https://{AUTHELIA_DOMAIN}/api/oidc/token',
    'OAUTH2_USERINFO_ENDPOINT': f'https://{AUTHELIA_DOMAIN}/api/oidc/userinfo',
    'OAUTH2_SERVER_METADATA_URL': f'https://{AUTHELIA_DOMAIN}/.well-known/openid-configuration',
    'OAUTH2_SCOPE': 'openid email profile',
    'OAUTH2_USERNAME_CLAIM': 'email',
    'OAUTH2_ICON': 'fa-openid',
    'OAUTH2_BUTTON_COLOR': '#000000',
    'OAUTH2_CHALLENGE_METHOD': 'S256',
    'OAUTH2_RESPONSE_TYPE': 'code',
}]


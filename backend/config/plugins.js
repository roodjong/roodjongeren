module.exports = ({env}) => ({
  i18n: true,
  'users-permissions': {
    jwtSecret: env('JWT_SECRET')
  }
});

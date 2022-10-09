module.exports = ({env}) => ({
  i18n: true,
  'users-permissions': {
    jwtSecret: env('JWT_SECRET')
  }
  email: {
    config: {
      provider: 'nodemailer',
      providerOptions: {
        host: env('SMTP_HOST', 'mail.zxcs.nl'),
        port: env('SMTP_PORT', 465),
        auth: {
          user: env('SMTP_USERNAME'),
          pass: env('SMTP_PASSWORD'),
        },
      },
      settings: {
        defaultFrom: 'noreply-website@roodjongeren.nl',
        defaultReplyTo: 'info@roodjongeren.nl',
      },
    },
  },
});

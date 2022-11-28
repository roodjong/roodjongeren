'use strict';

/**
 * petition-signature router.
 */


module.exports = {
  routes: [
    {
      method: "POST",
      path: '/petition-signatures',
      handler: 'petition-signature.add',
    },
    {
      method: "GET",
      path: '/petition-signatures/confirm/:confirmationCode',
      handler: 'petition-signature.confirm',
    }
  ],
}

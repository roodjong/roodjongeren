'use strict';

const {slugify} = require('../../../../util/slugify');

module.exports = {
  async beforeCreate(event) {
    await updateSlug(event);
  },
  async beforeUpdate(event) {
    await updateSlug(event);
  },
};

async function updateSlug(event) {
  if (event.params.data.name) {
    event.params.data.slug = await slugify(event);
  }
}

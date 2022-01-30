module.exports = {
  async slugify(event) {
    const data = event.params.data;
    const contentTypeUID = event.model.uid;
    return await strapi.plugins['content-manager'].services.uid.generateUIDField({
      contentTypeUID,
      field: 'slug',
      data,
    });
  }
}

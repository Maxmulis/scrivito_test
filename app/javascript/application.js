//= require jquery
//= require scrivito
//= require bootstrap-sprockets
const loadFilters = () => {
  scrivito.on('load', function () {
    scrivito.content_browser.filters = {
      obj_class: {
        field: '_obj_class',
        options: {
          images: {
            title: 'Images',
            value: 'Image',
            icon: 'images'
          },
          pages: {
            icon: 'copy',
            options: {
              content_pages: {
                title: 'Content Pages',
                value: 'ContentPage',
                icon: 'sheet'
              },
              search_pages: {
                title: 'Search Pages',
                value: 'SearchPage',
                icon: 'sheet'
               }        
            }
          }
        }
      }
    }
  });
}

loadFilters();
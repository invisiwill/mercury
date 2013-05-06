# Configuration.
#------------------------------------------------------------------------------
#= require mercury/config
#
# Mercury dependencies and core libary.
#------------------------------------------------------------------------------
#= require mercury/dependencies
#= require mercury/mercury
#
# All region types.
#------------------------------------------------------------------------------
#= require mercury/regions
#
# All locales.
#------------------------------------------------------------------------------
#= require mercury/locales
#
# Additional functionality.
#------------------------------------------------------------------------------
# You can require any files that add additional functionality to Mercury here.
#
# Initialize Mercury.
jQuery ->
  # First do anything nessicary for Ajax requests to be successful -- in our case we need the csrf token for Rails.
  $.ajaxSetup headers: {'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')}

  # To initialize Mercury call Mercury.init. This will use the interface configuration and instantiate the configured
  # interface, which in turn instantiates the interface elements and regions. In our demo we allow using an iframe
  # (which should be provided by you and in the dom), and if the iframe isn't available the standard non-iframe
  # interface will be used.
  #
  # For more information about the Mercury API, you might want to check the developer_interface in examples. It contains
  # examples for creating / releasing / deleting dynamic regions, saving, toggling the interface, keeping Mercury
  # focused, how you can use the Mercury Core library as a framework to build a custom interface, and more.
  Mercury.init(frame: '#mercury_frame')

Mercury.Region.Markdown.addToolbar 'history', history: ['History', plugin: 'history']
Mercury.Region.Markdown.addToolbar 'color', color: ['Color', plugin: 'color']
Mercury.Region.Markdown.addToolbar 'block', block: ['Block', plugin: 'blocks']

# todo:
#   port jQuery.extend into module so we can use that within instances (which is where it's mostly used).
#   start working on the mercury-rails engine so it's easier to write plugins that use a server.
#   migrate existing locale content into new locales and document missing values.
#   make region use the shadow dom if possible/configured to do so.
#   make table/media/link plugins use custom actions.
#   better strategy for snippet management/removal -- focusable with toolbar buttons would be nice, combined with a lesser toolbar in line? (drag handle on hover, etc?)
#   figure out how to better integrate snippets.
#   can we make editing content within snippets work?
#   html/plain: when using the iframe, rangy isn't behaving the same (doesn't work because it doesn't understand the context).
#   html: selections are a little wonky on undo/redo still, and sometimes in firefox they're not applying because the checksum doesn't validate.
# todo regions:
#   add list region (sort of like workflowy)
#   add table region (sort of like a spreadsheet, but with no math -- maybe math?)
#   add canvas region (save/load as base64 image)
#   add more control to image region (resize, crop)
#   finish html region
#   polish markdown region (if you're not dead from the html region)

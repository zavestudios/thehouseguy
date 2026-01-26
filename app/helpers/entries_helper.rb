# frozen_string_literal: true

module EntriesHelper
  def safe_entry_url(entry)
    raw = entry&.url.to_s
    uri = URI.parse(raw)
    return raw if uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS)

    nil
  rescue URI::InvalidURIError
    nil
  end
end
